"""Check the production content router's caller boundary and root/subtree distinction."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/gearslip-ytm-library/src/main/java/patches/ytmusic/GearslipLibrarySupport.java'


class GearslipYtmLibraryTests(unittest.TestCase):
    def test_only_the_actual_configured_browser_can_use_library_routes(self):
        self.assertTrue(SOURCE.is_file(), 'Gearslip personal content routing is missing')
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            test = root / 'LibraryRouterTest.java'
            test.write_text('''import patches.ytmusic.GearslipLibrarySupport;
public final class LibraryRouterTest {
  static final String HOST="app.seb3thehacker.gearslip";
  static Object caller(String name){return (GearslipLibrarySupport.Request)()->name;}
  static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);}
  public static void main(String[] args){
    Object host=caller(HOST);
    check(GearslipLibrarySupport.route(host,HOST)==1,"configured root");
    check(GearslipLibrarySupport.route(host,"morphe:gearslip:home")==2,"personal home");
    check(GearslipLibrarySupport.route(host,"morphe:gearslip:library")==3,"personal library");
    check(GearslipLibrarySupport.route(host,"morphe-aa-library://collection/PLAYLISTS")==0,"native playlist loader retained");
    check(GearslipLibrarySupport.route(host,"com.google.android.projection.gearhead")==0,"Android Auto root unchanged");
    check(GearslipLibrarySupport.route(caller("unrelated.client"),HOST)==0,"cannot claim another browser's root");
    check(GearslipLibrarySupport.route(caller("unrelated.client"),"morphe:gearslip:library")==0,"cannot guess a private route");
    check(GearslipLibrarySupport.route(caller(HOST+".spoof"),HOST)==0,"exact host match");
    check(GearslipLibrarySupport.route(caller(null),HOST)==0,"missing browser identity");
    check(GearslipLibrarySupport.route(new Object(),HOST)==0,"unsupported request unchanged");
    check(GearslipLibrarySupport.route(null,HOST)==0,"null request unchanged");
    check(GearslipLibrarySupport.route(host,null)==0,"null media id unchanged");
    System.out.println("PASS 12 production library-router checks");
  }
}''')
            built = subprocess.run(['javac', '-d', str(root), str(SOURCE), str(test)], capture_output=True, text=True)
            self.assertEqual(built.returncode, 0, built.stderr)
            ran = subprocess.run(['java', '-cp', str(root), 'LibraryRouterTest'], capture_output=True, text=True)
            self.assertEqual(ran.returncode, 0, ran.stderr)
            self.assertIn('PASS 12', ran.stdout)
