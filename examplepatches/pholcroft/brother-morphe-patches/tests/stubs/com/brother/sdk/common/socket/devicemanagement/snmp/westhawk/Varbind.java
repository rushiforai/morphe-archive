package com.brother.sdk.common.socket.devicemanagement.snmp.westhawk;
public class Varbind { private final AsnObjectId oid; private final AsnObject value; public Varbind(String s,AsnObject value) {oid=new AsnObjectId(s);this.value=value;} public AsnObjectId getOid(){return oid;} public AsnObject getValue(){return value;} }
