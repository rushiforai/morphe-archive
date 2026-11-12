.class public final La1o;
.super Ln1f;
.source "SourceFile"


# instance fields
.field public final synthetic e:Lb1o;


# direct methods
.method public constructor <init>(Lb1o;Ljg8;Ljg8;)V
    .registers 5

    sget-object v0, Lngh;->a:Lr16;

    iput-object p1, p0, La1o;->e:Lb1o;

    invoke-direct {p0, p2, p3}, Ln1f;-><init>(Ljg8;Ljg8;)V

    return-void
.end method


# virtual methods
.method public final f(Lmt5;)Ljava/lang/Object;
    .registers 10

    instance-of v0, p1, Lz0o;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lz0o;

    iget v1, v0, Lz0o;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lz0o;->v:I

    goto :goto_1a

    :cond_13
    new-instance v0, Lz0o;

    check-cast p1, Lnt5;

    invoke-direct {v0, p0, p1}, Lz0o;-><init>(La1o;Lnt5;)V

    :goto_1a
    iget-object p1, v0, Lz0o;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lz0o;->v:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_2a

    :try_start_26
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V
    :try_end_29
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_29} :catch_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_26 .. :try_end_29} :catch_91
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_29} :catch_8c

    goto :goto_95

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    :try_start_33
    iget-object p1, p0, La1o;->e:Lb1o;

    iget-object p1, p1, Lb1o;->a:Landroid/content/Context;

    const-string v2, "whoami.json"

    invoke-virtual {p1, v2}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object p1

    sget-object v2, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-direct {v5, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    new-instance p1, Ljava/io/BufferedReader;

    const/16 v2, 0x2000

    invoke-direct {p1, v5, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    iget-object v2, p0, La1o;->e:Lb1o;
    :try_end_4d
    .catch Ljava/io/FileNotFoundException; {:try_start_33 .. :try_end_4d} :catch_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_33 .. :try_end_4d} :catch_91
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_4d} :catch_8c

    :try_start_4d
    sget-object v5, Lrpb;->d:Lqpb;

    invoke-static {p1}, Ldgh;->l(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v7, Lv0o;->Companion:Lu0o;

    invoke-virtual {v7}, Lu0o;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v7

    invoke-static {v7}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v5, v6, v7}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lv0o;

    iput-object v5, v2, Lb1o;->j:Lv0o;
    :try_end_6a
    .catchall {:try_start_4d .. :try_end_6a} :catchall_85

    :try_start_6a
    invoke-interface {p1}, Ljava/io/Closeable;->close()V

    iget-object p0, p0, La1o;->e:Lb1o;

    iget-object p1, p0, Lb1o;->b:Lwjh;

    iget-object p1, p1, Lwjh;->d:Ljava/lang/Object;

    check-cast p1, Ljg8;

    new-instance v2, Lzhl;

    const/16 v5, 0x9

    invoke-direct {v2, v5, v4, p0}, Lzhl;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v3, v0, Lz0o;->v:I

    invoke-static {p1, v2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0
    :try_end_82
    .catch Ljava/io/FileNotFoundException; {:try_start_6a .. :try_end_82} :catch_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6a .. :try_end_82} :catch_91
    .catch Ljava/io/IOException; {:try_start_6a .. :try_end_82} :catch_8c

    if-ne p0, v1, :cond_95

    return-object v1

    :catchall_85
    move-exception p0

    :try_start_86
    throw p0
    :try_end_87
    .catchall {:try_start_86 .. :try_end_87} :catchall_87

    :catchall_87
    move-exception v0

    :try_start_88
    invoke-static {p1, p0}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_8c
    .catch Ljava/io/FileNotFoundException; {:try_start_88 .. :try_end_8c} :catch_95
    .catch Ljava/lang/IllegalArgumentException; {:try_start_88 .. :try_end_8c} :catch_91
    .catch Ljava/io/IOException; {:try_start_88 .. :try_end_8c} :catch_8c

    :catch_8c
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_95

    :catch_91
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    :catch_95
    :cond_95
    :goto_95
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public final i()V
    .registers 1

    sget-object p0, Lmuk;->a:Lmuk;

    return-void
.end method

.method public final n(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, La1o;->e:Lb1o;

    :try_start_4
    iget-object p0, p0, Lb1o;->a:Landroid/content/Context;

    const-string v0, "whoami.json"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object p0

    sget-object v0, Lkotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-direct {v1, p0, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    new-instance p0, Ljava/io/BufferedWriter;

    const/16 v0, 0x2000

    invoke-direct {p0, v1, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_1b} :catch_29

    :try_start_1b
    invoke-virtual {p0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_22

    :try_start_1e
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_21
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_21} :catch_29

    return-void

    :catchall_22
    move-exception p1

    :try_start_23
    throw p1
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_24

    :catchall_24
    move-exception v0

    :try_start_25
    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0
    :try_end_29
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_29} :catch_29

    :catch_29
    move-exception p0

    invoke-static {p0}, Lks3;->D(Ljava/lang/Throwable;)V

    return-void
.end method
