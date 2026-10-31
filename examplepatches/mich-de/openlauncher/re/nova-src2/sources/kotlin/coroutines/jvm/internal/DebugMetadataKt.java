package kotlin.coroutines.jvm.internal;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import h70.a;
import h70.b;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class DebugMetadataKt {
    public static final StackTraceElement a(BaseContinuationImpl baseContinuationImpl) throws IllegalAccessException, NoSuchFieldException, SecurityException, IllegalArgumentException {
        int iIntValue;
        String strC;
        Method method;
        Object objInvoke;
        Method method2;
        Object objInvoke2;
        DebugMetadata debugMetadata = (DebugMetadata) baseContinuationImpl.getClass().getAnnotation(DebugMetadata.class);
        String str = null;
        if (debugMetadata == null) {
            return null;
        }
        int iV = debugMetadata.v();
        if (iV > 1) {
            throw new IllegalStateException(("Debug metadata version mismatch. Expected: 1, got " + iV + ". Please update the Kotlin standard library.").toString());
        }
        try {
            Field declaredField = baseContinuationImpl.getClass().getDeclaredField("label");
            declaredField.setAccessible(true);
            Object obj = declaredField.get(baseContinuationImpl);
            Integer num = obj instanceof Integer ? (Integer) obj : null;
            iIntValue = (num != null ? num.intValue() : 0) - 1;
        } catch (Exception unused) {
            iIntValue = -1;
        }
        int i5 = iIntValue >= 0 ? debugMetadata.l()[iIntValue] : -1;
        a aVar = b.f59540b;
        a aVar2 = b.f59539a;
        if (aVar == null) {
            try {
                a aVar3 = new a(Class.class.getDeclaredMethod("getModule", null), baseContinuationImpl.getClass().getClassLoader().loadClass("java.lang.Module").getDeclaredMethod("getDescriptor", null), baseContinuationImpl.getClass().getClassLoader().loadClass("java.lang.module.ModuleDescriptor").getDeclaredMethod(PendingUpgradeStore.KEY_NAME, null));
                b.f59540b = aVar3;
                aVar = aVar3;
            } catch (Exception unused2) {
                b.f59540b = aVar2;
                aVar = aVar2;
            }
        }
        if (aVar != aVar2 && (method = aVar.f59536a) != null && (objInvoke = method.invoke(baseContinuationImpl.getClass(), null)) != null && (method2 = aVar.f59537b) != null && (objInvoke2 = method2.invoke(objInvoke, null)) != null) {
            Method method3 = aVar.f59538c;
            Object objInvoke3 = method3 != null ? method3.invoke(objInvoke2, null) : null;
            if (objInvoke3 instanceof String) {
                str = (String) objInvoke3;
            }
        }
        if (str == null) {
            strC = debugMetadata.c();
        } else {
            strC = str + '/' + debugMetadata.c();
        }
        return new StackTraceElement(strC, debugMetadata.m(), debugMetadata.f(), i5);
    }
}
