package android.content.res;
import java.io.*;
import java.util.*;
public class AssetManager {
 public final Map<String,byte[]> files = new HashMap<>();
 public InputStream open(String name) throws IOException {
  if(!files.containsKey(name)) throw new FileNotFoundException(name);
  return new ByteArrayInputStream(files.get(name));
 }
}
