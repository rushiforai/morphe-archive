package app.sharklatan.patches.airplay;

import app.morphe.patcher.patch.*;
import app.morphe.patcher.util.Document;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.*;
import kotlin.Pair;
import kotlin.Unit;
import org.w3c.dom.Element;

/** Version-scoped addition applied after the other selected ReVanced patches. */
public final class AirPlayPatch {
    private static final String ANDROID = "http://schemas.android.com/apk/res/android";
    private static InputStream resource(String path) {
        InputStream stream = AirPlayPatch.class.getClassLoader().getResourceAsStream(path);
        if (stream == null) throw new IllegalStateException("Missing AirPlay bundle resource: " + path);
        return stream;
    }

    private static final Patch resources = PatchKt.resourcePatch(null, null, false, builder -> {
        builder.execute(context -> {
            try (Document manifest = context.document("AndroidManifest.xml")) {
                Element root = manifest.getDocumentElement();
                Element application = (Element) manifest.getElementsByTagName("application").item(0);
                application.setAttributeNS(ANDROID, "android:usesCleartextTraffic", "true");
                for (String permission : Arrays.asList("INTERNET", "ACCESS_NETWORK_STATE",
                        "ACCESS_WIFI_STATE", "CHANGE_WIFI_MULTICAST_STATE")) {
                    String name = "android.permission." + permission;
                    boolean exists = false;
                    org.w3c.dom.NodeList permissions = manifest.getElementsByTagName("uses-permission");
                    for (int i = 0; i < permissions.getLength(); i++) {
                        if (name.equals(((Element) permissions.item(i)).getAttributeNS(ANDROID, "name"))) exists = true;
                    }
                    if (!exists) {
                        Element node = manifest.createElement("uses-permission");
                        node.setAttributeNS(ANDROID, "android:name", name);
                        root.insertBefore(node, application);
                    }
                }
            }
            for (String asset : Arrays.asList("airplay.png", "airplay.svg", "airplay.xml", "Lucide-LICENSE.txt")) {
                // Asset names are validated by the bundle builder against the runtime's original assets.
                try (InputStream input = resource("airplay-assets/" + asset)) {
                    File output = context.get("assets/sharklatan/" + asset, false);
                    output.getParentFile().mkdirs();
                    Files.copy(input, output.toPath(), StandardCopyOption.REPLACE_EXISTING);
                } catch (IOException error) { throw new IllegalStateException("Cannot copy AirPlay asset", error); }
            }
            return Unit.INSTANCE;
        });
        return Unit.INSTANCE;
    });

    public static final Patch AIRPLAY = PatchKt.bytecodePatch(
            "SharkLatan AirPlay", "Native AirPlay integration for YouTube 21.30.216. " +
            "Apply to the original YouTube APK together with Morphe YouTube patches, including Spoof video streams. " +
            "Supports native playback controls, receiver volume, thumbnail display, autoplay and local recovery. " +
            "Support for additional YouTube versions will be added after their integrations are completed and tested.", false, builder -> {
                builder.compatibleWith(Compatibility.Companion.fromLegacy(new Pair<>("com.google.android.youtube", Collections.singleton("21.30.216"))));
                
                builder.dependsOn(resources); builder.extendWith(()->resource("extensions/extension.mpe"));
                // Run after every selected patch has executed and extensions have been merged.
                // The hook adapter excludes this extension from rewriting.
                builder.finalize(context -> {
                    AirPlayHooks.rewrite(context);
                    
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
}
