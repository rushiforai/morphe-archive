package com.brother.sdk.common.socket.devicemanagement.snmp;
import java.util.Vector;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.Varbind;
public class SnmpRequest { private byte msg_type; private int req_id,version;private String community;private Vector<Varbind> reqVarbinds=new Vector<>(); public SnmpRequest(String oid,int type){this(oid,type,1);}public SnmpRequest(String oid,int type,int n){this((byte)type,1,0,"public");for(int i=0;i<n;i++)addVarbind(oid);}public SnmpRequest(byte type,int id,int ver,String community){msg_type=type;req_id=id;version=ver;this.community=community;}public void addVarbind(String oid){reqVarbinds.add(new Varbind(oid,null));}public String oid(){return reqVarbinds.get(0).getOid().getValue();} }

