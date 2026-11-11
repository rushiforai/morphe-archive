package santodan.patches;

import app.morphe.patcher.patch.PatchKt;
import app.morphe.patcher.patch.RawResourcePatch;
import kotlin.Unit;
import java.nio.file.Files;
import java.nio.file.Path;

/** Rewrites the managed purchase-status getter in the exact inspected APK. */
public final class CarScannerManagedPatch {
    private CarScannerManagedPatch() {}

    public static RawResourcePatch getCarScannerManagedPatch() {
        return create(false);
    }

    public static RawResourcePatch getCarScannerExperimentalPatch() {
        return create(true);
    }

    private static RawResourcePatch create(boolean experimental) {
        return PatchKt.rawResourcePatch(experimental ? "Car Scanner - Premium status (Experimental)" : "Car Scanner - Premium status",
            experimental
                ? "No version restriction. Retains the reviewed legacy and new managed/native methods; rejects unknown or modified images. Future builds may need an update. Select only one Car Scanner premium patch."
                : "Enables premium status in Car Scanner 2.1.50, 2.2.21 and 2.2.42 (arm64 and x86_64); preserves settings, profiles and ECU initialization. Select only one Car Scanner premium patch.",
            false, builder -> {
                builder.compatibleWith(experimental
                    ? new app.morphe.patcher.patch.Compatibility(CarScannerCompatibility.PACKAGE,
                        "Car Scanner ELM OBD2", null, app.morphe.patcher.patch.ApkFileType.APK,
                        null, null, java.util.List.of(new app.morphe.patcher.patch.AppTarget(null, null, true, 21, null)),
                        app.morphe.patcher.patch.FormFactor.MOBILE, false)
                    : CarScannerCompatibility.create());
                builder.execute(context -> {
                    if (!CarScannerCompatibility.PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !java.util.Set.of("2.1.50", "2.2.21", "2.2.42")
                            .contains(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Expected a supported Car Scanner original");
                    try {
                        // Select by inspected archive layout, not version, for the unrestricted alternative.
                        if (context.get(CarScanner242.ENTRY, true).isFile()) {
                            Path store = context.get(CarScanner242.ENTRY, true).toPath();
                            Path aot = context.get(CarScanner242.AOT_ENTRY, true).toPath();
                            Path guard = context.get(CarScanner242.GUARD_ENTRY, true).toPath();
                            Path decoder = context.get(CarScanner242.DECODER_ENTRY, true).toPath();
                            var rewritten = CarScanner242.patch(Files.readAllBytes(store), Files.readAllBytes(aot), Files.readAllBytes(guard));
                            byte[] rewrittenDecoder = CarScanner242.patchDecoder(Files.readAllBytes(decoder));
                            Files.write(store, rewritten.store());
                            Files.write(aot, rewritten.aot());
                            Files.write(guard, rewritten.guard());
                            Files.write(decoder, rewrittenDecoder);
                            return Unit.INSTANCE;
                        }
                        if (context.get(CarScanner242Arm64.ENTRY, true).isFile()) {
                            Path store = context.get(CarScanner242Arm64.ENTRY, true).toPath();
                            byte[] originalStore = Files.readAllBytes(store);
                            // Distinguish reviewed arm64 layouts by bytes, including for unrestricted versions.
                            if (CarScanner242Arm64.matchesStore(originalStore)) {
                                Path aot = context.get(CarScanner242Arm64.AOT_ENTRY, true).toPath();
                                Path guard = context.get(CarScanner242Arm64.GUARD_ENTRY, true).toPath();
                                Path decoder = context.get(CarScanner242Arm64.DECODER_ENTRY, true).toPath();
                                var rewritten = CarScanner242Arm64.patch(originalStore, Files.readAllBytes(aot), Files.readAllBytes(guard));
                                byte[] rewrittenDecoder = CarScanner242Arm64.patchDecoder(Files.readAllBytes(decoder));
                                Files.write(store, rewritten.store());
                                Files.write(aot, rewritten.aot());
                                Files.write(guard, rewritten.guard());
                                Files.write(decoder, rewrittenDecoder);
                                return Unit.INSTANCE;
                            }
                            if ("2.2.42".equals(context.getPackageMetadata().getVersionName()))
                                throw new IllegalStateException("Car Scanner 2.2.42 arm64: unsupported or already modified assembly store");
                        }
                        if (context.get(CarScanner221.ENTRY, true).isFile()) {
                            // Patcher 2 extracts archive entries on demand; request extraction before reading.
                            Path store = context.get(CarScanner221.ENTRY, true).toPath();
                            Path aot = context.get(CarScanner221.AOT_ENTRY, true).toPath();
                            Path guard = context.get(CarScanner221.GUARD_ENTRY, true).toPath();
                            Path decoder = context.get(CarScanner221.DECODER_ENTRY, true).toPath();
                            var rewritten = CarScanner221.patch(Files.readAllBytes(store),
                                Files.readAllBytes(aot), Files.readAllBytes(guard));
                            byte[] rewrittenDecoder = CarScanner221.patchDecoder(Files.readAllBytes(decoder));
                            Files.write(store, rewritten.store());
                            Files.write(aot, rewritten.aot());
                            Files.write(guard, rewritten.guard());
                            Files.write(decoder, rewrittenDecoder);
                            return Unit.INSTANCE;
                        }
                        Path store = context.get(CarScannerAssemblyStore.ENTRY, true).toPath();
                        byte[] rewritten = CarScannerAssemblyStore.patch(Files.readAllBytes(store),
                            Files.readAllBytes(context.get(CarScannerAssemblyStore.AOT_ENTRY, true).toPath()));
                        Files.write(store, rewritten);
                    } catch (java.io.IOException exception) {
                        throw new IllegalStateException("Could not rewrite Car Scanner assembly store", exception);
                    }
                    return Unit.INSTANCE;
                });
                return Unit.INSTANCE;
            });
    }
}
