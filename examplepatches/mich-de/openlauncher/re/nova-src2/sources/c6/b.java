package c6;

import b.c0;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.io.ByteArrayInputStream;
import java.io.DataInput;
import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;

/* loaded from: classes2.dex */
public class b extends InputStream implements DataInput {

    /* renamed from: e, reason: collision with root package name */
    public static final ByteOrder f19706e = ByteOrder.LITTLE_ENDIAN;

    /* renamed from: f, reason: collision with root package name */
    public static final ByteOrder f19707f = ByteOrder.BIG_ENDIAN;

    /* renamed from: a, reason: collision with root package name */
    public final DataInputStream f19708a;

    /* renamed from: b, reason: collision with root package name */
    public ByteOrder f19709b;

    /* renamed from: c, reason: collision with root package name */
    public int f19710c;

    /* renamed from: d, reason: collision with root package name */
    public byte[] f19711d;

    public b(byte[] bArr) {
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bArr);
        ByteOrder byteOrder = ByteOrder.BIG_ENDIAN;
        this(byteArrayInputStream, 0);
    }

    public final void a(int i5) throws IOException {
        int i11 = 0;
        while (i11 < i5) {
            int i12 = i5 - i11;
            DataInputStream dataInputStream = this.f19708a;
            int iSkip = (int) dataInputStream.skip(i12);
            if (iSkip <= 0) {
                if (this.f19711d == null) {
                    this.f19711d = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                }
                iSkip = dataInputStream.read(this.f19711d, 0, Math.min(UserMetadata.MAX_INTERNAL_KEY_SIZE, i12));
                if (iSkip == -1) {
                    throw new EOFException(c0.i(i5, "Reached EOF while skipping ", " bytes."));
                }
            }
            i11 += iSkip;
        }
        this.f19710c += i11;
    }

    @Override // java.io.InputStream
    public final int available() {
        return this.f19708a.available();
    }

    @Override // java.io.InputStream
    public final void mark(int i5) {
        throw new UnsupportedOperationException("Mark is currently unsupported");
    }

    @Override // java.io.InputStream
    public final int read() {
        this.f19710c++;
        return this.f19708a.read();
    }

    @Override // java.io.DataInput
    public final boolean readBoolean() {
        this.f19710c++;
        return this.f19708a.readBoolean();
    }

    @Override // java.io.DataInput
    public final byte readByte() throws IOException {
        this.f19710c++;
        int i5 = this.f19708a.read();
        if (i5 >= 0) {
            return (byte) i5;
        }
        throw new EOFException();
    }

    @Override // java.io.DataInput
    public final char readChar() {
        this.f19710c += 2;
        return this.f19708a.readChar();
    }

    @Override // java.io.DataInput
    public final double readDouble() {
        return Double.longBitsToDouble(readLong());
    }

    @Override // java.io.DataInput
    public final float readFloat() {
        return Float.intBitsToFloat(readInt());
    }

    @Override // java.io.DataInput
    public final void readFully(byte[] bArr, int i5, int i11) throws IOException {
        this.f19710c += i11;
        this.f19708a.readFully(bArr, i5, i11);
    }

    @Override // java.io.DataInput
    public final int readInt() throws IOException {
        this.f19710c += 4;
        DataInputStream dataInputStream = this.f19708a;
        int i5 = dataInputStream.read();
        int i11 = dataInputStream.read();
        int i12 = dataInputStream.read();
        int i13 = dataInputStream.read();
        if ((i5 | i11 | i12 | i13) < 0) {
            throw new EOFException();
        }
        ByteOrder byteOrder = this.f19709b;
        if (byteOrder == f19706e) {
            return (i13 << 24) + (i12 << 16) + (i11 << 8) + i5;
        }
        if (byteOrder == f19707f) {
            return (i5 << 24) + (i11 << 16) + (i12 << 8) + i13;
        }
        throw new IOException("Invalid byte order: " + this.f19709b);
    }

    @Override // java.io.DataInput
    public final String readLine() {
        return null;
    }

    @Override // java.io.DataInput
    public final long readLong() throws IOException {
        long j11;
        long j12;
        this.f19710c += 8;
        DataInputStream dataInputStream = this.f19708a;
        int i5 = dataInputStream.read();
        int i11 = dataInputStream.read();
        int i12 = dataInputStream.read();
        int i13 = dataInputStream.read();
        int i14 = dataInputStream.read();
        int i15 = dataInputStream.read();
        int i16 = dataInputStream.read();
        int i17 = dataInputStream.read();
        if ((i5 | i11 | i12 | i13 | i14 | i15 | i16 | i17) < 0) {
            throw new EOFException();
        }
        ByteOrder byteOrder = this.f19709b;
        if (byteOrder == f19706e) {
            j11 = (i17 << 56) + (i16 << 48) + (i15 << 40) + (i14 << 32) + (i13 << 24) + (i12 << 16) + (i11 << 8);
            j12 = i5;
        } else {
            if (byteOrder != f19707f) {
                throw new IOException("Invalid byte order: " + this.f19709b);
            }
            j11 = (i5 << 56) + (i11 << 48) + (i12 << 40) + (i13 << 32) + (i14 << 24) + (i15 << 16) + (i16 << 8);
            j12 = i17;
        }
        return j11 + j12;
    }

    @Override // java.io.DataInput
    public final short readShort() throws IOException {
        this.f19710c += 2;
        DataInputStream dataInputStream = this.f19708a;
        int i5 = dataInputStream.read();
        int i11 = dataInputStream.read();
        if ((i5 | i11) < 0) {
            throw new EOFException();
        }
        ByteOrder byteOrder = this.f19709b;
        if (byteOrder == f19706e) {
            return (short) ((i11 << 8) + i5);
        }
        if (byteOrder == f19707f) {
            return (short) ((i5 << 8) + i11);
        }
        throw new IOException("Invalid byte order: " + this.f19709b);
    }

    @Override // java.io.DataInput
    public final String readUTF() {
        this.f19710c += 2;
        return this.f19708a.readUTF();
    }

    @Override // java.io.DataInput
    public final int readUnsignedByte() {
        this.f19710c++;
        return this.f19708a.readUnsignedByte();
    }

    @Override // java.io.DataInput
    public final int readUnsignedShort() throws IOException {
        this.f19710c += 2;
        DataInputStream dataInputStream = this.f19708a;
        int i5 = dataInputStream.read();
        int i11 = dataInputStream.read();
        if ((i5 | i11) < 0) {
            throw new EOFException();
        }
        ByteOrder byteOrder = this.f19709b;
        if (byteOrder == f19706e) {
            return (i11 << 8) + i5;
        }
        if (byteOrder == f19707f) {
            return (i5 << 8) + i11;
        }
        throw new IOException("Invalid byte order: " + this.f19709b);
    }

    @Override // java.io.InputStream
    public final void reset() {
        throw new UnsupportedOperationException("Reset is currently unsupported");
    }

    @Override // java.io.DataInput
    public final int skipBytes(int i5) {
        throw new UnsupportedOperationException("skipBytes is currently unsupported");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public b(InputStream inputStream) {
        this(inputStream, 0);
        ByteOrder byteOrder = ByteOrder.BIG_ENDIAN;
    }

    public b(InputStream inputStream, int i5) {
        ByteOrder byteOrder = ByteOrder.BIG_ENDIAN;
        this.f19709b = byteOrder;
        DataInputStream dataInputStream = new DataInputStream(inputStream);
        this.f19708a = dataInputStream;
        dataInputStream.mark(0);
        this.f19710c = 0;
        this.f19709b = byteOrder;
    }

    @Override // java.io.InputStream
    public final int read(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f19708a.read(bArr, i5, i11);
        this.f19710c += i12;
        return i12;
    }

    @Override // java.io.DataInput
    public final void readFully(byte[] bArr) throws IOException {
        this.f19710c += bArr.length;
        this.f19708a.readFully(bArr);
    }
}
