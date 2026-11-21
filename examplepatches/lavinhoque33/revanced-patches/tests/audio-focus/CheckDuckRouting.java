/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-20.
 */
import com.android.tools.smali.dexlib2.Opcode;
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.reference.MethodReference;
import com.android.tools.smali.dexlib2.iface.reference.StringReference;

import java.io.BufferedInputStream;
import java.nio.file.Path;
import java.util.Collections;
import java.util.TreeMap;
import java.util.zip.ZipFile;

/** java -cp cli.jar CheckDuckRouting.java patched-youtube.apk [...] */
class CheckDuckRouting {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) throw new IllegalArgumentException("Pass a patched YouTube APK");
        for (String apk : args) {
            int checks = 0;
            try (var zip = new ZipFile(apk)) {
                for (var entry : Collections.list(zip.entries())) {
                    if (!entry.getName().matches("classes[0-9]*\\.dex")) continue;
                    try (var input = new BufferedInputStream(zip.getInputStream(entry))) {
                        var dex = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), input);
                        for (var type : dex.getClasses()) {
                            for (var method : type.getVirtualMethods()) {
                                if (!method.getName().equals("onAudioFocusChange") || method.getImplementation() == null) continue;
                                var code = new TreeMap<Integer, Instruction>();
                                int address = 0;
                                int policy = -1;
                                for (var insn : method.getImplementation().getInstructions()) {
                                    code.put(address, insn);
                                    if (insn instanceof ReferenceInstruction ref && ref.getReference() instanceof MethodReference call
                                            && call.getName().equals("shouldPauseOnDuck")) policy = address;
                                    address += insn.getCodeUnits();
                                }
                                if (policy < 0) continue;
                                int compare = code.lowerKey(code.lowerKey(policy)); // before listener state read
                                assertOutcome(code, compare, true, false, true);
                                assertOutcome(code, compare, false, true, true);
                                assertOutcome(code, compare, false, false, false);
                                checks++;
                            }
                        }
                    }
                }
            }
            if (checks != 1) throw new AssertionError("Expected one hooked listener in " + apk + ", got " + checks);
            System.out.println(Path.of(apk).getFileName() + ": stock pause, first duck, stock/repeated duck OK");
        }
    }

    /** Follow the actual encoded branches to the stock pause or volume block, not just the extension call. */
    private static void assertOutcome(TreeMap<Integer, Instruction> code, int pc, boolean nativePause,
                                      boolean policySaysPause, boolean expectPause) {
        for (int steps = 0; steps < code.size(); steps++) {
            var insn = code.get(pc);
            if (insn instanceof ReferenceInstruction ref && ref.getReference() instanceof StringReference text) {
                String message = text.getString();
                if (message.equals("AudioFocus loss; Will pause") || message.equals("AudioFocus loss; Will lower volume")) {
                    if (message.endsWith("pause") == expectPause) return;
                    throw new AssertionError("nativePause=" + nativePause + ", policy=" + policySaysPause + ": " + message);
                }
            }
            if (insn.getOpcode() == Opcode.RETURN_VOID) break;
            if (insn instanceof OffsetInstruction branch) {
                boolean jump = switch (insn.getOpcode()) {
                    case IF_EQ -> nativePause;
                    case IF_NE -> !nativePause;
                    case IF_EQZ -> !policySaysPause;
                    case IF_NEZ -> policySaysPause;
                    case GOTO, GOTO_16, GOTO_32 -> true;
                    default -> throw new AssertionError("Unexpected duck branch: " + insn.getOpcode());
                };
                if (jump) {
                    pc += branch.getCodeOffset();
                    continue;
                }
            }
            pc += insn.getCodeUnits();
        }
        throw new AssertionError("Did not reach a native playback decision");
    }
}
