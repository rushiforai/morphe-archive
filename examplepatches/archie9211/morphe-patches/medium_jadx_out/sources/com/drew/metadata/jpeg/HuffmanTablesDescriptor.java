package com.drew.metadata.jpeg;

import com.drew.metadata.TagDescriptor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HuffmanTablesDescriptor extends TagDescriptor<HuffmanTablesDirectory> {
    public HuffmanTablesDescriptor(HuffmanTablesDirectory huffmanTablesDirectory) {
        super(huffmanTablesDirectory);
    }

    @Override // com.drew.metadata.TagDescriptor
    public final String getDescription(int i) {
        return i != 1 ? super.getDescription(i) : getNumberOfTablesDescription();
    }

    public final String getNumberOfTablesDescription() {
        Integer integer = ((HuffmanTablesDirectory) this._directory).getInteger(1);
        if (integer == null) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(integer);
        sb.append(integer.intValue() == 1 ? " Huffman table" : " Huffman tables");
        return sb.toString();
    }
}
