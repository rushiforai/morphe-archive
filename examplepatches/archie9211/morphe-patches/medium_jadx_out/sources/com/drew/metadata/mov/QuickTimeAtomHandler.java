package com.drew.metadata.mov;

import com.drew.imaging.quicktime.QuickTimeHandler;
import com.drew.lang.SequentialByteArrayReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.mov.atoms.Atom;
import com.drew.metadata.mov.atoms.FileTypeCompatibilityAtom;
import com.drew.metadata.mov.atoms.HandlerReferenceAtom;
import com.drew.metadata.mov.atoms.MediaHeaderAtom;
import com.drew.metadata.mov.atoms.MovieHeaderAtom;
import com.drew.metadata.mov.atoms.TrackHeaderAtom;
import com.drew.metadata.mov.atoms.canon.CanonThumbnailAtom;
import com.drew.metadata.xmp.XmpReader;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class QuickTimeAtomHandler extends QuickTimeHandler<QuickTimeDirectory> {
    private QuickTimeHandlerFactory handlerFactory;

    public QuickTimeAtomHandler(Metadata metadata) {
        super(metadata);
        this.handlerFactory = new QuickTimeHandlerFactory(this);
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeDirectory createDirectory() {
        return new QuickTimeDirectory();
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final QuickTimeHandler<?> processAtom(Atom atom, byte[] bArr, QuickTimeContext quickTimeContext) {
        if (bArr != null) {
            SequentialByteArrayReader sequentialByteArrayReader = new SequentialByteArrayReader(bArr, 0);
            if (atom.type.equals("mvhd")) {
                new MovieHeaderAtom(sequentialByteArrayReader, atom).addMetadata(this.directory);
                return this;
            }
            if (atom.type.equals("ftyp")) {
                new FileTypeCompatibilityAtom(sequentialByteArrayReader, atom).addMetadata(this.directory);
                return this;
            }
            if (atom.type.equals("hdlr")) {
                return this.handlerFactory.getHandler(new HandlerReferenceAtom(sequentialByteArrayReader, atom).getComponentType(), this.metadata, quickTimeContext);
            }
            if (atom.type.equals("mdhd")) {
                new MediaHeaderAtom(sequentialByteArrayReader, atom, quickTimeContext);
                return this;
            }
            if (atom.type.equals(QuickTimeAtomTypes.ATOM_CANON_THUMBNAIL)) {
                new CanonThumbnailAtom(sequentialByteArrayReader).addMetadata(this.directory);
                return this;
            }
            if (atom.type.equals(QuickTimeAtomTypes.ATOM_ADOBE_XMP)) {
                new XmpReader().extract(bArr, 0, bArr.length, this.metadata, this.directory);
                return this;
            }
            if (atom.type.equals("tkhd")) {
                new TrackHeaderAtom(sequentialByteArrayReader, atom).addMetadata(this.directory);
                return this;
            }
        } else if (atom.type.equals("cmov")) {
            this.directory.addError("Compressed QuickTime movies not supported");
        }
        return this;
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptAtom(Atom atom) {
        return atom.type.equals("ftyp") || atom.type.equals("mvhd") || atom.type.equals("hdlr") || atom.type.equals("mdhd") || atom.type.equals(QuickTimeAtomTypes.ATOM_CANON_THUMBNAIL) || atom.type.equals(QuickTimeAtomTypes.ATOM_ADOBE_XMP) || atom.type.equals("tkhd");
    }

    @Override // com.drew.imaging.quicktime.QuickTimeHandler
    public final boolean shouldAcceptContainer(Atom atom) {
        return atom.type.equals("trak") || atom.type.equals("udta") || atom.type.equals("meta") || atom.type.equals("moov") || atom.type.equals("mdia");
    }
}
