.class final Le/e/a/FragmentedMp4117;
.super Ljava/lang/Object;
.source "FragmentedMp4117.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FragmentedMp4117$Box;,
        Le/e/a/FragmentedMp4117$Cursor;,
        Le/e/a/FragmentedMp4117$Format;,
        Le/e/a/FragmentedMp4117$NotMp4;,
        Le/e/a/FragmentedMp4117$Sample;
    }
.end annotation


# static fields
.field static final MAX_FRAME:I = 0x1000000


# instance fields
.field final file:Ljava/io/RandomAccessFile;

.field final formats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Format;",
            ">;"
        }
    .end annotation
.end field

.field final fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Box;",
            ">;"
        }
    .end annotation
.end field

.field final mdats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Box;",
            ">;"
        }
    .end annotation
.end field

.field final top:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Box;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/io/File;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    const-string v0, "moov"

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/FragmentedMp4117;->formats:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/FragmentedMp4117;->fragments:Ljava/util/List;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/FragmentedMp4117;->mdats:Ljava/util/List;

    .line 11
    new-instance v1, Ljava/io/RandomAccessFile;

    const-string v2, "r"

    invoke-direct {v1, p1, v2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    :try_start_23
    iget-object p1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x8

    cmp-long p1, v1, v3

    if-ltz p1, :cond_14a

    iget-object p1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    const-wide/16 v1, 0x4

    invoke-virtual {p1, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 p1, 0x4

    new-array v3, p1, [B

    iget-object v4, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v3}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance v4, Ljava/lang/String;

    const-string v5, "US-ASCII"

    invoke-direct {v4, v3, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v3, "ftyp"

    const-string v5, "styp"

    const-string v6, "free"

    const-string v7, "sidx"

    filled-new-array {v3, v5, v0, v6, v7}, [Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_144

    iget-object v3, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    invoke-virtual {p0, v5, v6, v3, v4}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Le/e/a/FragmentedMp4117;->top:Ljava/util/List;

    iget-object v3, p0, Le/e/a/FragmentedMp4117;->top:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_6f
    :goto_6f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_120

    iget-object v3, p0, Le/e/a/FragmentedMp4117;->top:Ljava/util/List;

    invoke-static {v3, v0}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v0

    if-eqz v0, :cond_118

    iget-wide v3, v0, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v5, v0, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {p0, v3, v4, v5, v6}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_89
    :goto_89
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_fd

    const-string v3, "mvex"

    invoke-static {v0, v3}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v0

    if-eqz v0, :cond_fc

    iget-wide v3, v0, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v5, v0, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {p0, v3, v4, v5, v6}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a3
    :goto_a3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_aa

    goto :goto_fc

    :cond_aa
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/FragmentedMp4117$Box;

    iget-object v4, v3, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v5, "trex"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a3

    const-wide/16 v4, 0x18

    invoke-virtual {p0, v3, v4, v5}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v4, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v5, v3, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v5, v1

    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v3

    iget-object v5, p0, Le/e/a/FragmentedMp4117;->formats:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_d1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-nez v6, :cond_d8

    goto :goto_a3

    :cond_d8
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/FragmentedMp4117$Format;

    iget-wide v7, v6, Le/e/a/FragmentedMp4117$Format;->id:J

    cmp-long v7, v7, v3

    if-nez v7, :cond_d1

    iget-object v3, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v3, p1}, Ljava/io/RandomAccessFile;->skipBytes(I)I

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v3

    iput-wide v3, v6, Le/e/a/FragmentedMp4117$Format;->defaultDuration:J

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v3

    iput-wide v3, v6, Le/e/a/FragmentedMp4117$Format;->defaultSize:J

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v3

    iput-wide v3, v6, Le/e/a/FragmentedMp4117$Format;->defaultFlags:J

    goto :goto_a3

    :cond_fc
    :goto_fc
    return-void

    :cond_fd
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FragmentedMp4117$Box;

    iget-object v5, v4, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v6, "trak"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_89

    iget-object v5, p0, Le/e/a/FragmentedMp4117;->formats:Ljava/util/List;

    invoke-virtual {p0, v4}, Le/e/a/FragmentedMp4117;->format(Le/e/a/FragmentedMp4117$Box;)Le/e/a/FragmentedMp4117$Format;

    move-result-object v4

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_89

    :cond_118
    new-instance p1, Ljava/io/IOException;

    const-string v0, "MP4\u521d\u671f\u5316\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_11f
    throw p1

    :cond_120
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/FragmentedMp4117$Box;

    iget-object v5, v4, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v6, "moof"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_137

    iget-object v5, p0, Le/e/a/FragmentedMp4117;->fragments:Ljava/util/List;

    :goto_132
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6f

    :cond_137
    iget-object v5, v4, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v6, "mdat"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6f

    iget-object v5, p0, Le/e/a/FragmentedMp4117;->mdats:Ljava/util/List;

    goto :goto_132

    :cond_144
    new-instance p1, Le/e/a/FragmentedMp4117$NotMp4;

    invoke-direct {p1}, Le/e/a/FragmentedMp4117$NotMp4;-><init>()V

    goto :goto_11f

    :cond_14a
    new-instance p1, Le/e/a/FragmentedMp4117$NotMp4;

    invoke-direct {p1}, Le/e/a/FragmentedMp4117$NotMp4;-><init>()V
    :try_end_14f
    .catchall {:try_start_23 .. :try_end_14f} :catchall_150

    goto :goto_11f

    :catchall_150
    move-exception p1

    iget-object v0, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    throw p1
.end method

.method static add(JJ)J
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_10

    const-wide v1, 0x7fffffffffffffffL

    sub-long/2addr v1, p2

    cmp-long v1, p0, v1

    if-gtz v1, :cond_1a

    :cond_10
    if-gez v0, :cond_22

    const-wide/high16 v0, -0x8000000000000000L

    sub-long/2addr v0, p2

    cmp-long v0, p0, v0

    if-ltz v0, :cond_1a

    goto :goto_22

    :cond_1a
    new-instance p0, Ljava/io/IOException;

    const-string p1, "MP4\u6570\u5024\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_22
    :goto_22
    add-long/2addr p0, p2

    return-wide p0
.end method

.method static avcc(Le/e/a/FragmentedMp4117$Format;[B)V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 21
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "H.264\u8a2d\u5b9a\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    :try_start_6
    array-length v3, v1

    const/4 v4, 0x7

    if-lt v3, v4, :cond_90

    const/4 v3, 0x0

    aget-byte v4, v1, v3

    const/4 v5, 0x1

    if-ne v4, v5, :cond_90

    const/4 v4, 0x4

    aget-byte v6, v1, v4

    const/4 v7, 0x3

    and-int/2addr v6, v7

    add-int/2addr v6, v5

    iput v6, v0, Le/e/a/FragmentedMp4117$Format;->nalLength:I

    const/4 v6, 0x5

    aget-byte v6, v1, v6

    and-int/lit8 v6, v6, 0x1f

    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v9, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/4 v10, 0x6

    move v11, v3

    :goto_29
    const/4 v12, 0x2

    if-lt v11, v12, :cond_4d

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    if-eqz v1, :cond_45

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v1

    if-eqz v1, :cond_45

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    iput-object v1, v0, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    iput-object v1, v0, Le/e/a/FragmentedMp4117$Format;->csd1:[B

    return-void

    :cond_45
    new-instance v0, Ljava/io/IOException;

    const-string v1, "SPS/PPS\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_4c
    throw v0

    :cond_4d
    if-ne v11, v5, :cond_5a

    add-int/lit8 v6, v10, 0x1

    aget-byte v10, v1, v10

    and-int/lit16 v10, v10, 0xff

    move/from16 v16, v10

    move v10, v6

    move/from16 v6, v16

    :cond_5a
    move v12, v3

    :goto_5b
    if-lt v12, v6, :cond_60

    add-int/lit8 v11, v11, 0x1

    goto :goto_29

    :cond_60
    aget-byte v13, v1, v10

    and-int/lit16 v13, v13, 0xff

    shl-int/lit8 v13, v13, 0x8

    add-int/lit8 v14, v10, 0x1

    aget-byte v14, v1, v14

    and-int/lit16 v14, v14, 0xff

    or-int/2addr v13, v14

    add-int/lit8 v10, v10, 0x2

    if-lez v13, :cond_8a

    add-int v14, v10, v13

    array-length v15, v1

    if-gt v14, v15, :cond_8a

    if-nez v11, :cond_7a

    move-object v15, v8

    goto :goto_7b

    :cond_7a
    move-object v15, v9

    :goto_7b
    new-array v3, v4, [B

    aput-byte v5, v3, v7

    invoke-virtual {v15, v3}, Ljava/io/ByteArrayOutputStream;->write([B)V

    invoke-virtual {v15, v1, v10, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    add-int/lit8 v12, v12, 0x1

    move v10, v14

    const/4 v3, 0x0

    goto :goto_5b

    :cond_8a
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_4c

    :cond_90
    new-instance v0, Ljava/io/IOException;

    const-string v1, "H.264\u8a2d\u5b9a\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_97
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_97} :catch_98

    goto :goto_4c

    :catch_98
    move-exception v0

    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Box;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Le/e/a/FragmentedMp4117$Box;"
        }
    .end annotation

    .line 12
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 p0, 0x0

    return-object p0

    :cond_c
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FragmentedMp4117$Box;

    iget-object v1, v0, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    return-object v0
.end method

.method static isFragmented(Ljava/io/File;)Z
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 9
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    :try_start_8
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v0, "r"

    move-object/from16 v4, p0

    invoke-direct {v3, v4, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_8 .. :try_end_11} :catchall_b7

    :try_start_11
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4
    :try_end_15
    .catchall {:try_start_11 .. :try_end_15} :catchall_af

    const-wide/16 v6, 0x8

    cmp-long v0, v4, v6

    if-gez v0, :cond_1f

    :try_start_1b
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V

    return v1

    :cond_1f
    const-wide/16 v8, 0x0

    move-wide v10, v8

    :goto_22
    cmp-long v0, v10, v4

    if-ltz v0, :cond_2a

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_29
    .catchall {:try_start_1b .. :try_end_29} :catchall_b7

    return v1

    :cond_2a
    sub-long v12, v4, v10

    cmp-long v0, v12, v6

    if-ltz v0, :cond_a7

    :try_start_30
    invoke-virtual {v3, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v0

    int-to-long v14, v0

    const-wide v16, 0xffffffffL

    and-long v14, v14, v16

    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-virtual {v3, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance v2, Ljava/lang/String;

    const-string v6, "US-ASCII"

    invoke-direct {v2, v0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    cmp-long v0, v10, v8

    if-nez v0, :cond_6c

    const-string v0, "ftyp"

    const-string v6, "styp"

    const-string v7, "moov"

    const-string v8, "free"

    const-string v9, "sidx"

    filled-new-array {v0, v6, v7, v8, v9}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0
    :try_end_66
    .catchall {:try_start_30 .. :try_end_66} :catchall_af

    if-nez v0, :cond_6c

    :try_start_68
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_6b
    .catchall {:try_start_68 .. :try_end_6b} :catchall_b7

    return v1

    :cond_6c
    const-wide/16 v6, 0x1

    cmp-long v0, v14, v6

    if-nez v0, :cond_7c

    :try_start_72
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v14

    const-wide/16 v6, 0x10

    move-wide v8, v6

    const-wide/16 v6, 0x0

    goto :goto_85

    :cond_7c
    const-wide/16 v6, 0x0

    cmp-long v0, v14, v6

    if-nez v0, :cond_83

    move-wide v14, v12

    :cond_83
    const-wide/16 v8, 0x8

    :goto_85
    cmp-long v0, v14, v8

    if-ltz v0, :cond_9f

    cmp-long v0, v14, v12

    if-gtz v0, :cond_9f

    const-string v0, "moof"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_93
    .catchall {:try_start_72 .. :try_end_93} :catchall_af

    if-eqz v0, :cond_9a

    :try_start_95
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V
    :try_end_98
    .catchall {:try_start_95 .. :try_end_98} :catchall_b7

    const/4 v0, 0x1

    return v0

    :cond_9a
    add-long/2addr v10, v14

    move-wide v8, v6

    const-wide/16 v6, 0x8

    goto :goto_22

    :cond_9f
    :try_start_9f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP4\u30dc\u30c3\u30af\u30b9\u306e\u7bc4\u56f2\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_a6
    throw v0

    :cond_a7
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP4\u30dc\u30c3\u30af\u30b9\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_ae
    .catchall {:try_start_9f .. :try_end_ae} :catchall_af

    goto :goto_a6

    :catchall_af
    move-exception v0

    move-object v2, v0

    :try_start_b1
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->close()V

    throw v2
    :try_end_b5
    .catchall {:try_start_b1 .. :try_end_b5} :catchall_b5

    :catchall_b5
    move-exception v0

    goto :goto_b9

    :catchall_b7
    move-exception v0

    const/4 v2, 0x0

    :goto_b9
    if-eqz v2, :cond_c1

    if-eq v2, v0, :cond_c2

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_c2

    :cond_c1
    move-object v2, v0

    :cond_c2
    :goto_c2
    throw v2
.end method

.method static micros(JJ)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_1e

    cmp-long v0, p2, v0

    if-lez v0, :cond_1e

    div-long v0, p0, p2

    const-wide v2, 0x8637bd05af6L

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1e

    const-wide/32 v2, 0xf4240

    mul-long/2addr v0, v2

    rem-long/2addr p0, p2

    mul-long/2addr p0, v2

    div-long/2addr p0, p2

    add-long/2addr v0, p0

    return-wide v0

    :cond_1e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "MP4\u6642\u523b\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static specific([BII)[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Le/e/a/FragmentedMp4117;->specific([BIII)[B

    move-result-object p0

    return-object p0
.end method

.method static specific([BIII)[B
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 23
    const/16 v0, 0x8

    if-gt p3, v0, :cond_98

    :goto_4
    if-lt p1, p2, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    add-int/lit8 v0, p1, 0x1

    aget-byte p1, p0, p1

    and-int/lit16 p1, p1, 0xff

    const/4 v1, 0x0

    move v2, v1

    :goto_10
    const-string v3, "AAC\u8a18\u8ff0\u5b50\u304c\u4e0d\u6b63\u3067\u3059"

    if-ge v0, p2, :cond_92

    add-int/lit8 v4, v1, 0x1

    const/4 v5, 0x4

    if-ge v1, v5, :cond_92

    add-int/lit8 v1, v0, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v2, v2, 0x7

    and-int/lit8 v6, v0, 0x7f

    or-int/2addr v2, v6

    and-int/lit16 v0, v0, 0x80

    if-nez v0, :cond_8e

    sub-int v0, p2, v1

    if-gt v2, v0, :cond_86

    add-int v0, v1, v2

    const/4 v4, 0x5

    if-ne p1, v4, :cond_36

    invoke-static {p0, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    return-object p0

    :cond_36
    const/4 v4, 0x3

    if-ne p1, v4, :cond_6e

    if-lt v2, v4, :cond_66

    add-int/lit8 p1, v1, 0x2

    aget-byte p1, p0, p1

    and-int/lit16 p1, p1, 0xff

    add-int/lit8 v1, v1, 0x3

    and-int/lit16 v2, p1, 0x80

    if-eqz v2, :cond_49

    add-int/lit8 v1, v1, 0x2

    :cond_49
    and-int/lit8 v2, p1, 0x40

    if-eqz v2, :cond_5f

    if-ge v1, v0, :cond_57

    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v1, v2

    goto :goto_5f

    :cond_57
    new-instance p0, Ljava/io/IOException;

    const-string p1, "AAC URL\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_5f
    :goto_5f
    and-int/lit8 p1, p1, 0x20

    if-eqz p1, :cond_72

    add-int/lit8 v1, v1, 0x2

    goto :goto_72

    :cond_66
    new-instance p0, Ljava/io/IOException;

    const-string p1, "AAC ES\u60c5\u5831\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_6e
    if-ne p1, v5, :cond_83

    add-int/lit8 v1, v1, 0xd

    :cond_72
    :goto_72
    if-gt v1, v0, :cond_7d

    add-int/lit8 p1, p3, 0x1

    invoke-static {p0, v1, v0, p1}, Le/e/a/FragmentedMp4117;->specific([BIII)[B

    move-result-object p1

    if-eqz p1, :cond_83

    return-object p1

    :cond_7d
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_83
    move p1, v0

    goto/16 :goto_4

    :cond_86
    new-instance p0, Ljava/io/IOException;

    const-string p1, "AAC\u8a18\u8ff0\u5b50\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8e
    move v0, v1

    move v1, v4

    goto/16 :goto_10

    :cond_92
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_98
    new-instance p0, Ljava/io/IOException;

    const-string p1, "AAC\u8a18\u8ff0\u5b50\u306e\u5165\u308c\u5b50\u304c\u6df1\u3059\u304e\u307e\u3059"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method boxes(JJ)Ljava/util/List;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Ljava/util/List<",
            "Le/e/a/FragmentedMp4117$Box;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-wide v2, p1

    :goto_6
    cmp-long p1, v2, p3

    if-ltz p1, :cond_b

    return-object v0

    :cond_b
    sub-long p1, p3, v2

    const-wide/16 v4, 0x8

    cmp-long v1, p1, v4

    if-ltz v1, :cond_71

    iget-object v1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v6

    const/4 v1, 0x4

    new-array v1, v1, [B

    iget-object v8, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v8, v1}, Ljava/io/RandomAccessFile;->readFully([B)V

    new-instance v8, Ljava/lang/String;

    const-string v9, "US-ASCII"

    invoke-direct {v8, v1, v9}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-wide/16 v9, 0x1

    cmp-long v1, v6, v9

    if-nez v1, :cond_3a

    iget-object v1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v1}, Ljava/io/RandomAccessFile;->readLong()J

    move-result-wide v6

    const-wide/16 v4, 0x10

    goto :goto_41

    :cond_3a
    const-wide/16 v9, 0x0

    cmp-long v1, v6, v9

    if-nez v1, :cond_41

    move-wide v6, p1

    :cond_41
    :goto_41
    cmp-long v1, v6, v4

    if-ltz v1, :cond_69

    cmp-long p1, v6, p1

    if-gtz p1, :cond_69

    new-instance p1, Le/e/a/FragmentedMp4117$Box;

    add-long/2addr v4, v2

    add-long v9, v2, v6

    move-object v1, p1

    move-wide v6, v9

    invoke-direct/range {v1 .. v8}, Le/e/a/FragmentedMp4117$Box;-><init>(JJJLjava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const p2, 0x30d40

    if-gt p1, p2, :cond_61

    move-wide v2, v9

    goto :goto_6

    :cond_61
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP4\u30dc\u30c3\u30af\u30b9\u304c\u591a\u3059\u304e\u307e\u3059"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_69
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP4\u30dc\u30c3\u30af\u30b9\u306e\u7bc4\u56f2\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_71
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP4\u30dc\u30c3\u30af\u30b9\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method bytes(Le/e/a/FragmentedMp4117$Box;I)[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    iget-wide v0, p1, Le/e/a/FragmentedMp4117$Box;->end:J

    iget-wide v2, p1, Le/e/a/FragmentedMp4117$Box;->data:J

    sub-long/2addr v0, v2

    int-to-long v2, p2

    sub-long/2addr v0, v2

    const-wide/16 v4, 0x0

    cmp-long p2, v0, v4

    if-ltz p2, :cond_25

    const-wide/32 v4, 0x100000

    cmp-long p2, v0, v4

    if-gtz p2, :cond_25

    long-to-int p2, v0

    new-array p2, p2, [B

    iget-object v0, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v4, p1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v4, v2

    invoke-virtual {v0, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object p1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, p2}, Ljava/io/RandomAccessFile;->readFully([B)V

    return-object p2

    :cond_25
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP4\u8a2d\u5b9a\u60c5\u5831\u306e\u9577\u3055\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    iget-object v0, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    return-void
.end method

.method cursor(Le/e/a/FragmentedMp4117$Format;)Le/e/a/FragmentedMp4117$Cursor;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 24
    new-instance v0, Le/e/a/FragmentedMp4117$Cursor;

    invoke-direct {v0, p0, p1}, Le/e/a/FragmentedMp4117$Cursor;-><init>(Le/e/a/FragmentedMp4117;Le/e/a/FragmentedMp4117$Format;)V

    return-object v0
.end method

.method flags(Le/e/a/FragmentedMp4117$Box;)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    const-wide/16 v0, 0x4

    invoke-virtual {p0, p1, v0, v1}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v0, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v1, p1, Le/e/a/FragmentedMp4117$Box;->data:J

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object p1, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->readInt()I

    move-result p1

    return p1
.end method

.method format(Le/e/a/FragmentedMp4117$Box;)Le/e/a/FragmentedMp4117$Format;
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-wide v2, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v4, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v2, v3, v4, v5}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v2, "tkhd"

    invoke-static {v1, v2}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v2

    const-string v3, "mdia"

    invoke-static {v1, v3}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v2, :cond_22c

    if-eqz v1, :cond_22c

    new-instance v3, Le/e/a/FragmentedMp4117$Format;

    invoke-direct {v3}, Le/e/a/FragmentedMp4117$Format;-><init>()V

    invoke-virtual {v0, v2}, Le/e/a/FragmentedMp4117;->flags(Le/e/a/FragmentedMp4117$Box;)I

    move-result v4

    const/16 v5, 0x18

    ushr-int/2addr v4, v5

    const/16 v6, 0x10

    const/4 v7, 0x1

    if-ne v4, v7, :cond_2f

    move v8, v5

    goto :goto_30

    :cond_2f
    move v8, v6

    :goto_30
    int-to-long v8, v8

    invoke-virtual {v0, v2, v8, v9}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v8, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v9, v2, Le/e/a/FragmentedMp4117$Box;->data:J

    const/16 v2, 0x14

    const/16 v11, 0xc

    if-ne v4, v7, :cond_40

    move v4, v2

    goto :goto_41

    :cond_40
    move v4, v11

    :goto_41
    int-to-long v12, v4

    add-long/2addr v9, v12

    invoke-virtual {v8, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v8

    iput-wide v8, v3, Le/e/a/FragmentedMp4117$Format;->id:J

    iget-wide v8, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v12, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v8, v9, v12, v13}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v4, "mdhd"

    invoke-static {v1, v4}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v4

    const-string v8, "minf"

    invoke-static {v1, v8}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v4, :cond_224

    if-eqz v1, :cond_224

    invoke-virtual {v0, v4}, Le/e/a/FragmentedMp4117;->flags(Le/e/a/FragmentedMp4117$Box;)I

    move-result v8

    ushr-int/2addr v8, v5

    if-ne v8, v7, :cond_6c

    goto :goto_6d

    :cond_6c
    move v5, v6

    :goto_6d
    int-to-long v9, v5

    invoke-virtual {v0, v4, v9, v10}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v5, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v9, v4, Le/e/a/FragmentedMp4117$Box;->data:J

    if-ne v8, v7, :cond_78

    goto :goto_79

    :cond_78
    move v2, v11

    :goto_79
    int-to-long v11, v2

    add-long/2addr v9, v11

    invoke-virtual {v5, v9, v10}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v4

    iput-wide v4, v3, Le/e/a/FragmentedMp4117$Format;->scale:J

    iget-wide v4, v3, Le/e/a/FragmentedMp4117$Format;->scale:J

    const-wide/16 v8, 0x0

    cmp-long v2, v4, v8

    if-eqz v2, :cond_21c

    iget-wide v4, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v1, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v4, v5, v1, v2}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v2, "stbl"

    invoke-static {v1, v2}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v1, :cond_214

    iget-wide v4, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    iget-wide v1, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v4, v5, v1, v2}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v2, "stsd"

    invoke-static {v1, v2}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v1, :cond_20c

    const-wide/16 v4, 0x8

    invoke-virtual {v0, v1, v4, v5}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    iget-object v2, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v8, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    const-wide/16 v10, 0x4

    add-long/2addr v8, v10

    invoke-virtual {v2, v8, v9}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v8

    const-wide/16 v10, 0x1

    cmp-long v2, v8, v10

    if-nez v2, :cond_204

    iget-wide v8, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v8, v4

    iget-wide v1, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v8, v9, v1, v2}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-ne v2, v7, :cond_1fc

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FragmentedMp4117$Box;

    .line 17
    iget-object v8, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v9, "avc1"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    const-wide/16 v9, 0x18

    if-nez v8, :cond_1ba

    iget-object v8, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v11, "avc3"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_f3

    goto/16 :goto_1ba

    .line 18
    :cond_f3
    iget-object v8, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v11, "mp4a"

    invoke-virtual {v8, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1a6

    const-wide/16 v11, 0x1c

    invoke-virtual {v0, v1, v11, v12}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    const-string v8, "audio/mp4a-latm"

    iput-object v8, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    iget-object v8, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v13, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v13, v4

    invoke-virtual {v8, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v4, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result v4

    if-nez v4, :cond_19e

    iget-object v4, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v13, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    const-wide/16 v15, 0x10

    add-long/2addr v13, v15

    invoke-virtual {v4, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v4, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result v4

    iput v4, v3, Le/e/a/FragmentedMp4117$Format;->channels:I

    iget-object v4, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v13, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v13, v9

    invoke-virtual {v4, v13, v14}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/FragmentedMp4117;->u32()J

    move-result-wide v4

    ushr-long/2addr v4, v6

    long-to-int v4, v4

    iput v4, v3, Le/e/a/FragmentedMp4117$Format;->rate:I

    iget-wide v4, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v4, v11

    iget-wide v8, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v4, v5, v8, v9}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v4, "esds"

    invoke-static {v1, v4}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v1, :cond_196

    const/4 v4, 0x4

    invoke-virtual {v0, v1, v4}, Le/e/a/FragmentedMp4117;->bytes(Le/e/a/FragmentedMp4117$Box;I)[B

    move-result-object v1

    array-length v4, v1

    invoke-static {v1, v2, v4}, Le/e/a/FragmentedMp4117;->specific([BII)[B

    move-result-object v1

    iput-object v1, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    iget-object v1, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    if-eqz v1, :cond_18e

    iget-object v1, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    array-length v1, v1

    const/4 v4, 0x2

    if-lt v1, v4, :cond_18e

    iget-object v1, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    aget-byte v1, v1, v2

    const/4 v2, 0x7

    and-int/2addr v1, v2

    shl-int/2addr v1, v7

    iget-object v4, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    aget-byte v4, v4, v7

    and-int/lit16 v4, v4, 0x80

    ushr-int/2addr v4, v2

    or-int/2addr v1, v4

    iget-object v4, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    aget-byte v4, v4, v7

    ushr-int/lit8 v4, v4, 0x3

    and-int/lit8 v4, v4, 0xf

    const/16 v5, 0xd

    new-array v6, v5, [I

    fill-array-data v6, :array_234

    if-ge v1, v5, :cond_183

    aget v1, v6, v1

    iput v1, v3, Le/e/a/FragmentedMp4117$Format;->rate:I

    :cond_183
    if-lez v4, :cond_1f3

    if-gt v4, v2, :cond_1f3

    if-ne v4, v2, :cond_18b

    const/16 v4, 0x8

    :cond_18b
    iput v4, v3, Le/e/a/FragmentedMp4117$Format;->channels:I

    goto :goto_1f3

    :cond_18e
    new-instance v1, Ljava/io/IOException;

    const-string v2, "AAC\u8a2d\u5b9a\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_196
    new-instance v1, Ljava/io/IOException;

    const-string v2, "AAC\u8a2d\u5b9a\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_19e
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u3053\u306e\u97f3\u58f0\u30b5\u30f3\u30d7\u30eb\u5f62\u5f0f\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 19
    :cond_1a6
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "unsupported/"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    goto :goto_1f3

    .line 17
    :cond_1ba
    :goto_1ba
    const-wide/16 v4, 0x4e

    invoke-virtual {v0, v1, v4, v5}, Le/e/a/FragmentedMp4117;->need(Le/e/a/FragmentedMp4117$Box;J)V

    const-string v6, "video/avc"

    iput-object v6, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    iget-object v6, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    iget-wide v7, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v7, v9

    invoke-virtual {v6, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    iget-object v6, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result v6

    iput v6, v3, Le/e/a/FragmentedMp4117$Format;->width:I

    iget-object v6, v0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v6}, Ljava/io/RandomAccessFile;->readUnsignedShort()I

    move-result v6

    iput v6, v3, Le/e/a/FragmentedMp4117$Format;->height:I

    iget-wide v6, v1, Le/e/a/FragmentedMp4117$Box;->data:J

    add-long/2addr v6, v4

    iget-wide v4, v1, Le/e/a/FragmentedMp4117$Box;->end:J

    invoke-virtual {v0, v6, v7, v4, v5}, Le/e/a/FragmentedMp4117;->boxes(JJ)Ljava/util/List;

    move-result-object v1

    const-string v4, "avcC"

    invoke-static {v1, v4}, Le/e/a/FragmentedMp4117;->first(Ljava/util/List;Ljava/lang/String;)Le/e/a/FragmentedMp4117$Box;

    move-result-object v1

    if-eqz v1, :cond_1f4

    invoke-virtual {v0, v1, v2}, Le/e/a/FragmentedMp4117;->bytes(Le/e/a/FragmentedMp4117$Box;I)[B

    move-result-object v1

    invoke-static {v3, v1}, Le/e/a/FragmentedMp4117;->avcc(Le/e/a/FragmentedMp4117$Format;[B)V

    .line 19
    :cond_1f3
    :goto_1f3
    return-object v3

    .line 17
    :cond_1f4
    new-instance v1, Ljava/io/IOException;

    const-string v2, "H.264\u8a2d\u5b9a\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    :cond_1fc
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u5f62\u5f0f\u6570\u304c\u4e00\u81f4\u3057\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_204
    new-instance v1, Ljava/io/IOException;

    const-string v2, "\u8907\u6570\u306eMP4\u5f62\u5f0f\u5207\u66ff\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_20c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u5f62\u5f0f\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_214
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30b5\u30f3\u30d7\u30eb\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_21c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u6642\u523b\u5358\u4f4d\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_224
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30e1\u30c7\u30a3\u30a2\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_22c
    new-instance v1, Ljava/io/IOException;

    const-string v2, "MP4\u30c8\u30e9\u30c3\u30af\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :array_234
    .array-data 4
        0x17700
        0x15888
        0xfa00
        0xbb80
        0xac44
        0x7d00
        0x5dc0
        0x5622
        0x3e80
        0x2ee0
        0x2b11
        0x1f40
        0x1cb6
    .end array-data
.end method

.method inMdat(JJ)Z
    .registers 13

    .line 33
    iget-object v0, p0, Le/e/a/FragmentedMp4117;->mdats:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, 0x0

    move v3, v2

    :goto_a
    if-le v3, v0, :cond_d

    return v2

    :cond_d
    add-int v4, v3, v0

    ushr-int/2addr v4, v1

    iget-object v5, p0, Le/e/a/FragmentedMp4117;->mdats:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Le/e/a/FragmentedMp4117$Box;

    iget-wide v6, v5, Le/e/a/FragmentedMp4117$Box;->data:J

    cmp-long v6, p1, v6

    if-gez v6, :cond_21

    add-int/lit8 v0, v4, -0x1

    goto :goto_a

    :cond_21
    iget-wide v6, v5, Le/e/a/FragmentedMp4117$Box;->end:J

    cmp-long v3, p1, v6

    if-ltz v3, :cond_2a

    add-int/lit8 v3, v4, 0x1

    goto :goto_a

    :cond_2a
    const-wide/16 v3, 0x0

    cmp-long v0, p3, v3

    if-ltz v0, :cond_38

    iget-wide v3, v5, Le/e/a/FragmentedMp4117$Box;->end:J

    sub-long/2addr v3, p1

    cmp-long p1, p3, v3

    if-gtz p1, :cond_38

    return v1

    :cond_38
    return v2
.end method

.method need(Le/e/a/FragmentedMp4117$Box;J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_10

    iget-wide v0, p1, Le/e/a/FragmentedMp4117$Box;->end:J

    iget-wide v2, p1, Le/e/a/FragmentedMp4117$Box;->data:J

    sub-long/2addr v0, v2

    cmp-long p1, v0, p2

    if-ltz p1, :cond_10

    return-void

    :cond_10
    new-instance p1, Ljava/io/IOException;

    const-string p2, "MP4\u60c5\u5831\u304c\u4e0d\u8db3\u3057\u3066\u3044\u307e\u3059"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method nextMdat(Le/e/a/FragmentedMp4117$Box;)Le/e/a/FragmentedMp4117$Box;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    iget-object v0, p0, Le/e/a/FragmentedMp4117;->top:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_30

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/FragmentedMp4117$Box;

    iget-wide v2, v1, Le/e/a/FragmentedMp4117$Box;->start:J

    iget-wide v4, p1, Le/e/a/FragmentedMp4117$Box;->end:J

    cmp-long v2, v2, v4

    if-ltz v2, :cond_2f

    iget-object v2, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v3, "mdat"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_25

    return-object v1

    :cond_25
    iget-object v1, v1, Le/e/a/FragmentedMp4117$Box;->type:Ljava/lang/String;

    const-string v2, "moof"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_30

    :cond_2f
    goto :goto_6

    :cond_30
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u306b\u52d5\u753b\u30c7\u30fc\u30bf\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method u32()J
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    iget-object v0, p0, Le/e/a/FragmentedMp4117;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method
