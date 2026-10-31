/*
 *  Copyright (C) 2022 github.com/REAndroid
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.reandroid.arsc.item;

import com.reandroid.arsc.base.Block;
import com.reandroid.arsc.base.Creator;
import com.reandroid.arsc.base.DirectStreamReader;
import com.reandroid.arsc.io.BlockReader;
import com.reandroid.utils.CompareUtil;
import com.reandroid.utils.HexUtil;
import com.reandroid.utils.ObjectsUtil;

import java.io.IOException;
import java.io.InputStream;

public abstract class OffsetItem extends BlockItem implements DirectStreamReader,
        Comparable<OffsetItem> {

    public static int NO_ENTRY = ObjectsUtil.of(0xffffffff);
    public static int NO_ENTRY16 = ObjectsUtil.of(0xffff);

    public static final Creator<OffsetItem> CREATOR_OFFSET16 = Helper.init16();
    public static final Creator<OffsetItem> CREATOR_OFFSET32 = Helper.init32();
    public static final Creator<OffsetItem> CREATOR_SPARSE = Helper.initSparse();

    /*
     * Offsets exist once per entry and per string of every table, so the value is kept
     * only in fields and encoded on demand instead of backing each item with its own
     * byte array.
     */
    private int mOffset;

    protected OffsetItem() {
        super(0);
    }

    /** The encoded size, 2 or 4 bytes */
    abstract int bytesLength();
    /** Encodes the current values into <code>bytes</code> of {@link #bytesLength()} */
    abstract void encode(byte[] bytes);
    /** Decodes values from <code>bytes</code> of {@link #bytesLength()} */
    abstract void decode(byte[] bytes);

    private byte[] encode() {
        byte[] bytes = new byte[bytesLength()];
        encode(bytes);
        return bytes;
    }
    @Override
    protected byte[] getBytesInternal() {
        return encode();
    }
    @Override
    void setBytesInternal(byte[] bytes, boolean notify) {
        if (bytes == null || bytes.length < bytesLength()) {
            byte[] update = new byte[bytesLength()];
            if (bytes != null) {
                System.arraycopy(bytes, 0, update, 0, bytes.length);
            }
            bytes = update;
        }
        decode(bytes);
    }
    @Override
    int getBytesLength() {
        return bytesLength();
    }
    @Override
    public int countBytes() {
        if (isNull()) {
            return 0;
        }
        return bytesLength();
    }
    @Override
    public void onReadBytes(BlockReader reader) throws IOException {
        byte[] bytes = new byte[bytesLength()];
        reader.readFully(bytes);
        decode(bytes);
    }
    @Override
    public int readBytes(InputStream inputStream) throws IOException {
        byte[] bytes = new byte[bytesLength()];
        int length = bytes.length;
        int offset = 0;
        int read = length;
        while (length > 0 && read > 0) {
            read = inputStream.read(bytes, offset, length);
            length -= read;
            offset += read;
        }
        decode(bytes);
        super.notifyBlockLoad();
        return offset;
    }
    @Override
    public void setBytes(BlockItem blockItem) {
        if (blockItem != this) {
            setBytesInternal(blockItem.getBytesInternal(), true);
        }
    }

    public int getOffset() {
        return mOffset;
    }
    public void setOffset(int offset) {
        if (offset != mOffset) {
            validateOffset(offset);
            mOffset = offset;
        }
    }
    void setOffsetInternal(int offset) {
        this.mOffset = offset;
    }

    public int getIdx() {
        return getIndex();
    }
    public void setIdx(int idx) {
    }

    /** Rejects a value that cannot be encoded, before it is set */
    protected void validateOffset(int offset) {
    }

    public boolean isNoEntry() {
        return getOffset() == NO_ENTRY;
    }

    public int updateOffset(Block target, int offset) {
        if (target.isNull()) {
            setOffset(NO_ENTRY);
        } else {
            setOffset(offset);
            offset = offset + target.countBytes();
        }
        return offset;
    }
    public void readTarget(BlockReader reader, Block target) throws IOException {
        readTarget(reader, target, false);
    }
    public void readTarget(BlockReader reader, Block target, boolean ignoreOutOfRange) throws IOException {
        boolean noEntry = isNoEntry();
        int offset = getOffset();
        if (!noEntry) {
            int maximumPosition = reader.getPosition() + reader.available();
            if (offset < 0 || offset > maximumPosition) {
                if (!ignoreOutOfRange) {
                    throw new IOException("Offset " + offset + " is out of range " + maximumPosition);
                } else {
                    offset = NO_ENTRY;
                    setOffset(offset);
                    noEntry = true;
                }
            }
        }
        target.setNull(noEntry);
        if (!noEntry) {
            int position = reader.getPosition();
            reader.seek(offset);
            try {
                target.readBytes(reader);
            }catch (Exception ex) {
                throw new IOException("Error at:" + toString() + ex.getMessage() , ex);
            }
            int current = reader.getPosition();
            if (current < position) {
                reader.seek(position);
            }
        }
    }

    protected void validateValueRange(int value) {
        if (value != NO_ENTRY && (value & 0xffff0000) != 0) {
            throw new NumberFormatException("Value out of range [0 - 0xffff]: " +
                    HexUtil.toHex(value, 1));
        }
    }

    public int compareOffset(OffsetItem offsetItem) {
        if (offsetItem == this) {
            return 0;
        }
        return CompareUtil.compare(this.getOffset(), offsetItem.getOffset());
    }
    public int compareIdx(OffsetItem offsetItem) {
        if (offsetItem == this) {
            return 0;
        }
        return CompareUtil.compare(this.getIdx(), offsetItem.getIdx());
    }
    @Override
    public int compareTo(OffsetItem offsetItem) {
        return compareIdx(offsetItem);
    }
    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append('(');
        builder.append(getIdx());
        builder.append(", ");
        if (isNoEntry()) {
            builder.append("NO_ENTRY");
        } else {
            builder.append(getOffset());
        }
        builder.append(')');
        return builder.toString();
    }

    static class Offset16 extends OffsetItem {

        public Offset16() {
            super();
        }

        @Override
        int bytesLength() {
            return 2;
        }
        @Override
        void encode(byte[] bytes) {
            int value = getOffset();
            if (value == NO_ENTRY) {
                value = NO_ENTRY16;
            } else {
                value = value / 4;
            }
            putShort(bytes, 0, value);
        }
        @Override
        void decode(byte[] bytes) {
            int value = getShortUnsigned(bytes, 0);
            if (value == NO_ENTRY16) {
                value = NO_ENTRY;
            } else {
                value = value * 4;
            }
            setOffsetInternal(value);
        }

        @Override
        protected void validateOffset(int offset) {
            if (offset != NO_ENTRY) {
                validateValueRange(offset / 4);
            }
        }

        @Override
        public int compareTo(OffsetItem offsetItem) {
            return compareIdx(offsetItem);
        }

    }

    static class Offset32 extends OffsetItem {

        public Offset32() {
            super();
        }

        @Override
        int bytesLength() {
            return 4;
        }
        @Override
        void encode(byte[] bytes) {
            putInteger(bytes, 0, getOffset());
        }
        @Override
        void decode(byte[] bytes) {
            setOffsetInternal(getInteger(bytes, 0));
        }

        @Override
        public int compareTo(OffsetItem offsetItem) {
            return compareIdx(offsetItem);
        }
    }

    static class Sparse extends OffsetItem {

        private int mIdx;

        public Sparse() {
            super();
        }

        @Override
        int bytesLength() {
            return 4;
        }
        @Override
        void encode(byte[] bytes) {
            putShort(bytes, 0, mIdx);
            putShort(bytes, 2, getOffset() / 4);
        }
        @Override
        void decode(byte[] bytes) {
            this.mIdx = getShortUnsigned(bytes, 0);
            setOffsetInternal(getShortUnsigned(bytes, 2) * 4);
        }

        @Override
        public int getIdx() {
            return mIdx;
        }

        @Override
        public void setIdx(int idx) {
            if (idx != mIdx) {
                validateValueRange(idx);
                this.mIdx = idx;
            }
        }
        @Override
        public boolean isNoEntry() {
            return false;
        }

        @Override
        protected void validateOffset(int offset) {
            validateValueRange(offset / 4);
        }

        @Override
        public int compareTo(OffsetItem offsetItem) {
            return compareOffset(offsetItem);
        }
    }

    static class Helper {
        static Creator<OffsetItem> init16() {
            return Offset16::new;
        }
        static Creator<OffsetItem> init32() {
            return Offset32::new;
        }
        static Creator<OffsetItem> initSparse() {
            return Sparse::new;
        }
    }
}
