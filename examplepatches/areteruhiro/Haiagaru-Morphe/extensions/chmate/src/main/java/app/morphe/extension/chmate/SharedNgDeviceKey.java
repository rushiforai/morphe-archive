package app.morphe.extension.chmate;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;

/** Domain-separated application-scoped device key; never returns the raw Android identifier. */
final class SharedNgDeviceKey {
    static String create(String androidId)throws Exception{
        if(androidId==null)return "";
        String id=androidId.toLowerCase(Locale.ROOT);
        if(!id.matches("[0-9a-f]{8,16}")||id.matches("0+")||id.equals("9774d56d682e549c"))return "";
        byte[] bytes=MessageDigest.getInstance("SHA-256").digest(("haiagaru.shared-ng.device.v1\n"+id).getBytes(StandardCharsets.UTF_8));
        StringBuilder result=new StringBuilder(64);for(byte b:bytes)result.append(Character.forDigit((b>>>4)&15,16)).append(Character.forDigit(b&15,16));return result.toString();
    }
}
