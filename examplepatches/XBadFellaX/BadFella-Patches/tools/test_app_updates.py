from base64 import b64encode
import json
import unittest
from unittest.mock import patch

import app_updates as monitor


def listing(version, url='https://example.com/app'):
    return {'version': version, 'url': url}


class UpdateTests(unittest.TestCase):
    def test_catalog_uses_highest_declared_target_across_patches(self):
        app = {'packageName': 'app', 'name': 'App', 'targets': [{'version': '1.2'}, {'version': None}]}
        older = {**app, 'targets': [{'version': '1.0'}]}
        unpinned = {'packageName': 'other', 'name': 'Other', 'targets': []}
        catalog = {'patches': [{'compatiblePackages': [app, unpinned]}, {'compatiblePackages': [older]}]}
        apps = monitor.catalog_apps(catalog, 'Private', {'app': '1.1', 'other': '2.0'})
        self.assertEqual(apps['app']['supported'], '1.2')
        self.assertEqual(apps['app']['target'], '1.2')
        self.assertEqual(apps['other']['supported'], '2.0')
        self.assertIsNone(apps['other']['target'])

    @patch.dict(monitor.os.environ, {'GITHUB_REPOSITORY': 'owner/repo'})
    @patch.object(monitor, 'api')
    def test_preview_uses_the_advertised_uploaded_asset_and_tagged_catalog(self, api):
        version = '1.8.0-dev.2'
        url = f'https://github.com/owner/repo/releases/download/v{version}/patches-{version}.mpp'
        catalog = {'version': version, 'patches': []}
        manifest = {'version': version, 'download_url': url}
        release = {'tag_name': f'v{version}', 'draft': False, 'prerelease': True,
                   'assets': [{'state': 'uploaded', 'browser_download_url': url}]}

        def encoded(value):
            return {'content': b64encode(json.dumps(value).encode()).decode()}

        api.side_effect = [encoded(manifest), release, encoded(catalog)]
        self.assertEqual(monitor.published_dev_catalog('1.7.0'), catalog)
        self.assertEqual([call.args[0] for call in api.call_args_list], [
            '/contents/patches-bundle.json?ref=dev', f'/releases/tags/v{version}',
            f'/contents/patches-list.json?ref=v{version}',
        ])
        api.side_effect = [encoded(manifest), {**release, 'assets': []}]
        self.assertIsNone(monitor.published_dev_catalog('1.7.0'))
        api.side_effect = [encoded(manifest)]
        self.assertIsNone(monitor.published_dev_catalog('1.8.0'))

    def test_apkmirror_selects_highest_stable_version_before_publication_time(self):
        beta = b"""<item><title>App 2.1 beta by Author</title>
<pubDate>Thu, 19 Nov 2026 18:11:38 +0000</pubDate>
<link>https://www.apkmirror.com/apk/example/app/beta/</link></item>"""
        older = b"""<item><title>App 1.9 by Author</title>
<pubDate>Fri, 20 Nov 2026 18:11:38 +0000</pubDate>
<link>https://www.apkmirror.com/apk/example/app/older/</link></item>"""
        stable = b"""<item><title>App 2.0 by Author</title><pubDate>Wed, 18 Nov 2026 18:11:38 +0000</pubDate>
<link>https://www.apkmirror.com/apk/example/app/stable/</link></item>"""
        feed = b'<rss><channel>' + beta + older + stable + b'</channel></rss>'
        self.assertEqual(monitor.mirror_latest(feed, 'example/app')['version'], '2.0')
        with self.assertRaises(ValueError):
            monitor.mirror_latest(feed, 'other/app')
        beta_only = b'<rss><channel>' + beta + b'</channel></rss>'
        self.assertEqual(monitor.mirror_latest(beta_only, 'example/app'), {'status': 'No stable version in feed'})

    @patch.object(monitor, 'request')
    def test_apkmirror_search_verifies_package_and_rejects_ambiguity(self, request):
        request.side_effect = [b'<a href="/apk/team/app/"><a href="/apk/team/watch/">',
                               b'<a href="https://play.google.com/store/apps/details?id=example.app">',
                               b'<a href="https://play.google.com/store/apps/details?id=example.app">']
        self.assertEqual(monitor.mirror_listing('example.app', None), {'status': 'Ambiguous listing'})

    @patch.object(monitor, 'request')
    def test_apkpure_maps_only_requested_packages(self, request):
        request.return_value = b'{"retcode":0,"app_update_response":[{"package_name":"app","version_name":"2.0"}]}'
        self.assertEqual(monitor.pure_latest(['app']), {'app': listing('2.0', 'https://apkpure.com/p/app')})
        self.assertEqual(monitor.pure_latest(['other']), {})
        request.return_value = request.return_value.replace(b'2.0', b'2.0-beta2')
        self.assertEqual(monitor.pure_latest(['app']), {'app': {'status': 'Prerelease excluded'}})

    def test_google_play_handles_numeric_opaque_and_missing_versions(self):
        for version in ['2.10.3', 'a1b2c3', 'Varies with device']:
            row = [None] * 141
            row[140] = [[[version]]]
            raw = "AF_initDataCallback({key: 'ds:5', data:" + json.dumps([None, [None, None, row]]) + '});'
            expected = ({'status': 'Version unavailable'} if version == 'Varies with device'
                        else listing(version, 'https://play.google.com/store/apps/details?id=example.app'))
            self.assertEqual(monitor.play_latest(raw.encode(), 'example.app'), expected)
        with self.assertRaises(ValueError):
            monitor.play_latest(b'<html>Consent required</html>', 'example.app')
        self.assertEqual(monitor.play_latest(raw.replace('Varies with device', '2.1 Beta').encode(), 'example.app'),
                         {'status': 'Prerelease excluded'})

    @patch.object(monitor, 'play_listing', return_value=listing('2.1'))
    @patch.object(monitor, 'mirror_listing', side_effect=OSError)
    @patch.object(monitor, 'pure_latest', return_value={'app': listing('2.0')})
    @patch.object(monitor, 'request', side_effect=OSError)
    def test_every_source_is_checked_even_if_one_fails(self, request, pure, mirror, play):
        row = monitor.collect({'app': {}}, {'app': 'example/app'})['app']
        self.assertEqual(set(row), set(monitor.SOURCES))
        self.assertEqual(row['APKMirror'], {'status': 'Check failed'})
        self.assertEqual(row['APKPure'], listing('2.0'))
        self.assertEqual(row['Google Play'], listing('2.1'))
        self.assertEqual(request.call_count, 6)
        pure.assert_called_once_with(['app'])
        mirror.assert_called_once_with('app', 'example/app')
        play.assert_called_once_with('app')

    def test_comparison_selects_single_link_and_marks_ties(self):
        sources = dict.fromkeys(monitor.SOURCES, listing('2.0'))
        result = monitor.compare('app', sources, '1.0')
        self.assertEqual(result, ('APKMirror', list(monitor.SOURCES), 'Newer than worked on', 0))
        sources['Google Play'] = listing('2.1')
        self.assertEqual(monitor.compare('app', sources, '1.0')[0], 'Google Play')

    def test_comparison_flags_linkedin_and_opaque_disagreement(self):
        sources = {'APKMirror': listing('4.1.1279 beta'), 'APKPure': listing('6.1.1'), 'Google Play': listing('4.1.1276')}
        self.assertIn('version line differs', monitor.compare('com.linkedin.android', sources, '4.1.1276')[2])
        sources['APKPure'] = listing('abc123')
        self.assertIn('version formats differ', monitor.compare('app', sources, '1.0')[2])

    @patch.object(monitor, 'request')
    def test_apkcube_checks_package_card_version_without_download(self, request):
        request.return_value = b'<svg xmlns="http://www.w3.org/2000/svg"><text>4.2  &#183;  v8.1.0</text></svg>'
        self.assertEqual(monitor.cube_listing('example.app'), listing('8.1.0', 'https://apkcube.com/apk-downloader?url=example.app'))
        self.assertIn('/embed/card/example.app', request.call_args.args[0])
        request.return_value = request.return_value.replace(b'8.1.0', b'8.1.1 beta')
        self.assertEqual(monitor.cube_listing('example.app'), {'status': 'Prerelease excluded'})

    @patch.object(monitor, 'request')
    def test_fdroid_uses_the_repository_suggested_release(self, request):
        request.return_value = json.dumps({'packageName': 'example.app', 'suggestedVersionCode': 20, 'packages': [
            {'versionName': '2.1 beta', 'versionCode': 21}, {'versionName': '2.0', 'versionCode': 20},
        ]}).encode()
        self.assertEqual(monitor.fdroid_listing('example.app', 'https://example.com', 'https://example.com/packages'),
                         listing('2.0', 'https://example.com/packages/example.app/'))
        with self.assertRaises(ValueError):
            monitor.fdroid_listing('another.app', 'https://example.com', 'https://example.com/packages')

    @patch.object(monitor, 'request')
    def test_github_requires_a_stable_release_with_an_uploaded_apk(self, request):
        release = {'tag_name': 'v2.0', 'html_url': 'https://github.com/owner/app/releases/tag/v2.0', 'draft': False,
                   'prerelease': False, 'assets': [{'state': 'uploaded', 'name': 'app.apk'}]}
        request.return_value = json.dumps([
            {**release, 'tag_name': 'v2.2', 'assets': []},
            {**release, 'tag_name': 'v2.1', 'prerelease': True}, release,
        ]).encode()
        self.assertEqual(monitor.repository_listing('GitHub', 'owner/app'), listing('2.0', release['html_url']))

    def test_dashboard_shows_dev_difference_and_links_every_version(self):
        apps = {'app': {'name': 'App', 'target': '1.0', 'supported': '1.0'},
                'app2': {'name': 'Equal', 'target': '1.1', 'supported': '1.1'}}
        sources = {'APKMirror': listing('2.1', 'https://example.com/mirror'),
                   'APKPure': listing('2.0', 'https://example.com/pure'),
                   'Google Play': {'status': 'Version unavailable'}}
        equal = dict.fromkeys(monitor.SOURCES, listing('1.1'))
        dev = {'patches': [{'compatiblePackages': [
            {'packageName': 'app', 'name': 'App', 'targets': [{'version': '3.0'}]},
            {'packageName': 'app2', 'name': 'Equal', 'targets': [{'version': '1.1'}]},
        ]}]}
        body = monitor.dashboard(apps, {'app': sources, 'app2': equal}, 'Public', dev)
        self.assertIn('| **App** | 1.0 | 3.0 | **[APKMirror · 2.1]', body)
        self.assertIn('| **Equal** | 1.1 | — |', body)
        self.assertIn('Google Play · Version unavailable', body)
        self.assertLess(body.index('Newer builds to review'), body.index('Other source comparisons'))
        self.assertIn('**[APKMirror 2.1](https://example.com/mirror)**', body)
        self.assertIn('[APKPure 2.0](https://example.com/pure)', body)

    @patch.object(monitor, 'api')
    @patch.object(monitor, 'send_email')
    def test_issue_edit_queues_email_and_unchanged_run_is_silent_after_delivery(self, send, api):
        path = '/issues/12'
        previous = {'body': 'old', 'html_url': 'https://github.example/issues/12'}
        monitor.update_issue(path, previous, 'new', 'Public', '')
        queued = api.call_args.args[1]['body']
        self.assertTrue(queued.endswith(monitor.EMAIL_PENDING))
        self.assertEqual(api.call_args.args[::2], (path, 'PATCH'))
        send.assert_not_called()
        api.reset_mock()
        monitor.update_issue(path, {**previous, 'body': queued}, 'new', 'Public', '{}')
        send.assert_called_once_with({}, previous['html_url'], 'Public')
        api.assert_called_once_with(path, {'body': 'new'}, 'PATCH')
        api.reset_mock()
        send.reset_mock()
        monitor.update_issue(path, {**previous, 'body': 'new'}, 'new', 'Public', '{}')
        api.assert_not_called()
        send.assert_not_called()

    @patch.object(monitor, 'api')
    @patch.object(monitor, 'send_email', side_effect=OSError)
    def test_failed_email_keeps_pending_marker(self, send, api):
        previous = {'body': 'old', 'html_url': 'https://github.example/issues/12'}
        with self.assertRaisesRegex(SystemExit, 'will retry'):
            monitor.update_issue('/issues/12', previous, 'new', 'Public', '{}')
        api.assert_called_once_with('/issues/12', {'body': 'new\n' + monitor.EMAIL_PENDING}, 'PATCH')

    @patch.object(monitor.smtplib, 'SMTP')
    def test_email_uses_tls_and_sends_only_dashboard_link(self, smtp):
        config = {'host': 'mail.example.com', 'username': 'sender@example.com',
                  'password': 'fake', 'to': 'owner@example.com'}
        monitor.send_email(config, 'https://github.example/issues/12', 'Private')
        session = smtp.return_value.__enter__.return_value
        session.starttls.assert_called_once()
        session.login.assert_called_once_with(config['username'], 'fake')
        message = session.send_message.call_args.args[0]
        self.assertEqual(message['To'], config['to'])
        self.assertIn('https://github.example/issues/12', message.get_content())

    @patch.dict(monitor.os.environ, {'APP_UPDATE_ISSUE': '1'})
    @patch('sys.argv', ['app_updates.py', '--catalog-name', 'Private'])
    @patch.object(monitor.Path, 'read_text', return_value='{"patches":[{"compatiblePackages":[{"packageName":"app","name":"App","targets":[]}]}]}')
    @patch.object(monitor, 'api', return_value={'private': False})
    @patch.object(monitor, 'collect')
    def test_private_catalog_cannot_publish_in_public_repository(self, collect, api, read_text):
        with self.assertRaisesRegex(ValueError, 'visibility must match'):
            monitor.main()
        collect.assert_not_called()


if __name__ == '__main__':
    unittest.main()
