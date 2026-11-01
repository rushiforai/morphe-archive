"""Run platform-independent Bright reader contracts against the production Java."""
from pathlib import Path
import os
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]


@unittest.skipUnless(shutil.which('javac') and shutil.which('java'), 'JDK required')
class BrightReaderTests(unittest.TestCase):
    def test_reader_contracts(self):
        self.run_contracts()

    def test_article_image_payloads(self):
        self.run_json_contracts('--images')

    def test_article_video_payloads(self):
        self.run_json_contracts('--videos')

    def run_json_contracts(self, mode):
        configured = os.environ.get('BRIGHT_TEST_JSON_JAR')
        jars = ([Path(configured)] if configured else sorted(
            (Path.home() / '.gradle/caches/modules-2/files-2.1/org.json/json').glob('*/*/json-*.jar')))
        if not jars:
            self.skipTest('org.json runtime required (BRIGHT_TEST_JSON_JAR or Gradle cache)')
        self.run_contracts(jars[-1], mode)

    def run_contracts(self, json_jar=None, mode=None):
        source = ROOT / 'extensions/bright/src/main/java/patches/bright'
        names = ['ArticleDocument', 'ArticleRef', 'ArticleRenderer', 'ArticleTransport',
                 'BrightPolicy', 'HmacArticleHeaderSigner', 'WebPolicies', 'NavigationState',
                 'BrightConsentScript', 'ArticleResult']
        if json_jar:
            names.append('ArticleParser')
        with tempfile.TemporaryDirectory() as directory:
            # NavigationState only uses WebView identity; no Android implementation is executed.
            webview = Path(directory) / 'android/webkit/WebView.java'
            webview.parent.mkdir(parents=True)
            webview.write_text('package android.webkit; public class WebView {}\n')
            compile_result = subprocess.run(
                ['javac', '-d', directory, *(['-cp', str(json_jar)] if json_jar else []),
                 str(webview), *[str(source / f'{name}.java') for name in names],
                 str(ROOT / 'tests/BrightReaderRegression.java')], capture_output=True, text=True)
            self.assertEqual(compile_result.returncode, 0, compile_result.stderr)
            classpath = directory + (os.pathsep + str(json_jar) if json_jar else '')
            result = subprocess.run(['java', '-cp', classpath, 'patches.bright.BrightReaderRegression',
                                     *([mode] if mode else [])],
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)


if __name__ == '__main__':
    unittest.main()
