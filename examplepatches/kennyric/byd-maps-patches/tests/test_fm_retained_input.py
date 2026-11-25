"""Exercise the actual Java retained-input guard without Android or a device."""
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SDK = Path(os.environ.get('ANDROID_HOME') or os.environ.get('ANDROID_SDK_ROOT') or Path.home() / 'Library/Android/sdk')
ANDROID = SDK / 'platforms/android-36/android.jar'

HARNESS = r'''
package nl.johninnl.warningprobe.phasezone;
import java.lang.reflect.Field;
import java.util.*;
public final class RetainedGuardHarness {
  static final String ID="private-fm15-zone-12345678-1234-1234-1234-123456789abc";
  static final class Model {
    final String id; Model(String id){this.id=id;}
    public boolean equals(Object other){return other instanceof Model;}
    public int hashCode(){return 1;}
  }
  public static final class Owner { public List<Object> d; public Object generated; public int primitive=7; public static Object shared=new Object(); public final Object fixed=new Object(); }
  interface Checked { void run()throws Exception; }
  static void check(boolean value){if(!value)throw new AssertionError("Retained input contract failed");}
  static void refuses(Checked action)throws Exception {
    try{action.run();throw new AssertionError("Unsafe ownership operation accepted");}
    catch(IllegalStateException expected){}
  }
  static Fm15PrivateZoneInput.RetainedInput input(Owner o,String id)throws Exception {
    return new Fm15PrivateZoneInput.RetainedInput(o,o.d,new Model(id),id,m->((Model)m).id);
  }
  public static void main(String[] args)throws Exception {
    Field field=Owner.class.getField("d");int cases=0;
    Owner empty=new Owner();Fm15PrivateZoneInput.RetainedInput a=input(empty,ID);
    a.install(field);check(empty.d==a.inserted);
    // A native candidate refresh is generated output, not ownership of retained input.
    empty.generated=new HashSet<Object>();a.requireOwned(empty,empty.d);
    a.restore(field);check(empty.d==null);cases++;

    Owner populated=new Owner();populated.d=new ArrayList<Object>(Arrays.asList(new Model("existing-a"),new Model("existing-b")));
    List<Object> original=populated.d;Fm15PrivateZoneInput.RetainedInput b=input(populated,ID);
    b.install(field);check(populated.d.size()==3&&populated.d.get(0)==original.get(0)&&populated.d.get(1)==original.get(1));
    b.restore(field);check(populated.d==original);cases++;

    Owner before=new Owner();Fm15PrivateZoneInput.RetainedInput c=input(before,ID);
    List<Object> foreign=new ArrayList<Object>();before.d=foreign;
    refuses(()->c.install(field));check(before.d==foreign);cases++;

    Owner after=new Owner();Fm15PrivateZoneInput.RetainedInput d=input(after,ID);d.install(field);
    List<Object> equalButForeign=new ArrayList<Object>(after.d);after.d=equalButForeign;
    refuses(()->d.restore(field));check(after.d==equalButForeign);cases++;

    Owner mutated=new Owner();mutated.d=new ArrayList<Object>(Arrays.asList(new Model("old")));
    Fm15PrivateZoneInput.RetainedInput e=input(mutated,ID);e.install(field);
    e.previous.set(0,null);refuses(()->e.restore(field));check(mutated.d==e.inserted);cases++;

    Owner duplicated=new Owner();duplicated.d=new ArrayList<Object>(Arrays.asList(new Model("a"),new Model("b")));
    Fm15PrivateZoneInput.RetainedInput f=input(duplicated,ID);
    duplicated.d.set(1,duplicated.d.get(0));refuses(()->f.install(field));check(duplicated.d.size()==2);cases++;

    Owner collision=new Owner();collision.d=new ArrayList<Object>(Arrays.asList(new Model(ID)));
    List<Object> colliding=collision.d;refuses(()->input(collision,ID));check(collision.d==colliding);cases++;
    Owner publicId=new Owner();refuses(()->input(publicId,"123456"));check(publicId.d==null);cases++;

    Owner same=new Owner();Fm15PrivateZoneInput.RetainedInput g=input(same,ID);g.install(field);
    refuses(()->g.requireOwned(new Owner(),same.d));check(same.d==g.inserted);g.restore(field);cases++;

    Owner casOwner=new Owner();List<Object> expected=new ArrayList<Object>();List<Object> next=new ArrayList<Object>();
    casOwner.d=new ArrayList<Object>(expected);
    check(!Fm15PrivateZoneInput.RetainedInput.compareField(field,casOwner,expected,next));check(casOwner.d!=next);
    List<Object> actual=casOwner.d;check(Fm15PrivateZoneInput.RetainedInput.compareField(field,casOwner,actual,next));check(casOwner.d==next);cases++;
    Owner invalid=new Owner();Object fixed=invalid.fixed,shared=Owner.shared;
    refuses(()->Fm15PrivateZoneInput.RetainedInput.compareField(Owner.class.getField("primitive"),invalid,null,null));check(invalid.primitive==7);cases++;
    refuses(()->Fm15PrivateZoneInput.RetainedInput.compareField(Owner.class.getField("shared"),invalid,shared,new Object()));check(Owner.shared==shared);cases++;
    refuses(()->Fm15PrivateZoneInput.RetainedInput.compareField(Owner.class.getField("fixed"),invalid,fixed,new Object()));check(invalid.fixed==fixed);cases++;
    System.out.println("retained-input guards: "+cases+" cases passed");
  }
}
'''


class RetainedInputTest(unittest.TestCase):
    @unittest.skipUnless(shutil.which('javac') and shutil.which('java') and ANDROID.is_file(), 'JDK and Android36 compile jar required')
    def test_actual_java_guard_rejects_foreign_or_mutated_input_and_restores_exact_baselines(self):
        with tempfile.TemporaryDirectory(prefix='fm-retained-guard-') as temporary:
            root = Path(temporary)
            harness = root / 'RetainedGuardHarness.java'
            harness.write_text(HARNESS)
            source = ROOT / 'scripts/navigation-alerts/probe/Fm15PrivateZoneInput.java'
            result = subprocess.run(['javac', '--release', '8', '-cp', str(ANDROID), '-d', str(root), str(source), str(harness)], capture_output=True, text=True)
            self.assertEqual(0, result.returncode, result.stderr)
            result = subprocess.run(['java', '-cp', os.pathsep.join([str(root), str(ANDROID)]), 'nl.johninnl.warningprobe.phasezone.RetainedGuardHarness'], capture_output=True, text=True)
            self.assertEqual(0, result.returncode, result.stderr)
            self.assertIn('13 cases passed', result.stdout)


if __name__ == '__main__':
    unittest.main()
