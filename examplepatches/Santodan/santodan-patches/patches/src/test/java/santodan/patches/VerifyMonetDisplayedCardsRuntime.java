package santodan.patches;

import java.nio.file.*;
import java.net.URLClassLoader;
import java.util.*;
import javax.tools.ToolProvider;

/** Execute production Compose adapter against native renderer/state/composer fixtures. */
public final class VerifyMonetDisplayedCardsRuntime {
    public static void main(String[] args) throws Exception {
        Path root=Path.of(args[2]);Files.createDirectories(root);
        Path output=Files.createTempDirectory(root,"displayed-cards-");
        List<String> inputs=new ArrayList<>();
        try(var paths=Files.walk(Path.of(args[0]))) {paths.filter(p->p.toString().endsWith(".java")).forEach(p->inputs.add(p.toString()));}
        try(var paths=Files.walk(Path.of(args[1]))) {paths.filter(p->p.toString().endsWith(".java")).forEach(p->inputs.add(p.toString()));}
        inputs.addAll(List.of("--release","11","-d",output.toString()));
        if(ToolProvider.getSystemJavaCompiler().run(null,null,null,inputs.toArray(new String[0]))!=0)
            throw new AssertionError("Displayed cards fixture compilation failed");
        try(var loader=new URLClassLoader(new java.net.URL[]{output.toUri().toURL()},null)) {
            loader.loadClass("Fixture").getMethod("run").invoke(null);
        }
        System.out.println("PASS: native themed renderer, original controls, -10/+10/Max, q15 state, remote focus, theme changes, remembered actions, overflow/minimum, unrelated controls and balanced Compose groups");
    }
}
