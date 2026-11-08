public final class VerifyPatchedClasses {
  public static void main(String[] args) throws Exception {
    int failures = 0;
    int checked = 0;
    for (String name : java.nio.file.Files.readAllLines(java.nio.file.Paths.get(args[0]))) {
      checked++;
      try {
        Class.forName(name);
        System.out.println("PASS: " + name);
      } catch (Throwable error) {
        failures++;
        System.err.println("FAIL: " + name);
        error.printStackTrace();
      }
    }
    if (failures != 0) throw new AssertionError(failures + " verification/initialization failures");
    System.out.println("PASS: Android verified all " + checked + " patched classes");
  }
}
