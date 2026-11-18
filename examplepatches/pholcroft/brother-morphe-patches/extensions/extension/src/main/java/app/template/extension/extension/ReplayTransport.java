package app.template.extension.extension;

import android.util.Base64;
import java.lang.reflect.Array;
import java.net.InetAddress;

/** Uses Brother's own SNMP client, with replay hooks bypassed on this thread. */
public final class ReplayTransport implements ReplayEngine.Transport {
 private static final String SNMP="com.brother.sdk.common.socket.devicemanagement.snmp.";
 private static final String MAC="1.3.6.1.2.1.2.2.1.6.1";
 private static final ThreadLocal<Boolean> ACTIVE=new ThreadLocal<>();
 private final Object client;private final Class<?> requestType;private final java.lang.reflect.Method send;private final int port;
 public static boolean isReplayThread(){return Boolean.TRUE.equals(ACTIVE.get());}
 public ReplayTransport(String ip,ReplayEngine.Spec first)throws Exception{
  ClassLoader loader=ReplayTransport.class.getClassLoader();Class<?> socketType=loader.loadClass("com.brother.sdk.network.BrDatagramSocket"),iface=loader.loadClass("com.brother.sdk.common.socket.ISocket"),clientType=loader.loadClass(SNMP+"SnmpClient");requestType=loader.loadClass(SNMP+"SnmpRequest");port=first.port;
  Object socket=socketType.getConstructor(InetAddress.class,int.class).newInstance(InetAddress.getByName(ip),port);Object c=null;try{c=clientType.getConstructor().newInstance();if(!Boolean.TRUE.equals(clientType.getMethod("bind",iface).invoke(c,socket)))throw new Exception("Socket binding failed");send=clientType.getMethod("requestGet",requestType,int.class,int.class);client=c;}catch(Exception e){try{socketType.getMethod("close").invoke(socket);}catch(Exception ignored){}throw e;}
 }
 private Object send(ReplayEngine.Spec spec,String oid,int timeout,int retries)throws Exception{
  if(spec.port!=port)throw new Exception("The captured burst used multiple printer ports");
  Object request=requestType.getConstructor(byte.class,int.class,int.class,String.class).newInstance((byte)0xa0,spec.id,spec.version,spec.community);requestType.getMethod("addVarbind",String.class).invoke(request,oid);
  ACTIVE.set(true);try{return send.invoke(client,request,timeout,retries);}finally{ACTIVE.remove();}
 }
 private static String value(Object result,String oid)throws Exception{
  if(result==null)throw new Exception("No reply");String state=String.valueOf(result.getClass().getField("state").get(result));if(state.equals("ErrorRequestNoSuchName"))return "missing:";if(!state.equals("SuccessRequest"))throw new Exception("Printer request failed: "+state);
  Object values=result.getClass().getField("results").get(result);if(values==null||Array.getLength(values)!=1)throw new Exception("Invalid printer response");Object binding=Array.get(values,0),returned=binding.getClass().getMethod("getOid").invoke(binding);if(!oid.equals(returned.getClass().getMethod("getValue").invoke(returned)))throw new Exception("Printer returned a different object");Object v=binding.getClass().getMethod("getValue").invoke(binding);if(v==null)return null;String type=v.getClass().getName();if(type.equals(SNMP+"westhawk.AsnOctets")){byte[] bytes=(byte[])v.getClass().getMethod("getBytes").invoke(v);if(bytes.length>8192)return null;return "octets:"+Base64.encodeToString(bytes,Base64.NO_WRAP);}if(type.equals(SNMP+"westhawk.AsnInteger"))return "integer:"+v.getClass().getMethod("getValue").invoke(v);return null;
 }
 @Override public String probe(ReplayEngine.Spec first)throws Exception{String v=value(send(first,MAC,2000,1),MAC);if(v==null||!v.startsWith("octets:"))throw new Exception("Printer did not return a hardware address");byte[] bytes=Base64.decode(v.substring(7),Base64.DEFAULT);if(bytes.length!=6)throw new Exception("Invalid hardware address");StringBuilder b=new StringBuilder();for(byte x:bytes){if(b.length()>0)b.append(':');b.append(String.format(java.util.Locale.ROOT,"%02x",x&255));}return b.toString();}
 @Override public String request(ReplayEngine.Spec spec)throws Exception{return value(send(spec,spec.oid,spec.timeout==0?3000:spec.timeout,spec.retries),spec.oid);}
 @Override public void close(){try{client.getClass().getMethod("close").invoke(client);}catch(Exception ignored){}}
}

