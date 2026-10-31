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
package com.reandroid.archive.io;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class FileChannelOutputStream extends OutputStream {
    private final FileChannel fileChannel;
    private final ByteBuffer buffer;

    public FileChannelOutputStream(FileChannel fileChannel){
        this.fileChannel = fileChannel;
        this.buffer = ByteBuffer.allocate(BUFFER_SIZE);
    }
    @Override
    public void write(byte[] bytes) throws IOException {
        write(bytes, 0, bytes.length);
    }
    @Override
    public void write(byte[] bytes, int offset, int length) throws IOException {
        ByteBuffer buffer = this.buffer;
        if(length > buffer.remaining()){
            flush();
            if(length >= buffer.capacity()){
                writeFully(ByteBuffer.wrap(bytes, offset, length));
                return;
            }
        }
        buffer.put(bytes, offset, length);
    }
    @Override
    public void write(int i) throws IOException {
        ByteBuffer buffer = this.buffer;
        if(!buffer.hasRemaining()){
            flush();
        }
        buffer.put((byte) i);
    }
    /**
     * Writes the buffered bytes to the channel at its current position.
     * Must be called before the channel is used directly.
     */
    @Override
    public void flush() throws IOException {
        ByteBuffer buffer = this.buffer;
        if(buffer.position() == 0){
            return;
        }
        buffer.flip();
        writeFully(buffer);
        buffer.clear();
    }
    private void writeFully(ByteBuffer byteBuffer) throws IOException {
        FileChannel fileChannel = this.fileChannel;
        while (byteBuffer.hasRemaining()){
            fileChannel.write(byteBuffer);
        }
    }
    @Override
    public void close() throws IOException {
        flush();
    }

    private static final int BUFFER_SIZE = 64 * 1024;
}
