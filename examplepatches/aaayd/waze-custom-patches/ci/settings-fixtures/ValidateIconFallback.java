import android.content.Context;
import local.wazemaps.themes.IconPack;
import java.nio.file.*;
import java.util.*;

public class ValidateIconFallback {
 public static void main(String[] args) throws Exception {
  Context context = new Context();
  Path root = Files.createTempDirectory("waze-icon-fallback-").toRealPath();
  try {
   context.filesDir = Files.createDirectories(root.resolve("files")).toFile();
   byte[] stock = new byte[32], google = new byte[32];
   for(byte[] image : new byte[][]{stock,google}) {image[0]=(byte)137;image[1]=80;image[2]=78;image[3]=71;}
   stock[31]=1;google[31]=2;
   context.assets.files.put("morphe/iconpacks/paths.txt", "matched.png\n".getBytes());
   context.assets.files.put("morphe/iconpacks/fallback-paths.txt", "changed.png\n".getBytes());
   context.assets.files.put("morphe/iconpacks/google_maps/matched.png",google);
   context.assets.files.put("res/skins/default/matched.png",stock);
   context.assets.files.put("res/skins/default/changed.png",stock);
   Path skin=Files.createDirectories(root.resolve("waze/skins/default"));
   Files.write(skin.resolve("changed.png"),google);
   IconPack.prepare(context);
   if(!Arrays.equals(Files.readAllBytes(skin.resolve("matched.png")),google))throw new AssertionError("Matched replacement not installed");
   if(!Arrays.equals(Files.readAllBytes(skin.resolve("changed.png")),stock))throw new AssertionError("Stale custom icon did not restore stock fallback");
   if(IconPack.open("changed.png")!=null || !Arrays.equals(IconPack.open("matched.png").readAllBytes(),google))throw new AssertionError("Asset fallback mismatch");
   context.saved="waze";IconPack.prepare(context);
   if(!Arrays.equals(Files.readAllBytes(skin.resolve("matched.png")),stock) || IconPack.open("matched.png")!=null)throw new AssertionError("Stock selection did not restore originals");
   System.out.println("PASS icon fallback: compatible override, stale-image restoration, delegated original reads and stock selection");
  } finally {
   try(var paths=Files.walk(root)) {
    for(Path path:paths.sorted(Comparator.reverseOrder()).toList()) {
     if(!path.toAbsolutePath().normalize().startsWith(root))throw new AssertionError("Cleanup outside fixture");
     Files.delete(path);
    }
   }
  }
 }
}
