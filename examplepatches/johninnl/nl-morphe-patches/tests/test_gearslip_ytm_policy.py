"""Exercise the extension's production UID policy on the JVM, not a policy rewrite."""
from pathlib import Path
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'extensions/gearslip-ytm/src/main/java/patches/ytmusic/GearslipSupport.java'


class GearslipYtmPolicyTests(unittest.TestCase):
    def test_trust_requires_configured_package_and_callback_uid_ownership(self):
        self.assertTrue(SOURCE.is_file(), 'Gearslip caller UID policy is not implemented')
        with tempfile.TemporaryDirectory() as temporary:
            out = Path(temporary)
            files = {
                'android/content/Context.java': '''package android.content;
public abstract class Context { public abstract android.content.pm.PackageManager getPackageManager(); }''',
                'android/content/pm/PackageManager.java': '''package android.content.pm;
public abstract class PackageManager { public abstract String[] getPackagesForUid(int uid); }''',
                'CallerPolicyTest.java': '''import patches.ytmusic.GearslipSupport;
import android.content.Context; import android.content.pm.PackageManager;
public final class CallerPolicyTest {
  static final String HOST="app.seb3thehacker.gearslip";
  static void check(boolean ok,String name){if(!ok)throw new AssertionError(name);}
  static Context context(String... packages){return new Context(){public PackageManager getPackageManager(){
    return new PackageManager(){public String[] getPackagesForUid(int uid){
      return uid==12345?packages:new String[]{"unrelated.client"};}};}};}
  public static void main(String[] args){
    check(GearslipSupport.decision(context(HOST),HOST,12345)==1,"real callback UID accepted");
    check(GearslipSupport.decision(context(HOST),HOST,54321)==0,"spoofed package rejected");
    check(GearslipSupport.decision(context("unrelated.client"),HOST,12345)==0,"unrelated UID rejected");
    check(GearslipSupport.decision(context((String[])null),HOST,12345)==0,"unresolved UID rejected");
    check(GearslipSupport.decision(null,HOST,12345)==0,"missing context rejected");
    check(GearslipSupport.decision(context(HOST),HOST,-1)==0,"invalid UID rejected");
    check(GearslipSupport.decision(context(HOST),"unrelated.client",12345)==-1,"unrelated caller keeps original policy");
    check(GearslipSupport.decision(null,null,12345)==-1,"null unrelated package keeps original policy");
    check(GearslipSupport.decision(context(HOST),HOST+".morphetest",12345)==-1,"validation package not trusted by default");
    check(GearslipSupport.decision(context("sibling.client",HOST),HOST,12345)==1,"all packages owned by UID considered");
    Context failure=new Context(){public PackageManager getPackageManager(){throw new SecurityException("fixture");}};
    check(GearslipSupport.decision(failure,HOST,12345)==0,"PackageManager failure rejects configured host");
    check(GearslipSupport.isConfiguredPackage(HOST),"configured host browser eligibility");
    check(!GearslipSupport.isConfiguredPackage("unrelated.client"),"unrelated browser eligibility unchanged");
    check(!GearslipSupport.isConfiguredPackage(HOST+".spoof"),"no prefix matching");
    check(!GearslipSupport.isConfiguredPackage(null),"null is not a host");
    System.out.println("PASS 15 production caller-policy checks");
  }
}''',
            }
            paths = []
            for name, source in files.items():
                path = out / name
                path.parent.mkdir(parents=True, exist_ok=True)
                path.write_text(source)
                paths.append(str(path))
            compiled = subprocess.run(['javac', '-d', str(out), str(SOURCE), *paths], capture_output=True, text=True)
            self.assertEqual(compiled.returncode, 0, compiled.stderr)
            ran = subprocess.run(['java', '-cp', str(out), 'CallerPolicyTest'], capture_output=True, text=True)
            self.assertEqual(ran.returncode, 0, ran.stderr)
            self.assertIn('PASS 15', ran.stdout)


if __name__ == '__main__':
    unittest.main()
