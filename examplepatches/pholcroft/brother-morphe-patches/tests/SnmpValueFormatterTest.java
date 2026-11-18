import app.template.extension.extension.SnmpValueFormatter;
public final class SnmpValueFormatterTest {
 public static void main(String[] args){
  if(!"Brother".equals(SnmpValueFormatter.format("octets:QnJvdGhlcg==".getBytes(java.nio.charset.StandardCharsets.UTF_8))))throw new AssertionError("decode readable text");
  if(!"42".equals(SnmpValueFormatter.format("integer:42".getBytes(java.nio.charset.StandardCharsets.UTF_8))))throw new AssertionError("show integer");
  if(!"Hex: 00 01".equals(SnmpValueFormatter.format("octets:AAE=".getBytes(java.nio.charset.StandardCharsets.UTF_8))))throw new AssertionError("binary should display as hex");
  byte[] mac = "octets:AgECAwQF".getBytes(java.nio.charset.StandardCharsets.UTF_8);
  if(!"02:01:02:03:04:05".equals(SnmpValueFormatter.format(mac,"1.3.6.1.2.1.2.2.1.6.1")))throw new AssertionError("MAC bytes should use address notation");
  if(!"Hex: 02 01 02 03 04 05".equals(SnmpValueFormatter.format(mac,"1.3.6.1.2.1.1.1.0")))throw new AssertionError("unrelated six-byte values should stay binary");
  if(!SnmpValueFormatter.format(null).equals("Not recorded"))throw new AssertionError("missing response");
 }
}
