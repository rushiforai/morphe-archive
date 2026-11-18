package com.brother.sdk.common.socket.devicemanagement.snmp;
import com.brother.sdk.common.socket.devicemanagement.snmp.westhawk.Varbind;
public class SnmpResult { public enum SnmpState {SuccessRequest,ErrorRequestNoSuchName,ErrorRequestTimeout} public SnmpState state=SnmpState.SuccessRequest; public Varbind[] results; }
