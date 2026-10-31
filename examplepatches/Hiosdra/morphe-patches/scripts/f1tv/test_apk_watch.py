import argparse
import importlib.util
import json
from pathlib import Path
import sys
import tempfile
import types
import unittest
from unittest.mock import patch
from urllib.error import HTTPError


def load(name, filename):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(filename))
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


watch = load('watch', 'f1tv_apk_watch.py')
alerts = load('alerts', 'notify_apk_watch.py')


class WatchTests(unittest.TestCase):
    def test_mobile_release_selection_ignores_tv_external_and_old_order(self):
        page = '''<a href="/apk/f1-tv-3-0-9-release/">3.0.9-mobile</a>
        <a href="https://example.org/f1-tv-99-release/">99.0-mobile</a>
        <a href="/apk/f1-tv-99-release/">99.0-tv</a>
        <a href="/apk/f1-tv-3-0-10-release/">3.0.10-mobile</a>'''
        with patch.object(watch, 'fetch_apkmirror_page', return_value=page):
            self.assertEqual(watch.latest_apkmirror_release()[0], '3.0.10-mobile')

    def test_no_release_is_error(self):
        with patch.object(watch, 'fetch_apkmirror_page', return_value='<html>Challenge</html>'):
            with self.assertRaises(RuntimeError):
                watch.latest_apkmirror_release()

    def test_403_uses_browser_transport(self):
        requests = types.SimpleNamespace(
            get=unittest.mock.Mock(return_value=types.SimpleNamespace(
                status_code=200, text='listing', raise_for_status=lambda: None)),
            RequestsError=OSError)
        with patch.object(watch, 'urlopen', side_effect=HTTPError(watch.APK_MIRROR_URL, 403, 'Forbidden', {}, None)), \
             patch.dict(sys.modules, {'curl_cffi': types.SimpleNamespace(requests=requests)}):
            self.assertEqual(watch.fetch_apkmirror_page(), 'listing')
            self.assertEqual(requests.get.call_args.kwargs['impersonate'], 'chrome')

    def test_browser_failure_retries_and_remains_error(self):
        requests = types.SimpleNamespace(get=unittest.mock.Mock(side_effect=OSError('403')), RequestsError=OSError)
        with patch.object(watch, 'urlopen', side_effect=TimeoutError()), \
             patch.dict(sys.modules, {'curl_cffi': types.SimpleNamespace(requests=requests)}), \
             patch.object(watch.time, 'sleep'):
            with self.assertRaisesRegex(RuntimeError, 'unavailable'):
                watch.fetch_apkmirror_page()
            self.assertEqual(requests.get.call_count, 3)

    def test_result_states_and_fail_on_update(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / 'result.json'
            args = argparse.Namespace(result_file=path, fail_on_update=True)
            for latest, status in [('3.0.9-mobile', 'current'), ('3.0.10-mobile', 'current'), ('3.0.11-mobile', 'update')]:
                with patch.object(watch, 'latest_apkmirror_release', return_value=(latest, watch.APK_MIRROR_URL)), \
                     patch.object(watch, 'current_target', return_value=('3.0.10-mobile', 1)):
                    if status == 'update':
                        with self.assertRaises(RuntimeError):
                            watch.command_check(args)
                    else:
                        watch.command_check(args)
                    self.assertEqual(json.loads(path.read_text())['status'], status)
            with patch.object(watch, 'latest_apkmirror_release', side_effect=RuntimeError('403')):
                with self.assertRaises(RuntimeError):
                    watch.command_check(args)
                self.assertEqual(json.loads(path.read_text())['status'], 'error')

    def test_build_order(self):
        self.assertGreater(watch.version_key('3.0.49.4-SP166.4.1-release-R54.10-mobile'),
                           watch.version_key('3.0.49.4-SP166.4.1-release-R54.2-mobile'))


class AlertTests(unittest.TestCase):
    update = {'status': 'update', 'latest': '3.1-mobile', 'target': '3.0-mobile', 'url': watch.APK_MIRROR_URL}

    def test_current_makes_no_api_requests(self):
        api = unittest.mock.Mock()
        alerts.notify({'status': 'current'}, 'run', 'Hiosdra', api)
        api.assert_not_called()

    def test_new_version_assigns_owner(self):
        api = unittest.mock.Mock(side_effect=[[], {'html_url': 'issue'}])
        alerts.notify(self.update, 'run', 'Hiosdra', api)
        data = api.call_args.args[2]
        self.assertEqual(data['assignees'], ['Hiosdra'])
        self.assertIn('3.1-mobile', data['title'])

    def test_closed_update_not_duplicated_across_pages(self):
        unrelated = {'body': '', 'state': 'open'}
        existing = {'body': '<!-- f1tv-apk-update:3.1-mobile -->', 'state': 'closed', 'html_url': 'issue'}
        api = unittest.mock.Mock(side_effect=[[unrelated] * 100, [existing]])
        alerts.notify(self.update, 'run', 'Hiosdra', api)
        self.assertEqual(api.call_count, 2)

    def test_monitor_outage_has_separate_alert_and_reopens(self):
        existing = {'number': 7, 'body': '<!-- f1tv-apk-monitor-error -->', 'state': 'closed', 'html_url': 'issue'}
        api = unittest.mock.Mock(side_effect=[[existing], {}])
        alerts.notify({'status': 'error', 'error': '403'}, 'run', 'Hiosdra', api)
        self.assertEqual(api.call_args.args[:2], ('PATCH', 'issues/7'))
        self.assertIn('403', api.call_args.args[2]['body'])


if __name__ == '__main__':
    unittest.main()
