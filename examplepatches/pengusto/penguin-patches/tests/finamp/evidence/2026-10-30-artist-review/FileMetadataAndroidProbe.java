import java.io.File;import java.nio.file.*;import java.nio.file.attribute.FileTime;import java.util.Arrays;
public class FileMetadataAndroidProbe {
 public static void main(String[] args)throws Exception {
  Path dir=Paths.get(args[0]);Files.createDirectory(dir);Path file=dir.resolve("same-size.so");int missed=0;
  try{
   for(int i=0;i<10;i++){
    byte[] old=new byte[64],next=new byte[64];Arrays.fill(next,(byte)7);Files.write(file,old);FileTime before=Files.getLastModifiedTime(file);long fileBefore=file.toFile().lastModified();
    Files.write(file,next);FileTime after=Files.getLastModifiedTime(file);long fileAfter=file.toFile().lastModified();boolean same=before.equals(after);
    if(same){missed++;Files.setLastModifiedTime(file,FileTime.fromMillis(Math.addExact(before.toMillis(),2000L)));}
    FileTime fixed=Files.getLastModifiedTime(file);if(fixed.equals(before)||!Arrays.equals(next,Files.readAllBytes(file)))throw new AssertionError("Write was not detectable or content changed");
    System.out.println("{\"sample\":"+i+",\"nio_before_ms\":"+before.toMillis()+",\"nio_after_ms\":"+after.toMillis()+",\"file_before_ms\":"+fileBefore+",\"file_after_ms\":"+fileAfter+",\"same_nio_time\":"+same+",\"fixed_nio_ms\":"+fixed.toMillis()+"}");
   }
   if(missed==0)throw new AssertionError("No coarse-time case observed");
   System.out.println("{\"actual_android_metadata\":true,\"samples\":10,\"missed_same_size_writes\":"+missed+",\"all_fixed_cases_detected\":true}");
  }finally{Files.deleteIfExists(file);Files.deleteIfExists(dir);}
 }
}
