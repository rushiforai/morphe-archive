.class public interface abstract Lcom/coremedia/iso/boxes/sampleentry/SampleEntry;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ef3;


# virtual methods
.method public abstract synthetic getBox(Ljava/nio/channels/WritableByteChannel;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getDataReferenceIndex()I
.end method

.method public abstract synthetic getOffset()J
.end method

.method public abstract synthetic getParent()Ll/t16;
.end method

.method public abstract synthetic getSize()J
.end method

.method public abstract synthetic getType()Ljava/lang/String;
.end method

.method public abstract synthetic parse(Ll/h6c;Ljava/nio/ByteBuffer;JLl/ff3;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract setDataReferenceIndex(I)V
.end method

.method public abstract synthetic setParent(Ll/t16;)V
.end method
