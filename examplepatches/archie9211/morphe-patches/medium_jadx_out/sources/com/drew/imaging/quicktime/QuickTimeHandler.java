package com.drew.imaging.quicktime;

import com.drew.metadata.Metadata;
import com.drew.metadata.mov.QuickTimeContext;
import com.drew.metadata.mov.QuickTimeDirectory;
import com.drew.metadata.mov.atoms.Atom;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class QuickTimeHandler<T extends QuickTimeDirectory> {
    protected T directory;
    protected Metadata metadata;

    public QuickTimeHandler(Metadata metadata) {
        this.metadata = metadata;
        T t = (T) createDirectory();
        this.directory = t;
        metadata.addDirectory(t);
    }

    public final void addError(String str) {
        this.directory.addError(str);
    }

    public abstract T createDirectory();

    public abstract QuickTimeHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext);

    public final QuickTimeHandler<?> processContainer(Atom atom, QuickTimeContext quickTimeContext) {
        return processAtom(atom, null, quickTimeContext);
    }

    public abstract boolean shouldAcceptAtom(Atom atom);

    public abstract boolean shouldAcceptContainer(Atom atom);
}
