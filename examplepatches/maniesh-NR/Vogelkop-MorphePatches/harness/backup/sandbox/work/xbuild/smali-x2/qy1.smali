.class public final Lqy1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>(Landroid/content/ContentResolver;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqy1;->a:Landroid/content/ContentResolver;

    return-void
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/io/File;)Loy1;
    .registers 5

    invoke-static {p2}, Lz4o;->P(Ljava/io/File;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_57

    invoke-static {p1}, Ls29;->g(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_26

    new-instance p0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_17

    const-string p1, ""

    :cond_17
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p0, p2}, Ls29;->b(Ljava/io/File;Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_23

    sget-object p0, Loy1;->a:Loy1;

    return-object p0

    :cond_23
    sget-object p0, Loy1;->b:Loy1;

    return-object p0

    :cond_26
    :try_start_26
    iget-object p0, p0, Lqy1;->a:Landroid/content/ContentResolver;

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_2c} :catch_54

    if-nez p0, :cond_34

    :try_start_2e
    sget-object p1, Loy1;->b:Loy1;
    :try_end_30
    .catchall {:try_start_2e .. :try_end_30} :catchall_4d

    :try_start_30
    invoke-static {p0, v1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_33} :catch_54

    return-object p1

    :cond_34
    :try_start_34
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Laib;->E(Ljava/io/InputStream;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    sget-object p1, Loy1;->a:Loy1;
    :try_end_49
    .catchall {:try_start_34 .. :try_end_49} :catchall_4d

    :try_start_49
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_4c} :catch_54

    return-object p1

    :catchall_4d
    move-exception p1

    :try_start_4e
    throw p1
    :try_end_4f
    .catchall {:try_start_4e .. :try_end_4f} :catchall_4f

    :catchall_4f
    move-exception p2

    :try_start_50
    invoke-static {p0, p1}, Lvtp;->v(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_54} :catch_54

    :catch_54
    sget-object p0, Loy1;->b:Loy1;

    return-object p0

    :cond_57
    const-string p0, "Check failed."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1
.end method
