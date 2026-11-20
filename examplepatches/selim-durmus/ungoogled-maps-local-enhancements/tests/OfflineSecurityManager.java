import java.net.SocketPermission;
import java.security.Permission;

/** Test-only JDK 21 network guard; permits local compilation and ForkJoin workers. */
public final class OfflineSecurityManager extends SecurityManager {
    @Override public void checkPermission(Permission permission) {
        if (permission instanceof SocketPermission
                || (permission instanceof RuntimePermission
                    && permission.getName().equals("setSecurityManager"))) {
            throw new SecurityException("Offline build denied: " + permission.getName());
        }
    }
    @Override public void checkPermission(Permission permission, Object context) {
        checkPermission(permission);
    }
}
