import com.android.tools.smali.dexlib2.*;
import com.android.tools.smali.dexlib2.iface.*;
import com.android.tools.smali.dexlib2.iface.instruction.*;
import com.android.tools.smali.dexlib2.iface.reference.*;
import java.io.File;
import java.util.*;
public final class VerifyBulkSelectionContracts {
 static Map<String,ClassDef> classes=new HashMap<>();
 static void load(String file)throws Exception{MultiDexContainer<? extends DexFile>d=DexFileFactory.loadDexContainer(new File(file),Opcodes.getDefault());for(String entry:d.getDexEntryNames())for(ClassDef c:d.getEntry(entry).getDexFile().getClasses())classes.put(c.getType(),c);}
 static void field(String cls,String name,String type){for(Field f:classes.get(cls).getFields())if(f.getName().equals(name)&&f.getType().equals(type)&&(f.getAccessFlags()&AccessFlags.PUBLIC.getValue())!=0)return;throw new AssertionError(cls+" missing field "+name);}
 static void method(String cls,String name,String...parameters){for(Method m:classes.get(cls).getMethods())if(m.getName().equals(name)&&new ArrayList<>(m.getParameterTypes()).equals(Arrays.asList(parameters))&&(m.getAccessFlags()&AccessFlags.PUBLIC.getValue())!=0)return;throw new AssertionError(cls+" missing method "+name+Arrays.toString(parameters));}
 public static void main(String[] args)throws Exception{
  for(String file:args)load(file);
  String fragment="Lcom/sauzask/nicoid/NicoidVideoListFragment;",cache="Lcom/sauzask/nicoid/NicoidCacheManagerActivity;";
  field(fragment,"a0","Ljava/util/ArrayList;");field(fragment,"k0","Z");field(fragment,"p0","Le/e/a/b0;");field(fragment,"o0","Landroid/app/Activity;");field(fragment,"Z","Landroid/view/View;");method(fragment,"Y");
  field(cache,"z","Ljava/util/ArrayList;");field(cache,"G","Z");field(cache,"C","Le/e/a/b0;");field(cache,"y","Landroid/view/View;");method(cache,"s");
  method("Le/e/a/x1;","a","Ljava/lang/String;","Ljava/lang/Object;");method("Le/e/a/x1;","a","Ljava/lang/String;");
  method("Le/e/a/i;","<init>",cache,"Ljava/util/ArrayList;");method("Le/e/a/z1;","<init>",fragment,"Ljava/util/ArrayList;");
  method("Lcom/sauzask/nicoid/LocalHistoryBulkDelete;","<init>",fragment,"[Z");
  method("Lcom/sauzask/nicoid/NicoidVideoListFragment$j;","<init>",fragment);
  method("Le/e/a/v0;","b","Landroid/content/Context;","Ljava/lang/String;","Lorg/apache/http/client/CookieStore;");
  boolean copy=false,move=false,done=false,confirm=false,forward=false,palette=false;
  for(Method m:classes.get("Le/e/a/BulkSelection;").getMethods())if(m.getImplementation()!=null)for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference r=((ReferenceInstruction)i).getReference();if(r instanceof StringReference){String s=((StringReference)r).getString();copy|=s.equals("コピー")||s.contains("Fragment$i");move|=s.equals("移動");done|=s.equals("完了");}if(r instanceof MethodReference){MethodReference target=(MethodReference)r;confirm|=target.getDefiningClass().equals("Le/e/a/UiDialogs;")&&target.getName().equals("show");}}
  for(Method m:classes.get("Le/e/a/PlaybackSession;").getMethods())if(m.getName().equals("styleDialog"))for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference r=((ReferenceInstruction)i).getReference();if(r instanceof MethodReference)forward|=((MethodReference)r).getDefiningClass().equals("Le/e/a/UiDialogs;");}
  for(Method m:classes.get("Le/e/a/UiDialogs;").getMethods())if(m.getName().equals("inputs"))for(Instruction i:m.getImplementation().getInstructions())if(i instanceof ReferenceInstruction){Reference r=((ReferenceInstruction)i).getReference();if(r instanceof MethodReference)palette|=((MethodReference)r).getName().equals("setTextColor");}
  if(copy||!move||!done||!confirm||!forward||!palette)throw new AssertionError("Selection/dialog routing contract missing");
  System.out.println("Bulk selection: native reflection contracts, copy removal, move/done controls and themed dialog routing passed");
 }
}
