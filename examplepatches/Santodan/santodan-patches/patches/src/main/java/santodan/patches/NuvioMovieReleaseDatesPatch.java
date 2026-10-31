package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.ApkFileType;
import app.morphe.patcher.patch.BytecodePatch;
import app.morphe.patcher.patch.Compatibility;
import app.morphe.patcher.patch.PatchKt;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.net.URI;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import kotlin.Unit;

/** Adds independently configurable upcoming movie dates to library and collection posters. */
public final class NuvioMovieReleaseDatesPatch {
    public static final String NAME = "NuvioTV - Upcoming movie dates in library and collections";
    static final String PACKAGE = NuvioNative.PACKAGE_NAME;
    static final String VERSION = NuvioLayout.LATEST;
    static final String EXTENSION = "Lsoftware/santodan/extension/nuviomovierelease/NuvioMovieReleaseDates;";

    private NuvioMovieReleaseDatesPatch() {}

    @SuppressWarnings({"unchecked", "deprecation"})
    public static BytecodePatch getNuvioMovieReleaseDatesPatch() {
        return PatchKt.bytecodePatch(NAME,
            "Adds separate disabled-by-default settings to show known release dates on unreleased movie posters in library and collections.",
            false, builder -> {
                builder.compatibleWith(new Compatibility(PACKAGE, "NuvioTV", null, ApkFileType.APK,
                    null, null, NuvioLayout.modernTargets(), app.morphe.patcher.patch.FormFactor.TV, false));
                builder.dependsOn(NuvioSettingsMenuPatch.getMenuPatch());
                builder.extendWith(NuvioMovieReleaseDatesPatch::extensionStream);
                builder.execute(context -> {
                    String version = context.getPackageMetadata().getVersionName();
                    NuvioLayout.use(version);
                    if (!PACKAGE.equals(context.getPackageMetadata().getPackageName()) || !NuvioLayout.recent(version))
                        throw NuvioFinaleDatesPatch.unsupported("Expected " + PACKAGE + " " + VERSION);
                    for (String type : NuvioFinaleDatesPatch.itemOwners())
                        NuvioFinaleDatesPatch.hookItems(context.mutableClassDefBy(type), EXTENSION);
                    NuvioFinaleDatesPatch.hookCard(context.mutableClassDefBy(NuvioNative.LIBRARY_CARD_TYPE), EXTENSION);
                    NuvioFinaleDatesPatch.hookCard(context.mutableClassDefBy(NuvioNative.COLLECTION_CARD_TYPE), EXTENSION);
                    for (String type : List.of(NuvioNative.LIBRARY_CARD_TYPE, NuvioNative.COLLECTION_CARD_TYPE, NuvioNative.LIBRARY_RESTART_TYPE, NuvioNative.COLLECTION_RESTART_TYPE))
                        NuvioFinaleDatesPatch.hookContext(context.mutableClassDefBy(type), EXTENSION);
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }

    static InputStream extensionStream() {
        String path = "extensions/nuvio-movie-release-dates.mpe";
        InputStream resource = NuvioMovieReleaseDatesPatch.class.getClassLoader().getResourceAsStream(path);
        if (resource != null) return resource;
        try {
            URI source = NuvioMovieReleaseDatesPatch.class.getProtectionDomain().getCodeSource().getLocation().toURI();
            try (ZipFile zip = new ZipFile(new File(source))) {
                ZipEntry entry = zip.getEntry(path);
                if (entry == null) throw new FileNotFoundException(path);
                try (InputStream input = zip.getInputStream(entry)) {
                    ByteArrayOutputStream output = new ByteArrayOutputStream();
                    byte[] buffer = new byte[8192]; int count;
                    while ((count = input.read(buffer)) >= 0) output.write(buffer, 0, count);
                    return new ByteArrayInputStream(output.toByteArray());
                }
            }
        } catch (Exception error) {
            throw new IllegalStateException("Cannot load bundled NuvioTV extension", error);
        }
    }
}
