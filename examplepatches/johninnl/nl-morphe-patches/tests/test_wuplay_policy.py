"""Run the publisher's real Java identity/ownership policy on the JVM."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
POLICY = ROOT / 'extensions/wuplay/src/main/java/nl/johninnl/wuplay/CatalogPolicy.java'


class WuplayPolicyTests(unittest.TestCase):
    def test_stable_identity_and_scoped_removal(self):
        self.assertTrue(POLICY.is_file(), 'Wuplay catalog publisher policy is not implemented')
        with tempfile.TemporaryDirectory() as directory:
            out = Path(directory)
            harness = out / 'WuplayPolicyProbe.java'
            harness.write_text('''
import nl.johninnl.wuplay.CatalogPolicy;
import java.util.*;
public class WuplayPolicyProbe {
  static void check(boolean value) { if (!value) throw new AssertionError(); }
  public static void main(String[] args) {
    String a=CatalogPolicy.channelKey("profile/one",725338);
    check(a.equals(CatalogPolicy.channelKey("profile/one",725338)));
    check(a.startsWith("santodan-launcher/wuplay/"));
    check(!a.equals(CatalogPolicy.channelKey("profile/two",725338)));
    check(!a.equals(CatalogPolicy.channelKey("profile/one",725339)));
    Set<String> desired=new HashSet<>(Arrays.asList(a));
    check(!CatalogPolicy.remove("app.wuplay.androidtv",a,desired));
    check(CatalogPolicy.remove("app.wuplay.androidtv",CatalogPolicy.channelKey("profile/one",2),desired));
    for(String foreign:new String[]{"native-watch-next", "santodan-launcher/catalog/one", "santodan-launcher/wuplay-spoof/one"})
      check(!CatalogPolicy.remove("app.wuplay.androidtv",foreign,desired));
    check(!CatalogPolicy.remove("other.app",a,Collections.emptySet()));
    check(!CatalogPolicy.remove(null,a,Collections.emptySet()));
    check(!CatalogPolicy.remove("app.wuplay.androidtv",null,Collections.emptySet()));
    check(CatalogPolicy.contentSource("preset"));check(CatalogPolicy.contentSource("addon"));
    check(!CatalogPolicy.contentSource("hub"));check(!CatalogPolicy.contentSource("saved_collections"));
    check(!CatalogPolicy.contentSource("library"));check(!CatalogPolicy.contentSource("watchlist"));
    check(!CatalogPolicy.contentSource(null));
    check(!CatalogPolicy.tileKey("movie","tt1").equals(CatalogPolicy.tileKey("series","tt1")));
    check(CatalogPolicy.tileKey("person","nm1")==null);
    check(CatalogPolicy.tileKey("movie","")==null);
    check(CatalogPolicy.artwork("https://image.test/a"));
    check(!CatalogPolicy.artwork("file:///data/private"));
    check(!CatalogPolicy.artwork("content://other.app/private"));
    check(!CatalogPolicy.artwork(null));
  }
}''')
            subprocess.run(['javac', '-d', str(out), str(POLICY), str(harness)], check=True, capture_output=True)
            subprocess.run(['java', '-cp', str(out), 'WuplayPolicyProbe'], check=True, capture_output=True)
