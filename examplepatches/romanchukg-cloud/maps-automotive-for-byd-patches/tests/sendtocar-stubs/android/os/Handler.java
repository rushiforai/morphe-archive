// SPDX-License-Identifier: GPL-3.0-only
package android.os;
public class Handler{public static final java.util.concurrent.LinkedBlockingQueue<Runnable> posted=new java.util.concurrent.LinkedBlockingQueue<>();public Handler(Looper l){}public boolean post(Runnable r){posted.add(r);return true;}}
