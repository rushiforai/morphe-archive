package app.template.extension.extension;

import android.content.Context;
import dalvik.system.PathClassLoader;
import java.lang.reflect.Array;
import java.net.InetAddress;

/** Exercises the service hooks with real Brother SDK objects and local SQLite. */
public final class ServiceCacheIntegrationTest {
    private static Object request(Class<?> type,String oid)throws Exception{
        Object value=type.getConstructor(byte.class,int.class,int.class,String.class).newInstance((byte)0xa0,1,0,"test-community");
        type.getMethod("addVarbind",String.class).invoke(value,oid);return value;
    }
    private static Object response(ClassLoader loader,String oid,byte[] bytes)throws Exception{
        String prefix="com.brother.sdk.common.socket.devicemanagement.snmp.";
        Class<?> asn=Class.forName(prefix+"westhawk.AsnObject",true,loader),octets=Class.forName(prefix+"westhawk.AsnOctets",true,loader),varbind=Class.forName(prefix+"westhawk.Varbind",true,loader),result=Class.forName(prefix+"SnmpResult",true,loader);
        Object value=octets.getConstructor(byte[].class).newInstance((Object)bytes),binding=varbind.getConstructor(String.class,asn).newInstance(oid,value),array=Array.newInstance(varbind,1);Array.set(array,0,binding);
        Object reply=result.getDeclaredConstructor().newInstance();result.getField("results").set(reply,array);return reply;
    }
    public static void run(String apkPath,Context context)throws Exception{
        AutoCache.init(context);if(!AutoCache.clearAll())throw new AssertionError("clear failed");AutoCache.setEnabled(true);
        ClassLoader loader=new PathClassLoader(apkPath,ServiceCacheIntegrationTest.class.getClassLoader());
        Class<?> socketType=Class.forName("com.brother.sdk.network.BrDatagramSocket",true,loader),requestType=Class.forName("com.brother.sdk.common.socket.devicemanagement.snmp.SnmpRequest",true,loader);
        String ip="192.0.2.91",mac="1.3.6.1.2.1.2.2.1.6.1",oid="1.3.6.1.2.1.1.1.0";
        Object socket=socketType.getConstructor(InetAddress.class,int.class).newInstance(InetAddress.getByName(ip),161);
        String earlyOid="1.3.6.1.2.1.25.3.2.1.3.1";Object early=request(requestType,earlyOid);
        if(AutoCache.lookup(socket,early)!=null)throw new AssertionError("unverified printer must not serve a cache hit");
        AutoCache.record(socket,early,response(loader,earlyOid,"Brother Test Model".getBytes(java.nio.charset.StandardCharsets.UTF_8)));
        Object identity=request(requestType,mac);AutoCache.lookup(socket,identity);AutoCache.record(socket,identity,response(loader,mac,new byte[]{2,1,2,3,4,9}));
        if(!HistoryRuntime.awaitIdle())throw new AssertionError("identity worker failed");
        if(!"Brother Test Model".equals(AutoCache.printerName(ip)))throw new AssertionError("name seen before identity must appear on the card");
        if(AutoCache.lookup(socket,request(requestType,earlyOid))==null)throw new AssertionError("live response received before identity must be retained after verification");
        Object query=request(requestType,oid);if(AutoCache.lookup(socket,query)!=null)throw new AssertionError("first request must be live");
        AutoCache.record(socket,query,response(loader,oid,new byte[]{65}));
        if(AutoCache.lookup(socket,request(requestType,oid))==null)throw new AssertionError("learned response should be served from the new cache");
        if(!HistoryRuntime.awaitIdle())throw new AssertionError("cache worker failed");
        ActivityStore store=new ActivityStore(context);String id=store.findPrinterIdByMac("02:01:02:03:04:09");
        String contextId=ReplayCredentials.contextId(ReplayKey.getOrCreate(),0,"test-community");
        if(id==null||!"octets:QQ==".equals(store.getCached(id,contextId,oid)))throw new AssertionError("service cache must persist under the verified printer");
        Diagnostics.clear();
        Diagnostics.start();
        try {
            Object diagnosticQuery=request(requestType,oid);
            if(AutoCache.lookup(socket,diagnosticQuery)!=null)throw new AssertionError("diagnostics must bypass a warm cache");
            AutoCache.record(socket,diagnosticQuery,response(loader,oid,new byte[]{65}));
            if(Diagnostics.count()!=1||!Diagnostics.csv().contains("\"printer\""))throw new AssertionError("diagnostics must capture the live response");
        } finally {
            Diagnostics.stop();
            Diagnostics.clear();
        }
        if(!AutoCache.enabled()||AutoCache.lookup(socket,request(requestType,oid))==null)throw new AssertionError("stopping diagnostics must restore cache hits");
        String movedIp="192.0.2.92";Object moved=socketType.getConstructor(InetAddress.class,int.class).newInstance(InetAddress.getByName(movedIp),161);
        Object movedIdentity=request(requestType,mac);AutoCache.lookup(moved,movedIdentity);AutoCache.record(moved,movedIdentity,response(loader,mac,new byte[]{2,1,2,3,4,9}));
        if(!HistoryRuntime.awaitIdle())throw new AssertionError("moved identity worker failed");
        AutoCache.lookup(moved,request(requestType,oid));
        if(!HistoryRuntime.awaitIdle()||AutoCache.lookup(moved,request(requestType,oid))==null)throw new AssertionError("moved printer must reuse its stored response");
        if(!id.equals(store.findPrinterIdByMac("02:01:02:03:04:09")))throw new AssertionError("printer identity must survive address change");
        Object otherIdentity=request(requestType,mac);AutoCache.lookup(socket,otherIdentity);AutoCache.record(socket,otherIdentity,response(loader,mac,new byte[]{2,1,2,3,4,10}));
        if(!HistoryRuntime.awaitIdle())throw new AssertionError("new identity worker failed");
        AutoCache.lookup(socket,request(requestType,oid));HistoryRuntime.awaitIdle();
        if(AutoCache.lookup(socket,request(requestType,oid))!=null)throw new AssertionError("new printer at old IP must not inherit cached data");
        if(!AutoCache.clearPrinter(movedIp)||store.findPrinterIdByMac("02:01:02:03:04:09")!=null)throw new AssertionError("clear must remove the durable printer cache");
        store.close();socketType.getMethod("close").invoke(socket);socketType.getMethod("close").invoke(moved);
    }
}
