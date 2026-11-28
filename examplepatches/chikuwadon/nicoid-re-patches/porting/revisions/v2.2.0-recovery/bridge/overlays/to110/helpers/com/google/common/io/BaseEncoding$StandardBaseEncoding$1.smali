.class Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;
.super Ljava/io/OutputStream;
.source "BaseEncoding.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->encodingStream(Ljava/io/Writer;)Ljava/io/OutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field bitBuffer:I

.field bitBufferLength:I

.field closed:Z

.field final synthetic this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

.field final synthetic val$out:Ljava/io/Writer;

.field writtenChars:I


# direct methods
.method constructor <init>(Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;Ljava/io/Writer;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$out"
        }
    .end annotation

    .line 649
    iput-object p2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    iput-object p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    const/4 p1, 0x0

    .line 650
    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    .line 653
    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    .line 656
    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    .line 659
    iput-boolean p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->closed:Z

    return-void
.end method


# virtual methods
.method checkOpen()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 689
    iget-boolean p0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->closed:Z

    if-nez p0, :cond_0

    return-void

    .line 690
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "stream closed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public declared-synchronized close()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 696
    :try_start_0
    iget-boolean v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 697
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 699
    :try_start_1
    iput-boolean v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->closed:Z

    .line 700
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    if-lez v1, :cond_1

    .line 701
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v2, v2, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    iget v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    sub-int/2addr v2, v3

    shl-int/2addr v1, v2

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v2, v2, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->mask:I

    and-int/2addr v1, v2

    .line 702
    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    iget-object v3, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v3, v3, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    invoke-virtual {v3, v1}, Lcom/google/common/io/BaseEncoding$Alphabet;->encode(I)C

    move-result v1

    invoke-virtual {v2, v1}, Ljava/io/Writer;->write(I)V

    .line 703
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    .line 704
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v1, v1, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->paddingChar:Ljava/lang/Character;

    if-eqz v1, :cond_1

    .line 705
    :goto_0
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v2, v2, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v2, v2, Lcom/google/common/io/BaseEncoding$Alphabet;->charsPerChunk:I

    rem-int/2addr v1, v2

    if-eqz v1, :cond_1

    .line 706
    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    iget-object v2, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v2, v2, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->paddingChar:Ljava/lang/Character;

    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(I)V

    .line 707
    iget v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    goto :goto_0

    .line 711
    :cond_1
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 712
    monitor-exit p0

    return-void

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public declared-synchronized flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 683
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->checkOpen()V

    .line 684
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 685
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized write(I)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "b"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 669
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->checkOpen()V

    .line 670
    iget v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    shl-int/lit8 v0, v0, 0x8

    and-int/lit16 p1, p1, 0xff

    or-int/2addr v0, p1

    .line 671
    iput v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    .line 672
    iget p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    add-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    .line 673
    :goto_0
    iget p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v0, v0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v0, v0, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    if-lt p1, v0, :cond_0

    .line 674
    iget p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBuffer:I

    iget v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v1, v1, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v1, v1, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    sub-int/2addr v0, v1

    shr-int/2addr p1, v0

    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v0, v0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v0, v0, Lcom/google/common/io/BaseEncoding$Alphabet;->mask:I

    and-int/2addr p1, v0

    .line 675
    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->val$out:Ljava/io/Writer;

    iget-object v1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v1, v1, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    invoke-virtual {v1, p1}, Lcom/google/common/io/BaseEncoding$Alphabet;->encode(I)C

    move-result p1

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(I)V

    .line 676
    iget p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->writtenChars:I

    .line 677
    iget p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I

    iget-object v0, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->this$0:Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;

    iget-object v0, v0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding;->alphabet:Lcom/google/common/io/BaseEncoding$Alphabet;

    iget v0, v0, Lcom/google/common/io/BaseEncoding$Alphabet;->bitsPerChar:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/google/common/io/BaseEncoding$StandardBaseEncoding$1;->bitBufferLength:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 679
    :cond_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method public declared-synchronized write([BII)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 664
    :try_start_0
    invoke-super {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 665
    monitor-exit p0

    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
