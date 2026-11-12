// Targeted stock-binary cross-check. Run with the installed Ghidra headless analyzer.
// @category GalaxyXR
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import java.nio.file.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class NativeQuadAudit extends GhidraScript {
    public void run() throws Exception {
        String[] args = getScriptArgs();
        if (args.length != 1) throw new IllegalArgumentException("output report path required");
        if (args[0].equals("prepare")) {
            // The GCC LSDA analyzer loops over malformed inferred call-site ranges on these
            // stripped vendor libraries. Keep EH-layout validation in the byte-exact audit;
            // this focused cross-check uses normal code analysis and decompilation only.
            setAnalysisOption(currentProgram, "GCC Exception Handlers", "false");
            return;
        }
        String source = currentProgram.getExecutablePath();
        if (source.matches("^/[A-Za-z]:/.*")) source = source.substring(1);
        byte[] bytes = Files.readAllBytes(Paths.get(source));
        StringBuilder digest = new StringBuilder();
        for (byte b : MessageDigest.getInstance("SHA-256").digest(bytes)) digest.append(String.format("%02x", b));
        StringBuilder out = new StringBuilder("# Ghidra native quad cross-check\n\nStatic decompilation; no target execution. GCC Exception Handlers analysis disabled.\n\nSHA-256: " + digest + "\nImage base: " + currentProgram.getImageBase() + "\n\n");
        DecompInterface decompiler = new DecompInterface();
        decompiler.openProgram(currentProgram);
        int count = 0;
        for (Function f : currentProgram.getFunctionManager().getFunctions(true)) {
            String name = f.getName(true);
            if (!(name.contains("QSVLRendererXR") || name.contains("GetEyeToHeadTransform") ||
                  name.contains("SVLRoot") && (name.contains("D2Ev") || name.contains("~") || name.contains("EventsThread") || name.contains("HandleEvent")) ||
                  name.contains("QSVLClientXR") && (name.contains("D2Ev") || name.contains("~") || name.contains("HandleEvent") || name.contains("GetStreamProjectionLayers")) ||
                  name.contains("XrSceneStream") && (name.contains("Render") || name.contains("Focused")))) continue;
            if (f.isThunk() || f.isExternal()) continue;
            DecompileResults result = decompiler.decompileFunction(f, 60, monitor);
            if (!result.decompileCompleted()) throw new IllegalStateException(name + ": " + result.getErrorMessage());
            out.append("## ").append(name).append(" @ ").append(f.getEntryPoint()).append("\n\n````c\n")
               .append(result.getDecompiledFunction().getC()).append("\n````\n\n");
            count++;
        }
        decompiler.dispose();
        if (count < 10) throw new IllegalStateException("Expected renderer/lifecycle functions, found " + count);
        Files.write(Paths.get(args[0]), out.toString().getBytes(StandardCharsets.UTF_8));
        println("NATIVE_QUAD_AUDIT functions=" + count + " sha256=" + digest);
    }
}
