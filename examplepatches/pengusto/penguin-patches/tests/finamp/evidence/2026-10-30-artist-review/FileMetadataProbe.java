import java.io.*;import java.nio.file.*;import java.nio.file.attribute.*;import java.util.*;import java.lang.reflect.*;import java.security.*;
class FileMetadataProbe {
 public static void main(String[] a)throws Exception{
  Path dir=Files.createDirectory(Path.of(a[0]));Path file=dir.resolve("same-size.so");byte[] old=new byte[64],next=new byte[64];Arrays.fill(next,(byte)7);Files.write(file,old);FileTime coarse=FileTime.fromMillis(1700000000000L);Files.setLastModifiedTime(file,coarse);
  Class<?> type=Class.forName("app.morphe.patcher.resource.coder.ArsclibResourceCoder");var ctor=type.getConstructor(File.class,File.class,Set.class,boolean.class);Object coder=ctor.newInstance(dir.toFile(),new File(a[1]),Set.of(),false);
  var snap=type.getDeclaredMethod("snapshot",File.class);snap.setAccessible(true);Object baseline=snap.invoke(coder,file.toFile());var diff=type.getDeclaredMethod("differsFrom",File.class,baseline.getClass());diff.setAccessible(true);
  Files.write(file,next);Files.setLastModifiedTime(file,coarse); // Model the same timestamp tick deterministically.
  boolean missed=(boolean)diff.invoke(coder,file.toFile(),baseline);if(missed)throw new AssertionError("Baseline should miss a same-size, same-metadata edit");
  FileTime before=Files.getLastModifiedTime(file);Files.setLastModifiedTime(file,FileTime.fromMillis(Math.addExact(before.toMillis(),2000L)));
  boolean detected=(boolean)diff.invoke(coder,file.toFile(),baseline);if(!detected)throw new AssertionError("Explicitly distinct FileTime should be detected");
  if(!Arrays.equals(Files.readAllBytes(file),next))throw new AssertionError("Native bytes changed");
  System.out.println("{\"actual_patcher_metadata_detection\":true,\"coarse_timestamp_model\":true,\"same_size\":64,\"before_fix_edit_detected\":"+missed+",\"after_explicit_filetime_edit_detected\":"+detected+",\"content_preserved\":true}");
 }
}
