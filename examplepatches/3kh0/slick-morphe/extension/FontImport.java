package slick.android;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class FontImport {
  public static String copy(InputStream input, File temporary) throws IOException {
    if (input == null) throw new IOException("Cannot open font");
    try (FileOutputStream output = new FileOutputStream(temporary)) {
      MessageDigest hash = MessageDigest.getInstance("SHA-256");
      byte[] bytes = new byte[8192];
      for (int i = 0; i < 4; i++) {
        int b = input.read();
        if (b < 0) throw new IOException("Truncated font");
        bytes[i] = (byte) b;
      }
      int signature = java.nio.ByteBuffer.wrap(bytes, 0, 4).getInt();
      if (signature != 0x00010000 && signature != 0x4f54544f)
        throw new IOException("Expected TTF or OTF");
      int count = 4, total = 0;
      do {
        if ((total += count) > 8 * 1024 * 1024) throw new IOException("Font exceeds 8 MiB");
        output.write(bytes, 0, count);
        hash.update(bytes, 0, count);
      } while ((count = input.read(bytes)) != -1);
      output.getFD().sync();
      return String.format(
          java.util.Locale.ROOT, "import-%064x.font", new BigInteger(1, hash.digest()));
    } catch (NoSuchAlgorithmException e) {
      throw new IOException(e);
    }
  }
}
