.class public final Llj3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:J


# instance fields
.field public final a:Ltcl;

.field public final b:Ltm5;

.field public final c:Luu1;

.field public final d:Lt9f;

.field public final e:Ljava/util/ArrayList;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x3c

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Llj3;->f:J

    return-void
.end method

.method public constructor <init>(Ltcl;Lt9f;Ltm5;Luu1;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llj3;->a:Ltcl;

    iput-object p3, p0, Llj3;->b:Ltm5;

    iput-object p4, p0, Llj3;->c:Luu1;

    invoke-virtual {p2}, Lt9f;->b()Ls9f;

    move-result-object p1

    sget-object p2, Lpn7;->b:Lon7;

    sget-object p2, Lun7;->e:Lun7;

    sget-wide p3, Llj3;->f:J

    invoke-static {p3, p4, p2}, Lpn7;->p(JLun7;)J

    move-result-wide v0

    invoke-static {p3, p4}, Lpn7;->h(J)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v0, v1, v2, v3}, Ljava/time/Duration;->ofSeconds(JJ)Ljava/time/Duration;

    move-result-object v0

    invoke-virtual {v0}, Ljava/time/Duration;->toMillis()J

    move-result-wide v0

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ls9f;->a(JLjava/util/concurrent/TimeUnit;)V

    invoke-static {p3, p4, p2}, Lpn7;->p(JLun7;)J

    move-result-wide v0

    invoke-static {p3, p4}, Lpn7;->h(J)I

    move-result p2

    int-to-long p2, p2

    invoke-static {v0, v1, p2, p3}, Ljava/time/Duration;->ofSeconds(JJ)Ljava/time/Duration;

    move-result-object p2

    invoke-virtual {p2}, Ljava/time/Duration;->toMillis()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3, v2}, Ls9f;->b(JLjava/util/concurrent/TimeUnit;)V

    new-instance p2, Lt9f;

    invoke-direct {p2, p1}, Lt9f;-><init>(Ls9f;)V

    iput-object p2, p0, Llj3;->d:Lt9f;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Llj3;->e:Ljava/util/ArrayList;

    return-void
.end method

.method public static b(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .registers 11

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    sget-object v3, Lf8a;->h:Lf8a;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iget-object v5, v3, Lf8a;->a:Ljava/lang/String;

    invoke-static {v5}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v5

    invoke-virtual {v5}, Ljava/security/MessageDigest;->reset()V

    new-instance v6, Lc5o;

    const/4 v7, 0x0

    invoke-direct {v6, v3, v5, v7}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v3, Lz34;

    invoke-direct {v3, v4, v6}, Lz34;-><init>(Ljava/io/FileOutputStream;Lc5o;)V

    :try_start_29
    sget-object v4, Lt0i;->b:Lp0i;
    :try_end_2b
    .catchall {:try_start_29 .. :try_end_2b} :catchall_5d

    :try_start_2b
    invoke-static {p0, v3}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_2e
    .catchall {:try_start_2b .. :try_end_2e} :catchall_35

    :try_start_2e
    invoke-virtual {v3}, Lz34;->close()V
    :try_end_31
    .catchall {:try_start_2e .. :try_end_31} :catchall_33

    move-object v4, v2

    goto :goto_3e

    :catchall_33
    move-exception v4

    goto :goto_3e

    :catchall_35
    move-exception v4

    :try_start_36
    invoke-virtual {v3}, Lz34;->close()V
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_3a

    goto :goto_3e

    :catchall_3a
    move-exception v5

    :try_start_3b
    invoke-static {v4, v5}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V
    :try_end_3e
    .catchall {:try_start_3b .. :try_end_3e} :catchall_4b

    :goto_3e
    if-nez v4, :cond_4a

    if-eqz p0, :cond_48

    :try_start_42
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_46

    goto :goto_48

    :catchall_46
    move-exception p0

    goto :goto_57

    :cond_48
    :goto_48
    move-object p0, v2

    goto :goto_57

    :cond_4a
    :try_start_4a
    throw v4
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_4b

    :catchall_4b
    move-exception v4

    if-eqz p0, :cond_56

    :try_start_4e
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_51
    .catchall {:try_start_4e .. :try_end_51} :catchall_52

    goto :goto_56

    :catchall_52
    move-exception p0

    :try_start_53
    invoke-static {v4, p0}, Lwf8;->a(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_56
    :goto_56
    move-object p0, v4

    :goto_57
    if-nez p0, :cond_5c

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_66

    :cond_5c
    throw p0
    :try_end_5d
    .catchall {:try_start_53 .. :try_end_5d} :catchall_5d

    :catchall_5d
    move-exception p0

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object p0, v4

    :goto_66
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-nez p0, :cond_d9

    iget-object p0, v3, Lz34;->c:Ljava/lang/Object;

    check-cast p0, Lc5o;

    iget-object v3, v3, Lz34;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_d3

    iget-object p0, p0, Lc5o;->b:Ljava/lang/Object;

    check-cast p0, Lf8a;

    iget-object p0, p0, Lf8a;->c:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc8a;

    iget-object p0, p0, Lc8a;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c2

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_93

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    :cond_93
    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-eqz p0, :cond_bc

    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0

    if-eqz p0, :cond_a0

    return-object v0

    :cond_a0
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Failed to rename "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p2, " to "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_bc
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v2

    :cond_c2
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    new-instance p2, Llv0;

    const-string v0, "SHA256 checksum mismatch: Expected "

    const-string v1, " got "

    invoke-static {v0, p1, v1, p0}, Lp3p;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_d3
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_d9
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    throw p0
.end method


# virtual methods
.method public final a(Landroid/net/Uri;Ljava/lang/String;Lwx;)V
    .registers 7

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v1, Lf9;

    const/16 v2, 0xf

    invoke-direct {v1, p0, p1, p2, v2}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lra;

    const/16 p2, 0x11

    invoke-direct {p1, v1, p2}, Lra;-><init>(Lkotlin/jvm/functions/Function1;B)V

    new-instance p2, Lpml;

    const/4 v1, 0x1

    invoke-direct {p2, p1, v1}, Lpml;-><init>(Lra;B)V

    iget-object p0, p0, Llj3;->a:Ltcl;

    move-object p1, p0

    check-cast p1, Lumi;

    invoke-virtual {p1, p2}, Lumi;->g(Ln5o;)Lnml;

    move-result-object p1

    new-instance p2, Lplk;

    new-instance v1, Leyi;

    invoke-direct {v1, v0, p1}, Leyi;-><init>(Ljava/lang/Object;Lnml;)V

    const/4 v0, 0x0

    invoke-direct {p2, p0, p1, v1, v0}, Lplk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Lt02;

    const/16 p1, 0x1d

    invoke-direct {p0, p3, p1}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p0}, Lplk;->t(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    return-void
.end method
