package xyz.urro.transit;
public class PermissionCheckTest {
 static void eq(Object a, Object b) { if(!a.equals(b)) throw new AssertionError(a + " != " + b); }
 public static void main(String[] args) {
  eq(PermissionCheck.evaluate(false, false, false), PermissionCheck.Need.NONE);
  eq(PermissionCheck.evaluate(false, true, true), PermissionCheck.Need.NONE);
  eq(PermissionCheck.evaluate(true, false, false), PermissionCheck.Need.BOTH);
  eq(PermissionCheck.evaluate(true, false, true), PermissionCheck.Need.OVERLAY);
  eq(PermissionCheck.evaluate(true, true, false), PermissionCheck.Need.USAGE);
  eq(PermissionCheck.evaluate(true, true, true), PermissionCheck.Need.NONE);
  System.out.println("PASS: permission check logic verified");
 }
}
