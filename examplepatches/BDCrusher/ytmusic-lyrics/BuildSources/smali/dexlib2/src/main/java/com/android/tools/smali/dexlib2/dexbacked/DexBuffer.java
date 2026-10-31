/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/smali
 *
 * -------------------------------------------------------------------
 *
 * Copyright 2012, Google LLC
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following disclaimer
 * in the documentation and/or other materials provided with the
 * distribution.
 *     * Neither the name of Google LLC nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

package com.android.tools.smali.dexlib2.dexbacked;

import com.android.tools.smali.util.ExceptionWithContext;

import javax.annotation.Nonnull;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class DexBuffer {
    private final ByteBuffer buffer;
    private final int baseOffset;

    public DexBuffer(@Nonnull byte[] buf) {
        this(buf, 0);
    }
    public DexBuffer(@Nonnull byte[] buf, int offset) {
        this(ByteBuffer.wrap(buf), offset);
    }

    public DexBuffer(@Nonnull ByteBuffer buf) {
        this(buf, 0);
    }
    public DexBuffer(@Nonnull ByteBuffer buf, int offset) {
        this.buffer = buf.order(ByteOrder.LITTLE_ENDIAN);
        this.baseOffset = offset;
    }

    public int readSmallUint(int offset) {
        offset += baseOffset;
        int result = (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8) |
                ((buffer.get(offset+2) & 0xff) << 16) |
                ((buffer.get(offset+3)) << 24);
        //int result = getBuf().getInt(getBaseOffset() + offset);
        if (result < 0) {
            throw new ExceptionWithContext("Encountered small uint that is out of range at offset 0x%x", offset);
        }
        return result;
    }

    public int readOptionalUint(int offset) {
        offset += baseOffset;
        int result = (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8) |
                ((buffer.get(offset+2) & 0xff) << 16) |
                ((buffer.get(offset+3)) << 24);
        //int result = getBuf().getInt(getBaseOffset() + offset);
        if (result < -1) {
            throw new ExceptionWithContext("Encountered optional uint that is out of range at offset 0x%x", offset);
        }
        return result;
    }

    public int readUshort(int offset) {
        offset += baseOffset;
        return (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8);
        //return getBuf().getShort(getBaseOffset() + offset);
    }

    public int readUbyte(int offset) {
        return buffer.get(offset + baseOffset) & 0xff;
        //return getBuf().get(getBaseOffset() + offset) & 0xff;
    }

    public long readLong(int offset) {
        offset += baseOffset;
        return (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8) |
                ((buffer.get(offset+2) & 0xff) << 16) |
                ((buffer.get(offset+3) & 0xffL) << 24) |
                ((buffer.get(offset+4) & 0xffL) << 32) |
                ((buffer.get(offset+5) & 0xffL) << 40) |
                ((buffer.get(offset+6) & 0xffL) << 48) |
                (((long)buffer.get(offset+7)) << 56);
        //return getBuf().getLong(getBaseOffset() + offset);
    }

    public int readLongAsSmallUint(int offset) {
        offset += baseOffset;
        long result = (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8) |
                ((buffer.get(offset+2) & 0xff) << 16) |
                ((buffer.get(offset+3) & 0xffL) << 24) |
                ((buffer.get(offset+4) & 0xffL) << 32) |
                ((buffer.get(offset+5) & 0xffL) << 40) |
                ((buffer.get(offset+6) & 0xffL) << 48) |
                (((long)buffer.get(offset+7)) << 56);
        //long result = getBuf().getLong(getBaseOffset() + offset);
        if (result < 0 || result > Integer.MAX_VALUE) {
            throw new ExceptionWithContext("Encountered out-of-range ulong at offset 0x%x", offset);
        }
        return (int)result;
    }

    public int readInt(int offset) {
        offset += baseOffset;
        return (buffer.get(offset) & 0xff) |
                ((buffer.get(offset+1) & 0xff) << 8) |
                ((buffer.get(offset+2) & 0xff) << 16) |
                (buffer.get(offset+3) << 24);
        //return getBuf().getInt(getBaseOffset() + offset);
    }

    public int readShort(int offset) {
        offset += baseOffset;
        return (buffer.get(offset) & 0xff) |
                (buffer.get(offset+1) << 8);
        //return getBuf().getShort(getBaseOffset() + offset);
    }

    public int readByte(int offset) {
        return getBuf().get(getBaseOffset() + offset);
    }

    @Nonnull
    public ByteBuffer readByteRange(int start, int length) {
        return getBuf().asReadOnlyBuffer()
                .position(getBaseOffset() + start)
                .limit(length);
    }

    @Nonnull
    public DexReader<? extends DexBuffer> readerAt(int offset) {
        return new DexReader<>(this, offset);
    }

    @Nonnull
    public ByteBuffer getBuf() {
        return buffer;
    }

    public int getBaseOffset() {
        return baseOffset;
    }
}
