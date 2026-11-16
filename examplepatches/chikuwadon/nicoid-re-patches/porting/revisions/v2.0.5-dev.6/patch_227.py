"""Update player control defaults, visual sizing, and rounded preference dialogs."""
from pathlib import Path
import importlib.util
ROOT=Path(__file__).resolve().parent
PREVIOUS=ROOT.parent/"v2.0.5-dev.5/patch_226.py"
spec=importlib.util.spec_from_file_location("_nicoid_dev5",PREVIOUS)
previous=importlib.util.module_from_spec(spec);spec.loader.exec_module(previous)
OVERRIDES=previous.OVERRIDES
def once(s,a,b,label):
    n=s.count(a)
    if n!=1:raise ValueError(label+": expected one source occurrence, found "+str(n))
    return s.replace(a,b)
def stage(base,destination):
    previous.stage(base,destination)
    dest=Path(destination)
    file=dest/"AmbientLight.java"
    code=file.read_text(encoding="utf-8")
    code=once(code,
      'String[] result = Arrays.copyOf(values, values.length + 1);\n        result[values.length] = text;\n        return result;',
      'String[] result = new String[values.length + 1];\n        int insert = Math.min(2, values.length); // after speed and quality\n        System.arraycopy(values,0,result,0,insert);\n        result[insert] = text;\n        System.arraycopy(values,insert,result,insert+1,values.length-insert);\n        return result;',
      "Initial ambient control directly after quality")
    code=once(code,
      '        hidden.add(ID);\n    }\n\n    public static void resetHidden(Set<String> hidden) { hidden.add(ID); }',
      '        // First installs show ambient by default; user-saved hidden sets stay intact.\n    }\n\n    public static void resetHidden(Set<String> hidden) { hidden.remove(ID); }',
      "Ambient and saved default visibility")
    code=once(code,
      'float size = Math.min(getWidth(), getHeight()) * .25f;',
      'float size = Math.min(getWidth(), getHeight()) * .31f;',
      "Ambient control glyph size")
    file.write_text(code,encoding="utf-8")
    return tuple(sorted(dest.glob("*.java")))
