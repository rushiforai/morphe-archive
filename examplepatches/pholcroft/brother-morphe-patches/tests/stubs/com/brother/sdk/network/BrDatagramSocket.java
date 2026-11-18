package com.brother.sdk.network;
import java.net.InetAddress;
public class BrDatagramSocket implements com.brother.sdk.common.socket.ISocket { private InetAddress mInetAddress;private int mPort;public BrDatagramSocket(InetAddress ip){this(ip,161);}public BrDatagramSocket(InetAddress ip,int port){mInetAddress=ip;mPort=port;}public void close(){} }

