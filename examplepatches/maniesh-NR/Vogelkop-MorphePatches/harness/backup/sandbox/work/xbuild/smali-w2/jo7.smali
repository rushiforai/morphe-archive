.class public abstract Ljo7;
.super Lkch;
.source "SourceFile"


# instance fields
.field public final a:Lumi;

.field public final b:Lqie;


# direct methods
.method public constructor <init>(Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lqie;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lqie;-><init>(B)V

    iput-object v0, p0, Ljo7;->b:Lqie;

    iput-object p1, p0, Ljo7;->a:Lumi;

    return-void
.end method

.method public static h(Ljava/lang/String;[BIIZ)V
    .registers 9

    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".new"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1c
    .catchall {:try_start_1 .. :try_end_1c} :catchall_4f

    if-eqz p4, :cond_34

    :try_start_1e
    new-instance p4, Ljava/util/zip/GZIPInputStream;

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1, p2, p3}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {p4, v0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_28
    .catchall {:try_start_1e .. :try_end_28} :catchall_4c

    :try_start_28
    invoke-static {p4, v2}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_2f

    :try_start_2b
    invoke-static {p4}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_37

    :catchall_2f
    move-exception p0

    invoke-static {p4}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :cond_34
    invoke-virtual {v2, p1, p2, p3}, Ljava/io/FileOutputStream;->write([BII)V

    :goto_37
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0
    :try_end_40
    .catchall {:try_start_2b .. :try_end_40} :catchall_4c

    if-eqz p0, :cond_46

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :cond_46
    :try_start_46
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
    :try_end_4c
    .catchall {:try_start_46 .. :try_end_4c} :catchall_4c

    :catchall_4c
    move-exception p0

    move-object v0, v2

    goto :goto_50

    :catchall_4f
    move-exception p0

    :goto_50
    invoke-static {v0}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method


# virtual methods
.method public a(Lio7;ILnch;Ljch;)V
    .registers 5

    iget-object p1, p3, Lnch;->a:[B

    new-instance p2, Lgl6;

    const/16 p3, 0xd

    invoke-direct {p2, p0, p1, p4, p3}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Ljo7;->a:Lumi;

    invoke-interface {p1, p2}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance p2, Loml;

    invoke-direct {p2, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    iget-object p0, p0, Ljo7;->b:Lqie;

    invoke-virtual {p0, p2, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public d([B)V
    .registers 10

    iget-object v0, p0, Ljo7;->a:Lumi;

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_5
    sget-object v4, Lsnf;->a:Ljava/lang/String;

    array-length v5, p1

    if-nez v5, :cond_13

    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    goto :goto_29

    :cond_13
    new-instance v5, Ljava/io/DataInputStream;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    const/4 v7, 0x4

    invoke-direct {v6, p1, v3, v7}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-direct {v5, v6}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1e
    .catchall {:try_start_5 .. :try_end_1e} :catchall_3c

    :try_start_1e
    invoke-virtual {v5}, Ljava/io/DataInputStream;->readInt()I

    move-result v6
    :try_end_22
    .catchall {:try_start_1e .. :try_end_22} :catchall_37

    :try_start_22
    invoke-static {v5}, Lxvg;->l(Ljava/io/Closeable;)V

    const/4 v5, 0x1

    invoke-static {v4, p1, v7, v6, v5}, Ljo7;->h(Ljava/lang/String;[BIIZ)V
    :try_end_29
    .catchall {:try_start_22 .. :try_end_29} :catchall_3c

    :goto_29
    new-instance p1, Loc4;

    const/4 v3, 0x2

    invoke-direct {p1, p0, v3, v1}, Loc4;-><init>(Ljava/lang/Object;IB)V

    invoke-interface {v0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v2}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :catchall_37
    move-exception p1

    :try_start_38
    invoke-static {v5}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p1
    :try_end_3c
    .catchall {:try_start_38 .. :try_end_3c} :catchall_3c

    :catchall_3c
    move-exception p1

    new-instance v4, Loc4;

    invoke-direct {v4, p0, v3, v1}, Loc4;-><init>(Ljava/lang/Object;IB)V

    invoke-interface {v0, v4}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v2}, Lnml;->a(Ljava/lang/Object;)Loml;

    throw p1
.end method

.method public g(Ljch;Z)V
    .registers 3

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljch;->run(Ljava/lang/Object;)V

    return-void
.end method
