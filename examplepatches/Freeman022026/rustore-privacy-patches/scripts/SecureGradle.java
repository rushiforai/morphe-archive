import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Starts Gradle after retrieving GitHub credentials from gh's OS keyring. */
final class SecureGradle {
    private static String run(String... command) throws IOException, InterruptedException {
        Process process = new ProcessBuilder(command)
                .redirectError(ProcessBuilder.Redirect.INHERIT)
                .start();
        String output = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8).trim();
        if (process.waitFor() != 0 || output.isEmpty()) {
            throw new IllegalStateException("GitHub CLI could not provide package credentials");
        }
        return output;
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("org.gradle.project.gpr.user", run("gh", "api", "user", "--jq", ".login"));
        System.setProperty("org.gradle.project.gpr.key", run("gh", "auth", "token"));
        Class<?> wrapper = Class.forName("org.gradle.wrapper.GradleWrapperMain");
        wrapper.getMethod("main", String[].class).invoke(null, (Object) args);
    }
}
