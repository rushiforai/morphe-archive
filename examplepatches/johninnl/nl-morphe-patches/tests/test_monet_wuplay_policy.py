"""Exercise the dedicated publisher boundary rather than a generic catalog adapter."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
POLICY = ROOT / 'extensions/monet-wuplay/src/main/java/nl/johninnl/monetwuplay/WuplayCatalogPolicy.java'


class MonetWuplayPolicyTests(unittest.TestCase):
    def test_only_wuplay_preview_catalogs_are_admitted(self):
        self.assertTrue(POLICY.exists(), 'Dedicated Monet Wuplay catalog policy is not implemented')
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            probe = root / 'PolicyProbe.java'
            probe.write_text('''import nl.johninnl.monetwuplay.WuplayCatalogPolicy;
public class PolicyProbe {static void check(boolean ok){if(!ok)throw new AssertionError();}
public static void main(String[] args){
 check(WuplayCatalogPolicy.accepts("app.wuplay.androidtv","santodan-launcher/wuplay/p/catalog/42","Action","TYPE_PREVIEW"));
 for(String owner:new String[]{null,"com.nuvio.santodan","app.wuplay.androidtv.fake"})
  check(!WuplayCatalogPolicy.accepts(owner,"santodan-launcher/wuplay/p/catalog/42","Action","TYPE_PREVIEW"));
 for(String id:new String[]{null,"santodan-launcher/other","santodan-launcher/wuplay-spoof/x"})
  check(!WuplayCatalogPolicy.accepts("app.wuplay.androidtv",id,"Action","TYPE_PREVIEW"));
 check(!WuplayCatalogPolicy.accepts("app.wuplay.androidtv","santodan-launcher/wuplay/x","  ","TYPE_PREVIEW"));
 check(!WuplayCatalogPolicy.accepts("app.wuplay.androidtv","santodan-launcher/wuplay/x","Action","TYPE_OTHER"));
}}
''')
            subprocess.run(['javac', '-d', str(root), str(POLICY), str(probe)], check=True, capture_output=True)
            subprocess.run(['java', '-cp', str(root), 'PolicyProbe'], check=True, capture_output=True)
