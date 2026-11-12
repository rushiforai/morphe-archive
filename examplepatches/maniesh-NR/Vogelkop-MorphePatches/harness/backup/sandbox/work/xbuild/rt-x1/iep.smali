.class public final Liep;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public final synthetic u:Loio;


# direct methods
.method public synthetic constructor <init>(Loio;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Liep;->t:B

    iput-object p1, p0, Liep;->u:Loio;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Liep;->t:B

    iget-object p0, p0, Liep;->u:Loio;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Liep;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Liep;-><init>(Loio;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Liep;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Liep;-><init>(Loio;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Liep;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Liep;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Liep;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Liep;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Liep;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Liep;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Liep;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    iget-byte v0, p0, Liep;->t:B

    const/4 v1, 0x0

    iget-object p0, p0, Liep;->u:Loio;

    packed-switch v0, :pswitch_data_11e

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p0, p0, Loio;->b:Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_1b

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_20

    :cond_1b
    const-string p0, "Failed to remove target file"

    invoke-static {p0}, Ls49;->m(Ljava/lang/String;)V

    :goto_20
    return-object v1

    :pswitch_21
    const-string v0, "Unknown version "

    sget-object v2, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {}, Lpfp;->b()Z

    new-instance p1, Ljava/io/FileInputStream;

    iget-object v2, p0, Loio;->b:Ljava/io/File;

    invoke-direct {p1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_32
    new-instance v3, Ljava/util/zip/CRC32;

    invoke-direct {v3}, Ljava/util/zip/CRC32;-><init>()V

    new-instance v4, Ljava/io/DataInputStream;

    new-instance v5, Ljava/util/zip/CheckedInputStream;

    new-instance v6, Ljava/io/BufferedInputStream;

    const/16 v7, 0x2000

    invoke-direct {v6, p1, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v5, v6, v3}, Ljava/util/zip/CheckedInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Checksum;)V

    invoke-direct {v4, v5}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_48
    .catchall {:try_start_32 .. :try_end_48} :catchall_117

    :try_start_48
    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eq v5, v7, :cond_a5

    const/4 v8, 0x2

    if-ne v5, v8, :cond_8e

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readByte()B

    move-result v0

    sget-object v8, Lmgp;->d:Lh58;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lw4;

    invoke-direct {v9, v8, v6}, Lw4;-><init>(Ljava/lang/Object;B)V

    :cond_61
    invoke-virtual {v9}, Lw4;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_73

    invoke-virtual {v9}, Lw4;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Lmgp;

    iget-byte v10, v10, Lmgp;->a:B

    if-ne v10, v0, :cond_61

    move-object v1, v8

    :cond_73
    check-cast v1, Lmgp;

    if-nez v1, :cond_a7

    new-instance p0, Lg65;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bad transformer mode: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_8e
    new-instance p0, Lg65;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", current: 2"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_a5
    sget-object v1, Lmgp;->b:Lggp;

    :cond_a7
    if-eq v5, v7, :cond_aa

    move v6, v7

    :cond_aa
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v7
    :try_end_ae
    .catchall {:try_start_48 .. :try_end_ae} :catchall_110

    const-wide/16 v9, 0x4

    sub-long/2addr v7, v9

    int-to-long v5, v6

    sub-long/2addr v7, v5

    const-wide/16 v5, 0x8

    sub-long/2addr v7, v5

    :try_start_b6
    iget-object p0, p0, Loio;->f:Lb11;

    new-instance v0, Lfxo;

    invoke-direct {v0, v4, v7, v8}, Lfxo;-><init>(Ljava/io/DataInputStream;J)V

    invoke-virtual {v1, v0}, Lmgp;->d(Lfxo;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {p0, v0}, Lb11;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0
    :try_end_c5
    .catch Lo2j; {:try_start_b6 .. :try_end_c5} :catch_105
    .catch Ljava/lang/IllegalArgumentException; {:try_start_b6 .. :try_end_c5} :catch_fa
    .catchall {:try_start_b6 .. :try_end_c5} :catchall_110

    :try_start_c5
    invoke-virtual {v3}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readLong()J

    move-result-wide v2

    cmp-long v5, v2, v0

    if-nez v5, :cond_db

    invoke-virtual {v4}, Ljava/io/InputStream;->read()I
    :try_end_d4
    .catchall {:try_start_c5 .. :try_end_d4} :catchall_110

    :try_start_d4
    invoke-interface {v4}, Ljava/io/Closeable;->close()V
    :try_end_d7
    .catchall {:try_start_d4 .. :try_end_d7} :catchall_117

    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    return-object p0

    :cond_db
    :try_start_db
    new-instance p0, Lg65;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bad content cksum: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", expected: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :catch_fa
    move-exception p0

    new-instance v0, Lg65;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catch_105
    move-exception p0

    new-instance v0, Lg65;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_110
    .catchall {:try_start_db .. :try_end_110} :catchall_110

    :catchall_110
    move-exception p0

    :try_start_111
    throw p0
    :try_end_112
    .catchall {:try_start_111 .. :try_end_112} :catchall_112

    :catchall_112
    move-exception v0

    :try_start_113
    invoke-static {v4, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_117
    .catchall {:try_start_113 .. :try_end_117} :catchall_117

    :catchall_117
    move-exception p0

    :try_start_118
    throw p0
    :try_end_119
    .catchall {:try_start_118 .. :try_end_119} :catchall_119

    :catchall_119
    move-exception v0

    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :pswitch_data_11e
    .packed-switch 0x0
        :pswitch_21
    .end packed-switch
.end method
