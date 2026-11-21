import unittest
from unittest.mock import patch

import app_updates as monitor


def item(order=10, source='APKMirror'):
    return {'order': order, 'title': 'App 2.0 beta', 'url': 'https://www.apkmirror.com/apk/example/app/2/', 'source': source}


class UpdateTests(unittest.TestCase):
    def test_snapshot_then_unchanged_run_is_silent(self):
        state, changed, notify = monitor.advance({}, {'app': item()}, {})
        self.assertEqual(changed, ['app'])
        self.assertTrue(notify)
        self.assertEqual(monitor.advance(state, {'app': item()}, {}), (state, [], False))

    def test_new_release_and_provider_baselines(self):
        previous = {'latest': {'app': item()}, 'errors': {}}
        self.assertEqual(monitor.advance(previous, {'app': item(11)}, {})[1:], (['app'], True))
        self.assertEqual(monitor.advance(previous, {'app': item(1, 'APKPure')}, {})[1:], (['app'], True))

    def test_older_listing_does_not_replace_newer_state(self):
        previous = {'latest': {'app': item()}, 'errors': {}}
        self.assertEqual(monitor.advance(previous, {'app': item(9)}, {}), (previous, [], False))

    def test_failure_preserves_baseline_and_only_notifies_on_transition(self):
        previous = {'latest': {'app': item()}, 'errors': {}}
        state, changed, notify = monitor.advance(previous, {}, {'app': 'HTTPError'})
        self.assertTrue(notify)
        self.assertEqual(state['latest'], previous['latest'])
        self.assertEqual(changed, [])
        self.assertFalse(monitor.advance(state, {}, {'app': 'HTTPError'})[2])
        self.assertTrue(monitor.advance(state, {'app': item()}, {})[2])

    def test_feed_uses_publication_date_and_validates_app_link(self):
        feed = b'''<rss><channel><item><title>App 2 beta</title>
<pubDate>Thu, 19 Nov 2026 18:11:38 +0000</pubDate>
<link>https://www.apkmirror.com/apk/example/app/2/</link></item>
<item><title>App 1</title><pubDate>Wed, 18 Nov 2026 18:11:38 +0000</pubDate>
<link>https://www.apkmirror.com/apk/example/app/1/</link></item></channel></rss>'''
        self.assertEqual(monitor.mirror_latest(feed, 'example/app')['title'], 'App 2 beta')
        with self.assertRaises(ValueError):
            monitor.mirror_latest(feed, 'different/app')
        with self.assertRaises(ValueError):
            monitor.mirror_latest(b'<rss><channel/></rss>', 'example/app')

    def test_catalog_deduplicates_and_keeps_wildcard_out_of_target(self):
        app = {'packageName': 'app', 'name': 'App', 'targets': [{'version': '1.0'}, {'version': None}]}
        apps = monitor.catalog_apps({'patches': [{'compatiblePackages': [app]}, {'compatiblePackages': [app]}]})
        self.assertEqual(apps, {'app': {'name': 'App', 'catalog': 'Public', 'supported': '1.0'}})

    def test_private_catalog_and_existing_state_extend_without_reset(self):
        app = {'packageName': 'private', 'name': 'Private app', 'targets': [{'version': '1.0'}]}
        apps = monitor.catalog_apps({'patches': [{'compatiblePackages': [app]}]}, 'Private')
        self.assertEqual(apps['private']['catalog'], 'Private')
        previous = {'latest': {'public': item()}, 'errors': {}}
        state, changed, notify = monitor.advance(previous, {'public': item(), 'private': item()}, {})
        self.assertEqual(changed, ['private'])
        self.assertTrue(notify)
        self.assertEqual(state['latest']['public'], previous['latest']['public'])
        body = monitor.message(apps, previous, state, changed)
        self.assertIn('| Private | Private app (1.0) |', body)
        self.assertFalse(monitor.advance(state, {'public': item(), 'private': item()}, {})[2])

    def test_reviewed_version_is_display_only_and_does_not_pin_catalog(self):
        app = {'packageName': 'app', 'name': 'App', 'targets': [{'version': None}]}
        catalog = {'patches': [{'compatiblePackages': [app]}]}
        apps = monitor.catalog_apps(catalog, 'Private', {'app': '2.10.3'})
        state, changed, _ = monitor.advance({}, {'app': item()}, {})
        body = monitor.message(apps, {}, state, changed)
        self.assertIn('| Private | App (2.10.3) |', body)
        self.assertNotIn('not version-pinned', body)
        self.assertIsNone(app['targets'][0]['version'])
        self.assertFalse(monitor.advance(state, {'app': item()}, {})[2])
        with self.assertRaises(ValueError):
            monitor.catalog_apps(catalog, reviewed_versions={'app': 123})
        with self.assertRaises(ValueError):
            monitor.catalog_apps(catalog, reviewed_versions=[])

    def test_public_play_metadata_is_parsed_as_json_without_execution(self):
        import json
        row = [None] * 141
        row[140] = [[['2.10.3']]]
        data = 'AF_initDataCallback({key: \'ds:5\', data:' + json.dumps([None, [None, None, row]]) + ', sideChannel:{}});'
        result = monitor.play_latest(data.encode(), 'example.app')
        self.assertEqual(result['title'], '2.10.3')
        self.assertEqual(result['order'], [2, 10, 3])
        with self.assertRaises(ValueError):
            monitor.play_latest(b'<html>Consent required</html>', 'example.app')
        with self.assertRaises(ValueError):
            monitor.play_latest(data.replace('2.10.3', 'Varies with device').encode(), 'example.app')

    @patch.object(monitor, 'request')
    def test_apkpure_maps_only_requested_apps(self, request):
        request.return_value = b'{"retcode":0,"app_update_response":[{"package_name":"app","version_name":"2.0","version_code":"123"}]}'
        self.assertEqual(monitor.pure_latest(['app'])['app']['order'], 123)
        self.assertEqual(monitor.pure_latest(['app'])['app']['url'], 'https://apkpure.com/p/app')
        self.assertEqual(monitor.pure_latest(['different']), {})
        request.return_value = b'{"retcode":1}'
        with self.assertRaises(ValueError):
            monitor.pure_latest(['app'])

    @patch.dict(monitor.os.environ, {'APP_UPDATE_ISSUE': '1'})
    @patch('sys.argv', ['app_updates.py', '--catalog-name', 'Private'])
    @patch.object(monitor.Path, 'read_text', return_value='{"patches":[{"compatiblePackages":[{"packageName":"app","name":"App","targets":[]}]}]}')
    @patch.object(monitor, 'api', return_value={'private': False})
    @patch.object(monitor, 'collect')
    def test_private_catalog_cannot_post_in_public_repository(self, collect, api, read_text):
        with self.assertRaisesRegex(ValueError, 'private repository'):
            monitor.main()
        collect.assert_not_called()

    @patch.dict(monitor.FEEDS, {}, clear=True)
    @patch.object(monitor, 'play_latest', return_value=item(11, 'Google Play'))
    @patch.object(monitor, 'request', return_value=b'page')
    @patch.object(monitor, 'pure_latest', return_value={'public': item(10, 'APKPure')})
    def test_provider_selection_only_checks_supplied_catalog(self, pure, request, play):
        found, errors = monitor.collect({'public': {}, 'selected-play': {}}, ['selected-play'])
        pure.assert_called_once_with(['public'])
        self.assertEqual(set(found), {'public', 'selected-play'})
        self.assertEqual(errors, {})
        self.assertEqual(request.call_count, 1)

    @patch.object(monitor, 'api')
    def test_state_comes_from_bot_comments_and_covers_all_pages(self, api):
        state = {'latest': {}, 'errors': {'app': 'HTTPError'}}
        body = monitor.MARKER + '{"latest":{},"errors":{"app":"HTTPError"}}\n-->'
        api.side_effect = [[{'user': {'login': 'someone'}, 'body': body}] * 100,
                           [{'user': {'login': 'github-actions[bot]'}, 'body': body}]]
        self.assertEqual(monitor.previous_state('1'), state)
        self.assertEqual(api.call_count, 2)


if __name__ == '__main__':
    unittest.main()
