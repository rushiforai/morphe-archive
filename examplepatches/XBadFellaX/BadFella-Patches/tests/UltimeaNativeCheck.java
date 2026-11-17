/* Copyright (C) 2026 hxreborn. SPDX-License-Identifier: GPL-3.0-only */
import app.badfella.patches.ultimea.upstream.settings.*;
import app.badfella.patches.ultimea.upstream.distractions.NativeNavigationKt;
import app.badfella.patches.ultimea.upstream.theme.*;
import java.nio.file.*;
import java.nio.*;
import java.util.*;

/** Run with -ea against an extracted stock ARM64 libapp.so and the built bundle. */
public class UltimeaNativeCheck {
    static byte[] theme(byte[] bytes, byte[] stock) {
        var image = new ThemeElfImage(bytes);
        var original = new ThemeElfImage(stock);
        var matches = new ThemeInstructions(stock, original.getCodeStart(), original.getCodeEnd()).match();
        ThemeHooks.INSTANCE.apply(image, matches, 2);
        var code = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN);
        int hook = image.getHookOffset();
        assert code.getInt(hook + code.getInt(hook + 16)) == 2 : "AMOLED mode";
        return bytes;
    }

    public static void main(String[] args) throws Exception {
        byte[] stock = Files.readAllBytes(Path.of(args[0]));
        var methods = new NativeMethods(stock);
        var field = NativeMethodsKt.class.getDeclaredField("nativeMethods");
        field.setAccessible(true);
        field.set(null, methods);
        byte[] navigation = stock.clone();
        var edits = NativeNavigationKt.removeCommunityNavigation(navigation);
        assert !edits.isEmpty() : "No navigation changes";
        Set<Integer> changedFunctions = new TreeSet<>();
        for (int i = 0; i < stock.length; i++) if (stock[i] != navigation[i]) {
            int offset = i;
            var owner = methods.all().stream().filter(f -> offset >= f.getStart() && offset < f.getEnd()).findFirst();
            owner.ifPresent(f -> changedFunctions.add(f.getStart()));
        }
        byte[] combined = theme(navigation.clone(), stock);
        theme(stock.clone(), stock);
        try {
            new ThemeElfImage(new byte[64]);
            throw new AssertionError("Accepted a non-ARM64 library");
        } catch (Exception expected) {
            assert expected instanceof app.morphe.patcher.patch.PatchException : expected;
        }
        System.out.println("PASS: stock matching, AMOLED mode, navigation, theme alone and combined, invalid ABI rejection");
        System.out.println("Navigation function starts: " + changedFunctions);
        Files.write(Path.of(args[1]), combined);
    }
}
