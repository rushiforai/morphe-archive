import org.w3c.dom.*;

import java.io.*;
import java.util.*;

public class InspectSecurityManifest {
    public static void main(String[] args) throws Exception {
        for (String path : args) {
            Document doc = VerifyApk.manifest(new File(path));
            Element app = (Element) doc.getElementsByTagName("application").item(0);
            System.out.println(new File(path).getName());
            for (String name :
                    new String[] {
                        "debuggable",
                        "allowBackup",
                        "usesCleartextTraffic",
                        "networkSecurityConfig",
                        "extractNativeLibs"
                    }) {
                String value = app.getAttributeNS(VerifyApk.NS, name);
                System.out.println(
                        "  " + name + "=" + (value.isEmpty() ? "<platform default>" : value));
            }
            Set<String> permissions = new TreeSet<>();
            NodeList nodes = doc.getElementsByTagName("uses-permission");
            for (int i = 0; i < nodes.getLength(); i++)
                permissions.add(((Element) nodes.item(i)).getAttributeNS(VerifyApk.NS, "name"));
            System.out.println("  permissions=" + permissions);
            nodes = doc.getElementsByTagName("activity");
            for (int i = 0; i < nodes.getLength(); i++) {
                Element a = (Element) nodes.item(i);
                if (a.getAttributeNS(VerifyApk.NS, "name")
                        .equals("app.bitchord.telegram.TelegramActivity"))
                    System.out.println(
                            "  TelegramActivity exported="
                                    + a.getAttributeNS(VerifyApk.NS, "exported")
                                    + " (launcher fallback; no intent-controlled data/action"
                                    + " handler)");
            }
        }
    }
}
