package io.github.emotionbug.patches.adot.dex;
import java.util.Set;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.MethodImplementation;
public interface MethodPatch {
    String dexEntry();
    Set<String> methods();
    MethodImplementation implementation(Method method);
}
