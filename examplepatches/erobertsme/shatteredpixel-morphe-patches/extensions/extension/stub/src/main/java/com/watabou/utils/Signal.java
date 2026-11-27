package com.watabou.utils;

public class Signal<T> {
	public interface Listener<T> {
		boolean onSignal(T t);
	}

	public synchronized void add(Listener<T> listener) { throw new RuntimeException("Stub"); }
	public synchronized void remove(Listener<T> listener) { throw new RuntimeException("Stub"); }
}
