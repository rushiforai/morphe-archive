package com.drew.metadata.tiff;

import com.drew.imaging.tiff.TiffHandler;
import com.drew.lang.Rational;
import com.drew.metadata.Directory;
import com.drew.metadata.ErrorDirectory;
import com.drew.metadata.Metadata;
import com.drew.metadata.StringValue;
import defpackage.ik4;
import java.util.Stack;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class DirectoryTiffHandler implements TiffHandler {
    protected Directory _currentDirectory;
    private final Stack<Directory> _directoryStack = new Stack<>();
    protected final Metadata _metadata;
    private Directory _rootParentDirectory;

    public DirectoryTiffHandler(Metadata metadata, Directory directory) {
        this._metadata = metadata;
        this._rootParentDirectory = directory;
    }

    private Directory getCurrentOrErrorDirectory() {
        Directory directory = this._currentDirectory;
        if (directory != null) {
            return directory;
        }
        ErrorDirectory errorDirectory = (ErrorDirectory) this._metadata.getFirstDirectoryOfType(ErrorDirectory.class);
        if (errorDirectory != null) {
            return errorDirectory;
        }
        pushDirectory(ErrorDirectory.class);
        return this._currentDirectory;
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void endingIFD() {
        this._currentDirectory = this._directoryStack.empty() ? null : this._directoryStack.pop();
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void error(String str) {
        getCurrentOrErrorDirectory().addError(str);
    }

    public final void pushDirectory(Directory directory) {
        Directory directory2 = this._currentDirectory;
        if (directory2 == null) {
            Directory directory3 = this._rootParentDirectory;
            if (directory3 != null) {
                directory.setParent(directory3);
                this._rootParentDirectory = null;
            }
        } else {
            this._directoryStack.push(directory2);
            directory.setParent(this._currentDirectory);
        }
        this._currentDirectory = directory;
        this._metadata.addDirectory(directory);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setByteArray(int i, byte[] bArr) {
        this._currentDirectory.setByteArray(i, bArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setDouble(int i, double d) {
        this._currentDirectory.setDouble(i, d);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setDoubleArray(int i, double[] dArr) {
        this._currentDirectory.setObjectArray(i, dArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setFloat(int i, float f) {
        this._currentDirectory.setFloat(i, f);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setFloatArray(int i, float[] fArr) {
        this._currentDirectory.setObjectArray(i, fArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt16s(int i, int i2) {
        this._currentDirectory.setInt(i, i2);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt16sArray(int i, short[] sArr) {
        this._currentDirectory.setObjectArray(i, sArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt16u(int i, int i2) {
        this._currentDirectory.setInt(i, i2);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt16uArray(int i, int[] iArr) {
        this._currentDirectory.setObjectArray(i, iArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt32s(int i, int i2) {
        this._currentDirectory.setInt(i, i2);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt32sArray(int i, int[] iArr) {
        this._currentDirectory.setObjectArray(i, iArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt32u(int i, long j) {
        this._currentDirectory.setLong(i, j);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt32uArray(int i, long[] jArr) {
        this._currentDirectory.setObjectArray(i, jArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt8s(int i, byte b) {
        this._currentDirectory.setInt(i, b);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt8sArray(int i, byte[] bArr) {
        this._currentDirectory.setByteArray(i, bArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt8u(int i, short s) {
        this._currentDirectory.setInt(i, s);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setInt8uArray(int i, short[] sArr) {
        this._currentDirectory.setObjectArray(i, sArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setRational(int i, Rational rational) {
        this._currentDirectory.setObject(i, rational);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setRationalArray(int i, Rational[] rationalArr) {
        this._currentDirectory.setObjectArray(i, rationalArr);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void setString(int i, StringValue stringValue) {
        this._currentDirectory.setStringValue(i, stringValue);
    }

    @Override // com.drew.imaging.tiff.TiffHandler
    public final void warn(String str) {
        getCurrentOrErrorDirectory().addError(str);
    }

    public final void pushDirectory(Class<? extends Directory> cls) {
        try {
            pushDirectory(cls.newInstance());
        } catch (IllegalAccessException e) {
            ik4.j(e);
        } catch (InstantiationException e2) {
            ik4.j(e2);
        }
    }
}
