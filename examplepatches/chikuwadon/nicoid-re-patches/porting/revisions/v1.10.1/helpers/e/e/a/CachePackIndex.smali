.class public final Le/e/a/CachePackIndex;
.super Ljava/lang/Object;
.source "CachePackIndex.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CachePackIndex$Entry;
    }
.end annotation


# static fields
.field private static final MAGIC:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    const/16 v0, 0x8

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Le/e/a/CachePackIndex;->MAGIC:[B

    return-void

    :array_a
    .array-data 1
        0x4et
        0x49t
        0x43t
        0x4ft
        0x49t
        0x44t
        0x50t
        0x31t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static finish(Ljava/io/OutputStream;Ljava/util/List;)V
    .registers 8
    .param p0, "stream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/List<",
            "Le/e/a/CachePackIndex$Entry;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    .local p1, "entries":Ljava/util/List;, "Ljava/util/List<Le/e/a/CachePackIndex$Entry;>;"
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .local v0, "buffer":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .local v1, "index":Ljava/io/DataOutputStream;
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_36

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/CachePackIndex$Entry;

    .local v3, "e":Le/e/a/CachePackIndex$Entry;
    iget-object v4, v3, Le/e/a/CachePackIndex$Entry;->name:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    iget-wide v4, v3, Le/e/a/CachePackIndex$Entry;->offset:J

    invoke-virtual {v1, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-wide v4, v3, Le/e/a/CachePackIndex$Entry;->size:J

    invoke-virtual {v1, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    iget-wide v4, v3, Le/e/a/CachePackIndex$Entry;->time:J

    invoke-virtual {v1, v4, v5}, Ljava/io/DataOutputStream;->writeLong(J)V

    .end local v3    # "e":Le/e/a/CachePackIndex$Entry;
    goto :goto_15

    :cond_36
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .local v2, "bytes":[B
    array-length v3, v2

    const/high16 v4, 0x200000

    if-gt v3, v4, :cond_57

    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, p0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .local v3, "out":Ljava/io/DataOutputStream;
    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->write([B)V

    sget-object v4, Le/e/a/CachePackIndex;->MAGIC:[B

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->write([B)V

    array-length v4, v2

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v3}, Ljava/io/DataOutputStream;->flush()V

    .line 9
    return-void

    .line 8
    .end local v3    # "out":Ljava/io/DataOutputStream;
    :cond_57
    new-instance v3, Ljava/io/IOException;

    const-string v4, "Cache index too large"

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private static full(Ljava/nio/channels/FileChannel;Ljava/nio/ByteBuffer;)V
    .registers 3
    .param p0, "c"    # Ljava/nio/channels/FileChannel;
    .param p1, "b"    # Ljava/nio/ByteBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    nop

    :goto_1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p0, p1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    if-ltz v0, :cond_e

    goto :goto_1

    :cond_e
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_14
    return-void
.end method

.method public static read(Ljava/nio/channels/FileChannel;)Ljava/util/Map;
    .registers 26
    .param p0, "c"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/channels/FileChannel;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/CachePackIndex$Entry;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    move-object/from16 v0, p0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v1

    .local v1, "size":J
    const-wide/16 v3, 0xc

    cmp-long v5, v1, v3

    if-ltz v5, :cond_f3

    const/16 v5, 0xc

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .local v5, "footer":Ljava/nio/ByteBuffer;
    sub-long v6, v1, v3

    invoke-virtual {v0, v6, v7}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    invoke-static {v0, v5}, Le/e/a/CachePackIndex;->full(Ljava/nio/channels/FileChannel;Ljava/nio/ByteBuffer;)V

    const/16 v6, 0x8

    new-array v6, v6, [B

    .local v6, "magic":[B
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v7

    .local v7, "length":I
    sget-object v8, Le/e/a/CachePackIndex;->MAGIC:[B

    invoke-static {v6, v8}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v8

    if-eqz v8, :cond_eb

    const/4 v8, 0x4

    if-lt v7, v8, :cond_eb

    const/high16 v8, 0x200000

    if-gt v7, v8, :cond_eb

    int-to-long v8, v7

    sub-long v10, v1, v3

    cmp-long v12, v8, v10

    if-gtz v12, :cond_eb

    sub-long v3, v1, v3

    int-to-long v8, v7

    sub-long/2addr v3, v8

    .local v3, "end":J
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v8

    .local v8, "bytes":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v3, v4}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    invoke-static {v0, v8}, Le/e/a/CachePackIndex;->full(Ljava/nio/channels/FileChannel;Ljava/nio/ByteBuffer;)V

    new-instance v9, Ljava/io/DataInputStream;

    new-instance v10, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v9, v10}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .local v9, "in":Ljava/io/DataInputStream;
    invoke-virtual {v9}, Ljava/io/DataInputStream;->readInt()I

    move-result v10

    .local v10, "count":I
    if-ltz v10, :cond_e3

    const/16 v11, 0x2710

    if-gt v10, v11, :cond_e3

    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11}, Ljava/util/LinkedHashMap;-><init>()V

    .local v11, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Le/e/a/CachePackIndex$Entry;>;"
    const-wide/16 v12, 0x0

    .local v12, "previous":J
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_6c
    if-ge v14, v10, :cond_d4

    invoke-virtual {v9}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v15

    .local v15, "name":Ljava/lang/String;
    invoke-virtual {v9}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v17

    .local v17, "start":J
    invoke-virtual {v9}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v19

    .local v19, "n":J
    invoke-virtual {v9}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v21

    .local v21, "time":J
    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_c9

    const-string v0, "/"

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c9

    const-string v0, "\\"

    invoke-virtual {v15, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_c9

    const-string v0, ".."

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c9

    cmp-long v0, v17, v12

    if-ltz v0, :cond_c9

    const-wide/16 v23, 0x0

    cmp-long v0, v19, v23

    if-ltz v0, :cond_c9

    cmp-long v0, v17, v3

    if-gtz v0, :cond_c9

    sub-long v23, v3, v17

    cmp-long v0, v19, v23

    if-gtz v0, :cond_c9

    invoke-interface {v11, v15}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c9

    move-object/from16 v16, v15

    .end local v15    # "name":Ljava/lang/String;
    .local v16, "name":Ljava/lang/String;
    new-instance v15, Le/e/a/CachePackIndex$Entry;

    invoke-direct/range {v15 .. v22}, Le/e/a/CachePackIndex$Entry;-><init>(Ljava/lang/String;JJJ)V

    move-object/from16 v0, v16

    .end local v16    # "name":Ljava/lang/String;
    .local v0, "name":Ljava/lang/String;
    invoke-interface {v11, v0, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-long v12, v17, v19

    .end local v0    # "name":Ljava/lang/String;
    .end local v17    # "start":J
    .end local v19    # "n":J
    .end local v21    # "time":J
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    goto :goto_6c

    .restart local v15    # "name":Ljava/lang/String;
    .restart local v17    # "start":J
    .restart local v19    # "n":J
    .restart local v21    # "time":J
    :cond_c9
    move-object v0, v15

    .end local v15    # "name":Ljava/lang/String;
    .restart local v0    # "name":Ljava/lang/String;
    new-instance v15, Ljava/io/IOException;

    move-object/from16 v16, v0

    .end local v0    # "name":Ljava/lang/String;
    .restart local v16    # "name":Ljava/lang/String;
    const-string v0, "Invalid cache entry"

    invoke-direct {v15, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v15

    .end local v14    # "i":I
    .end local v16    # "name":Ljava/lang/String;
    .end local v17    # "start":J
    .end local v19    # "n":J
    .end local v21    # "time":J
    :cond_d4
    invoke-virtual {v9}, Ljava/io/DataInputStream;->available()I

    move-result v0

    if-nez v0, :cond_db

    return-object v11

    :cond_db
    new-instance v0, Ljava/io/IOException;

    const-string v14, "Trailing cache index data"

    invoke-direct {v0, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .end local v11    # "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Le/e/a/CachePackIndex$Entry;>;"
    .end local v12    # "previous":J
    :cond_e3
    new-instance v0, Ljava/io/IOException;

    const-string v11, "Invalid entry count"

    invoke-direct {v0, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .end local v3    # "end":J
    .end local v8    # "bytes":Ljava/nio/ByteBuffer;
    .end local v9    # "in":Ljava/io/DataInputStream;
    .end local v10    # "count":I
    :cond_eb
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Invalid cache index"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .end local v5    # "footer":Ljava/nio/ByteBuffer;
    .end local v6    # "magic":[B
    .end local v7    # "length":I
    :cond_f3
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Incomplete cache container"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
