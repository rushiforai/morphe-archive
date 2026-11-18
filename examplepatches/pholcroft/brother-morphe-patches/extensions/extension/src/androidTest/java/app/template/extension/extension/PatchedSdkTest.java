package app.template.extension.extension;

import dalvik.system.PathClassLoader;
import java.lang.reflect.InvocationTargetException;

/** Loads the patched Brother SDK and exercises the wrapper's exceptional path. */
public final class PatchedSdkTest {
    public static void run(String apkPath,android.content.Context context) throws Exception {
        ClassLoader loader=new PathClassLoader(apkPath,PatchedSdkTest.class.getClassLoader());
        Class<?> client=Class.forName("com.brother.sdk.common.socket.devicemanagement.snmp.SnmpClient",true,loader);
        Class<?> request=Class.forName("com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest",true,loader);
        Object instance=client.getDeclaredConstructor().newInstance();
        try {client.getMethod("requestGet",request,int.class,int.class).invoke(instance,null,100,1);throw new AssertionError("null request should throw");}
        catch(InvocationTargetException expected){if(!(expected.getCause() instanceof NullPointerException))throw expected;}
        AutoCache.init(context);
        String ip="192.0.2.90";
        Class<?> socketType=Class.forName("com.brother.sdk.network.BrDatagramSocket",true,loader);
        Object socket=socketType.getConstructor(java.net.InetAddress.class,int.class).newInstance(java.net.InetAddress.getByName(ip),161);
        java.lang.reflect.Field field=client.getDeclaredField("mSocket");field.setAccessible(true);field.set(instance,socket);
        Object packet=request.getConstructor(byte.class,int.class,int.class,String.class).newInstance((byte)0xa0,1,0,"public");
        request.getMethod("addVarbind",String.class).invoke(packet,"1.2.3");
        try{client.getMethod("requestGet",request,int.class,int.class).invoke(instance,packet,-1,1);throw new AssertionError("invalid timeout should throw");}
        catch(InvocationTargetException expected){if(!(expected.getCause() instanceof IllegalArgumentException))throw expected;}
        CommunicationTiming.finishAll();
        CommunicationTiming.Snapshot burst=CommunicationTiming.latestSnapshot(ip);
        if(burst==null || burst.requests()!=null)throw new AssertionError("unchecked failure must release request and mark burst incomplete");
        socketType.getMethod("close").invoke(socket);
    }
}
