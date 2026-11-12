.class public final Lko7;
.super Lldk;
.source "SourceFile"


# instance fields
.field public final synthetic j:B

.field public final synthetic k:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lhd;Lumi;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lko7;->j:B

    .line 16
    iput-object p1, p0, Lko7;->k:Ljava/lang/Object;

    .line 17
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    return-void
.end method

.method public constructor <init>(Lno7;Lumi;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lko7;->j:B

    iput-object p1, p0, Lko7;->k:Ljava/lang/Object;

    sget-object p1, Lngh;->a:Lr16;

    const/4 p1, 0x1

    invoke-direct {p0, p2, p1}, Lldk;-><init>(Lumi;Z)V

    return-void
.end method

.method public constructor <init>(Ls28;Lumi;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lko7;->j:B

    .line 12
    iput-object p1, p0, Lko7;->k:Ljava/lang/Object;

    .line 13
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    return-void
.end method

.method public constructor <init>(Lwun;Lumi;)V
    .registers 4

    const/4 v0, 0x3

    iput-byte v0, p0, Lko7;->j:B

    .line 14
    iput-object p1, p0, Lko7;->k:Ljava/lang/Object;

    .line 15
    sget-object p1, Lngh;->a:Lr16;

    invoke-direct {p0, p2}, Lldk;-><init>(Ltcl;)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lko7;->j:B

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_148

    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Lwun;

    iget-object p0, p0, Lwun;->a:Landroid/content/Context;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :try_start_14
    new-instance v1, Ljava/io/DataInputStream;

    new-instance v4, Ljava/io/BufferedInputStream;

    const-string v5, "webpage_meta_data.dat"

    invoke-virtual {p0, v5}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object p0

    invoke-direct {v4, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v4}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_24
    .catch Ljava/io/FileNotFoundException; {:try_start_14 .. :try_end_24} :catch_45
    .catchall {:try_start_14 .. :try_end_24} :catchall_45

    :try_start_24
    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result p0

    :goto_2b
    if-ge v2, p0, :cond_40

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readUTF()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Ltun;->f(Ljava/io/DataInputStream;)Ltun;

    move-result-object v4

    new-instance v5, Llyf;

    invoke-direct {v5, v3, v4}, Llyf;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_3d
    .catch Ljava/io/FileNotFoundException; {:try_start_24 .. :try_end_3d} :catch_44
    .catchall {:try_start_24 .. :try_end_3d} :catchall_44

    add-int/lit8 v2, v2, 0x1

    goto :goto_2b

    :cond_40
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_48

    :catch_44
    :catchall_44
    move-object v3, v1

    :catch_45
    :catchall_45
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_48
    return-object v0

    :pswitch_49
    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Ls28;

    iget-object p0, p0, Ls28;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "searches"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9e

    :try_start_61
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :goto_6f
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_a0

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v3, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v1, v3, :cond_87

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_6f

    :cond_87
    new-instance p0, Lorg/json/JSONException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " is null"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_9e
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_9e} :catch_9e

    :catch_9e
    :cond_9e
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_a0
    return-object p0

    :pswitch_a1
    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    :try_start_a9
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    const-string v2, "media_play_queue.dat"

    invoke-virtual {p0, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_b9
    .catch Ljava/io/FileNotFoundException; {:try_start_a9 .. :try_end_b9} :catch_be
    .catchall {:try_start_a9 .. :try_end_b9} :catchall_be

    :try_start_b9
    invoke-static {v0}, Lpkg;->a(Ljava/io/DataInputStream;)Lpkg;

    move-result-object v3
    :try_end_bd
    .catch Ljava/io/FileNotFoundException; {:try_start_b9 .. :try_end_bd} :catch_bf
    .catchall {:try_start_b9 .. :try_end_bd} :catchall_bf

    goto :goto_bf

    :catch_be
    :catchall_be
    move-object v0, v3

    :catch_bf
    :catchall_bf
    :goto_bf
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v3

    :pswitch_c3
    :try_start_c3
    iget-object v0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast v0, Lno7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lizd;

    iget v5, v0, Lno7;->c:I

    iget-object v0, v0, Lno7;->d:Ljava/lang/String;

    sget-object v6, Lpd6;->a:Ljava/util/concurrent/FutureTask;

    new-instance v6, Ljava/io/BufferedInputStream;

    new-instance v7, Ljava/io/FileInputStream;

    invoke-static {v5, v0}, Lpd6;->a(ILjava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_e3
    .catchall {:try_start_c3 .. :try_end_e3} :catchall_122

    :try_start_e3
    iget-object v0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast v0, Lno7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast v0, Lno7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readUnsignedByte()I

    move-result v3

    if-gtz v3, :cond_11b

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    invoke-virtual {v4}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    if-gtz v3, :cond_106

    invoke-virtual {v0}, Lno7;->h()Ljava/lang/Object;

    move-result-object v3

    goto :goto_10a

    :cond_106
    invoke-virtual {v0, v4}, Lno7;->k(Lizd;)Ljava/lang/Object;

    move-result-object v3

    :goto_10a
    iput v1, v0, Lno7;->g:I

    iput-object v3, v0, Lno7;->i:Ljava/lang/Object;
    :try_end_10e
    .catchall {:try_start_e3 .. :try_end_10e} :catchall_121

    invoke-static {v4}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_111
    iget-object v0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast v0, Lno7;

    iget-object v1, v0, Lno7;->i:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lno7;->l(Ljava/lang/Object;)V

    goto :goto_132

    :cond_11b
    :try_start_11b
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_121
    .catchall {:try_start_11b .. :try_end_121} :catchall_121

    :catchall_121
    move-object v3, v4

    :catchall_122
    :try_start_122
    iget-object v0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast v0, Lno7;

    iput v2, v0, Lno7;->g:I

    invoke-virtual {v0}, Lno7;->h()Ljava/lang/Object;

    move-result-object v1

    iput-object v1, v0, Lno7;->i:Ljava/lang/Object;
    :try_end_12e
    .catchall {:try_start_122 .. :try_end_12e} :catchall_139

    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_111

    :goto_132
    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Lno7;

    iget-object p0, p0, Lno7;->i:Ljava/lang/Object;

    return-object p0

    :catchall_139
    move-exception v0

    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Lno7;

    iget-object v1, p0, Lno7;->i:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lno7;->l(Ljava/lang/Object;)V

    throw v0

    nop

    :pswitch_data_148
    .packed-switch 0x0
        :pswitch_c3
        :pswitch_a1
        :pswitch_49
    .end packed-switch
.end method

.method public final b(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lko7;->j:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_128

    check-cast p1, [B

    if-eqz p1, :cond_52

    check-cast p0, Lwun;

    iget-object p0, p0, Lwun;->a:Landroid/content/Context;

    const-string v0, "webpage_meta_data.dat.tmp"

    :try_start_13
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    new-instance v3, Ljava/io/DataOutputStream;

    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_21
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_21} :catch_4f
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_21} :catch_42
    .catchall {:try_start_13 .. :try_end_21} :catchall_4a

    :try_start_21
    invoke-virtual {v3, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_27
    .catch Ljava/io/FileNotFoundException; {:try_start_21 .. :try_end_27} :catch_40
    .catch Ljava/io/IOException; {:try_start_21 .. :try_end_27} :catch_3e
    .catchall {:try_start_21 .. :try_end_27} :catchall_3b

    :try_start_27
    invoke-virtual {p0, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const-string v1, "webpage_meta_data.dat"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_52

    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_3a
    .catch Ljava/io/FileNotFoundException; {:try_start_27 .. :try_end_3a} :catch_4f
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_3a} :catch_42
    .catchall {:try_start_27 .. :try_end_3a} :catchall_4a

    goto :goto_52

    :catchall_3b
    move-exception p0

    move-object v2, v3

    goto :goto_4b

    :catch_3e
    move-object v2, v3

    goto :goto_42

    :catch_40
    move-object v2, v3

    goto :goto_4f

    :catch_42
    :goto_42
    :try_start_42
    invoke-virtual {p0, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_49
    .catchall {:try_start_42 .. :try_end_49} :catchall_4a

    goto :goto_4f

    :catchall_4a
    move-exception p0

    :goto_4b
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_4f
    :goto_4f
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_52
    :goto_52
    return-void

    :pswitch_53
    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_8f

    check-cast p0, Ls28;

    iget-object p0, p0, Ls28;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_82

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_6e

    :cond_82
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "searches"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_8f
    return-void

    :pswitch_90
    check-cast p1, Lpkg;

    if-eqz p1, :cond_db

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    const-string v0, "media_play_queue.dat.tmp"

    :try_start_9c
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v1

    new-instance v3, Ljava/io/DataOutputStream;

    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_aa
    .catch Ljava/io/FileNotFoundException; {:try_start_9c .. :try_end_aa} :catch_d8
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_aa} :catch_cb
    .catchall {:try_start_9c .. :try_end_aa} :catchall_d3

    :try_start_aa
    invoke-virtual {p1, v3}, Lpkg;->b(Ljava/io/DataOutputStream;)V

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_b0
    .catch Ljava/io/FileNotFoundException; {:try_start_aa .. :try_end_b0} :catch_c9
    .catch Ljava/io/IOException; {:try_start_aa .. :try_end_b0} :catch_c7
    .catchall {:try_start_aa .. :try_end_b0} :catchall_c4

    :try_start_b0
    invoke-virtual {p0, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const-string v1, "media_play_queue.dat"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_db

    invoke-virtual {p1}, Ljava/io/File;->delete()Z
    :try_end_c3
    .catch Ljava/io/FileNotFoundException; {:try_start_b0 .. :try_end_c3} :catch_d8
    .catch Ljava/io/IOException; {:try_start_b0 .. :try_end_c3} :catch_cb
    .catchall {:try_start_b0 .. :try_end_c3} :catchall_d3

    goto :goto_db

    :catchall_c4
    move-exception p0

    move-object v2, v3

    goto :goto_d4

    :catch_c7
    move-object v2, v3

    goto :goto_cb

    :catch_c9
    move-object v2, v3

    goto :goto_d8

    :catch_cb
    :goto_cb
    :try_start_cb
    invoke-virtual {p0, v0}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->delete()Z
    :try_end_d2
    .catchall {:try_start_cb .. :try_end_d2} :catchall_d3

    goto :goto_d8

    :catchall_d3
    move-exception p0

    :goto_d4
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_d8
    :goto_d8
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_db
    :goto_db
    return-void

    :pswitch_dc
    check-cast p1, [B

    check-cast p0, Lno7;

    :try_start_e0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeByte(I)V

    iget v4, p0, Lno7;->g:I

    invoke-virtual {v3, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    if-eqz p1, :cond_ff

    array-length v1, p1

    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    goto :goto_102

    :cond_ff
    invoke-virtual {v3, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    :goto_102
    invoke-virtual {p0}, Lno7;->o()V

    iget p1, p0, Lno7;->c:I

    iget-object p0, p0, Lno7;->d:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_10d
    .catchall {:try_start_e0 .. :try_end_10d} :catchall_126

    :try_start_10d
    invoke-static {p1, p0}, Lpd6;->a(ILjava/lang/String;)Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_11d
    .catchall {:try_start_10d .. :try_end_11d} :catchall_122

    :try_start_11d
    invoke-virtual {p1, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_120
    .catchall {:try_start_11d .. :try_end_120} :catchall_121

    goto :goto_123

    :catchall_121
    move-object v2, p1

    :catchall_122
    move-object p1, v2

    :goto_123
    :try_start_123
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V
    :try_end_126
    .catchall {:try_start_123 .. :try_end_126} :catchall_126

    :catchall_126
    return-void

    nop

    :pswitch_data_128
    .packed-switch 0x0
        :pswitch_dc
        :pswitch_90
        :pswitch_53
    .end packed-switch
.end method

.method public final c()I
    .registers 1

    iget-byte p0, p0, Lko7;->j:B

    const/4 p0, 0x2

    return p0
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lko7;->j:B

    const/4 v3, 0x1

    iget-object v4, v0, Lko7;->k:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_12a

    move-object v0, v1

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_32

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_15
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llyf;

    move-object v2, v4

    check-cast v2, Lwun;

    iget-object v2, v2, Lwun;->c:Ljava/util/LinkedHashMap;

    iget-object v3, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v1, v1, Llyf;->b:Ljava/lang/Object;

    check-cast v1, Ltun;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15

    :cond_32
    return-void

    :pswitch_33
    move-object v0, v1

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_53

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    move-object v2, v4

    check-cast v2, Ls28;

    iget-object v2, v2, Ls28;->e:Ljava/lang/Object;

    check-cast v2, Ll76;

    invoke-virtual {v2, v1}, Ll76;->addLast(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_53
    return-void

    :pswitch_54
    check-cast v1, Lpkg;

    check-cast v4, Lhd;

    if-eqz v1, :cond_fe

    iget-object v2, v4, Lhd;->c:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v3, v4, Lhd;->d:Ljava/lang/Object;

    check-cast v3, Lxbf;

    new-instance v9, Lpjg;

    const/4 v4, 0x2

    invoke-direct {v9, v0, v4}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v1, Lpkg;->a:Ljava/util/ArrayList;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v2

    iget-object v2, v2, Lsf7;->a:Lrf7;

    iget v4, v1, Lpkg;->b:I

    if-ltz v4, :cond_8b

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_8b

    iget v4, v1, Lpkg;->b:I

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ldgd;

    goto :goto_8c

    :cond_8b
    const/4 v4, 0x0

    :goto_8c
    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x0

    move v11, v8

    const/4 v10, 0x0

    :cond_9c
    :goto_9c
    if-ge v11, v7, :cond_e0

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Ldgd;

    iget-wide v13, v12, Ldgd;->a:J

    const-wide/16 v15, 0x0

    cmp-long v15, v13, v15

    if-eqz v15, :cond_b4

    invoke-virtual {v2, v13, v14}, Lrf7;->d(J)Lre7;

    move-result-object v13

    move-object v15, v13

    goto :goto_b5

    :cond_b4
    const/4 v15, 0x0

    :goto_b5
    iget-object v13, v12, Ldgd;->b:Ljava/lang/String;

    if-eqz v13, :cond_c0

    invoke-static {v13}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v13

    move-object/from16 v16, v13

    goto :goto_c2

    :cond_c0
    const/16 v16, 0x0

    :goto_c2
    if-nez v15, :cond_c8

    if-nez v16, :cond_c8

    const/4 v14, 0x0

    goto :goto_d7

    :cond_c8
    new-instance v14, Legd;

    iget-object v13, v12, Ldgd;->c:Ljava/lang/String;

    iget v5, v12, Ldgd;->d:I

    const/high16 v19, -0x80000000

    move/from16 v18, v5

    move-object/from16 v17, v13

    invoke-direct/range {v14 .. v19}, Legd;-><init>(Lre7;Landroid/net/Uri;Ljava/lang/String;II)V

    :goto_d7
    if-eqz v14, :cond_9c

    if-ne v12, v4, :cond_dc

    move-object v10, v14

    :cond_dc
    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_9c

    :cond_e0
    iget-object v0, v3, Lxbf;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ltjg;

    new-array v0, v8, [Legd;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Legd;

    iget-wide v7, v1, Lpkg;->c:J

    iget-object v1, v5, Ltjg;->o:Lxbf;

    if-eqz v1, :cond_10b

    new-instance v4, Lyx;

    move-object v6, v10

    const/4 v10, 0x5

    invoke-direct/range {v4 .. v10}, Lyx;-><init>(Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V

    invoke-virtual {v5, v0, v4}, Ltjg;->e([Legd;Lk37;)V

    goto :goto_10b

    :cond_fe
    iput-boolean v3, v4, Lhd;->b:Z

    iget-object v0, v4, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lwe7;

    iget-object v1, v4, Lhd;->d:Ljava/lang/Object;

    check-cast v1, Lxbf;

    invoke-virtual {v0, v1}, Lhkg;->a(Lxbf;)V

    :cond_10b
    :goto_10b
    return-void

    :pswitch_10c
    check-cast v4, Lno7;

    iput-boolean v3, v4, Lno7;->f:Z

    invoke-virtual {v4, v1}, Lno7;->m(Ljava/lang/Object;)V

    iget-object v0, v4, Lno7;->e:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_119
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_129

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmo7;

    invoke-interface {v1, v3}, Lmo7;->o(Z)V

    goto :goto_119

    :cond_129
    return-void

    :pswitch_data_12a
    .packed-switch 0x0
        :pswitch_10c
        :pswitch_54
        :pswitch_33
    .end packed-switch
.end method
