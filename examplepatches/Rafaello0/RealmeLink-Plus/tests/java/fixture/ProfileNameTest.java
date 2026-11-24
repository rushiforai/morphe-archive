package fixture;
import app.hxreborn.extension.realmelink.HeadsetProfileNames;
import java.util.Locale;
import java.util.Arrays;
public final class ProfileNameTest {
 private static void check(boolean value, String message) {
  if (!value) throw new IllegalStateException(message);
 }
 public static final class Vendor {
  public String getShowName(){return "realme Buds Air7";}
  public String getBluetoothName(){return "Bluetooth fallback";}
 }
 public static final class InvalidVendor {
  public String getShowName(){return "28:04:C6:DA:DD:E6";}
  public String getBluetoothName(){return "realme Buds Air8 Pro";}
 }
 public static void run(){
  String[] titles=HeadsetProfileNames.labels(new String[]{
    "realme Buds Air7","realme Buds Air7","9C:DE:F0:95:A4:1A",null
  },new Locale("uk"));
  check(Arrays.equals(titles,new String[]{
    "realme Buds Air7 (1)","realme Buds Air7 (2)","Навушники (1)","Навушники (2)"
  }),"duplicate/fallback labels: "+Arrays.toString(titles));
  check(HeadsetProfileNames.safeName("28:04:C6:DA:DD:E6")==null,"MAC hidden");
  check(HeadsetProfileNames.safeName("9CDEF095A41A")==null,"unformatted MAC hidden");
  check("realme Buds Air7".equals(HeadsetProfileNames.vendorName(new Vendor())),"vendor show name");
  check("realme Buds Air8 Pro".equals(HeadsetProfileNames.vendorName(new InvalidVendor())),"invalid name skipped");
  check(HeadsetProfileNames.labels(new String[]{null},Locale.ENGLISH)[0].equals("Earbuds"),"EN fallback");
 }
}
