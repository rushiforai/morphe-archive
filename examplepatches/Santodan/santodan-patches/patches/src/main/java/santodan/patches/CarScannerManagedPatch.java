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
                ? "No version restriction. Reuses the reviewed exact methods for known builds and, for unknown builds, locates the targets structurally (metadata identity, AOT method-address table) and fails safe if any cannot be found. Future builds may still need an update. Select only one Car Scanner premium patch."
                : "Enables premium status in Car Scanner 2.1.50, 2.2.21, 2.2.42 and 2.2.52 (arm64; 2.2.42 also x86_64); preserves settings, profiles and ECU initialization. Select only one Car Scanner premium patch.",
            false, builder -> {
                builder.compatibleWith(experimental
                    ? new app.morphe.patcher.patch.Compatibility(CarScannerCompatibility.PACKAGE,
                        "Car Scanner ELM OBD2", null, app.morphe.patcher.patch.ApkFileType.APK,
                        null, null, java.util.List.of(new app.morphe.patcher.patch.AppTarget(null, null, true, 21, null)),
                        app.morphe.patcher.patch.FormFactor.MOBILE, false)
                    : CarScannerCompatibility.create());
                builder.execute(context -> {
                    if (!CarScannerCompatibility.PACKAGE.equals(context.getPackageMetadata().getPackageName())
                        || !experimental && !java.util.Set.of("2.1.50", "2.2.21", "2.2.42", "2.2.52")
                            .contains(context.getPackageMetadata().getVersionName()))
                        throw new IllegalStateException("Expected a supported Car Scanner original");
                    try {
                        // Select by inspected archive layout, not version.
                        // x86_64 emulator layout (2.2.42 only).
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
                        // arm64 assembly-store layout (2.2.21, 2.2.42, 2.2.52 and, for the
                        // experimental alternative, unknown future builds). 2.1.50 uses a
                        // different blob entry and is handled below.
                        if (context.get(CarScanner242Arm64.ENTRY, true).isFile()) {
                            Path store = context.get(CarScanner242Arm64.ENTRY, true).toPath();
                            Path aot = context.get(CarScanner242Arm64.AOT_ENTRY, true).toPath();
                            Path guard = context.get(CarScanner242Arm64.GUARD_ENTRY, true).toPath();
                            Path decoder = context.get(CarScanner242Arm64.DECODER_ENTRY, true).toPath();
                            byte[] storeBytes = Files.readAllBytes(store);
                            byte[] aotBytes = Files.readAllBytes(aot);
                            byte[] guardBytes = Files.readAllBytes(guard);
                            byte[] decoderBytes = Files.readAllBytes(decoder);
                            if (CarScanner242Arm64.matchesStore(storeBytes)) {
                                var rewritten = CarScanner242Arm64.patch(storeBytes, aotBytes, guardBytes);
                                writeArm64(store, aot, guard, decoder, rewritten.store(), rewritten.aot(),
                                    rewritten.guard(), CarScanner242Arm64.patchDecoder(decoderBytes));
                                return Unit.INSTANCE;
                            }
                            if (CarScanner252.matchesStore(storeBytes)) {
                                var rewritten = CarScanner252.patch(storeBytes, aotBytes, guardBytes);
                                writeArm64(store, aot, guard, decoder, rewritten.store(), rewritten.aot(),
                                    rewritten.guard(), CarScanner252.patchDecoder(decoderBytes));
                                return Unit.INSTANCE;
                            }
                            if (CarScanner221.matchesStore(storeBytes)) {
                                var rewritten = CarScanner221.patch(storeBytes, aotBytes, guardBytes);
                                writeArm64(store, aot, guard, decoder, rewritten.store(), rewritten.aot(),
                                    rewritten.guard(), CarScanner221.patchDecoder(decoderBytes));
                                return Unit.INSTANCE;
                            }
                            if (experimental) {
                                // Best-effort structural fallback for unknown builds; fails safe.
                                var rewritten = CarScannerGeneric.patch(storeBytes, aotBytes, guardBytes);
                                writeArm64(store, aot, guard, decoder, rewritten.store(), rewritten.aot(),
                                    rewritten.guard(), CarScannerGeneric.patchDecoder(decoderBytes));
                                return Unit.INSTANCE;
                            }
                            throw new IllegalStateException("Car Scanner " + context.getPackageMetadata().getVersionName()
                                + " arm64: unsupported or already modified assembly store");
                        }
                        // 2.1.50 legacy blob store.
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

    private static void writeArm64(Path store, Path aot, Path guard, Path decoder,
                                   byte[] storeBytes, byte[] aotBytes, byte[] guardBytes, byte[] decoderBytes)
            throws java.io.IOException {
        Files.write(store, storeBytes);
        Files.write(aot, aotBytes);
        Files.write(guard, guardBytes);
        Files.write(decoder, decoderBytes);
    }
}
