.class public final synthetic Lzuk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkr9;


# static fields
.field public static final a:Lzuk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lzuk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lzuk;->a:Lzuk;

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 7

    new-instance v0, Lnr9;

    const-string v4, "parseSvg(Lokio/BufferedSource;)Lcoil3/svg/Svg;"

    const/4 v5, 0x1

    const/4 v1, 0x1

    const-class v2, Lk1g;

    const-string v3, "parseSvg"

    invoke-direct/range {v0 .. v5}, Lnr9;-><init>(ILjava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0
.end method

.method public final b(Lv04;)Li16;
    .registers 5

    new-instance p0, Li16;

    invoke-interface {p1}, Lv04;->F1()Ljava/io/InputStream;

    move-result-object p1

    new-instance v0, Lsgi;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x0

    iput-object v1, v0, Lsgi;->e:Ljava/lang/Object;

    iput-object v1, v0, Lsgi;->f:Ljava/lang/Object;

    const/4 v2, 0x0

    iput-boolean v2, v0, Lsgi;->a:Z

    iput-boolean v2, v0, Lsgi;->c:Z

    iput-object v1, v0, Lsgi;->g:Ljava/lang/Object;

    iput-object v1, v0, Lsgi;->h:Ljava/lang/Object;

    iput-boolean v2, v0, Lsgi;->d:Z

    iput-object v1, v0, Lsgi;->i:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v1

    if-nez v1, :cond_29

    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    move-object p1, v1

    :cond_29
    const/4 v1, 0x3

    :try_start_2a
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->mark(I)V

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v2

    shl-int/lit8 v2, v2, 0x8

    add-int/2addr v1, v2

    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    const v2, 0x8b1f

    if-ne v1, v2, :cond_4b

    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v2, Ljava/util/zip/GZIPInputStream;

    invoke-direct {v2, p1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_4a} :catch_4b

    move-object p1, v1

    :catch_4b
    :cond_4b
    const/16 v1, 0x1000

    :try_start_4d
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->mark(I)V

    invoke-virtual {v0, p1}, Lsgi;->C(Ljava/io/InputStream;)V
    :try_end_53
    .catchall {:try_start_4d .. :try_end_53} :catchall_5f

    :try_start_53
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_56
    .catch Ljava/io/IOException; {:try_start_53 .. :try_end_56} :catch_56

    :catch_56
    iget-object p1, v0, Lsgi;->e:Ljava/lang/Object;

    check-cast p1, Lp8f;

    const/4 v0, 0x4

    invoke-direct {p0, p1, v0}, Li16;-><init>(Ljava/lang/Object;B)V

    return-object p0

    :catchall_5f
    move-exception p0

    :try_start_60
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_63
    .catch Ljava/io/IOException; {:try_start_60 .. :try_end_63} :catch_63

    :catch_63
    throw p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    instance-of v0, p1, Lzuk;

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_18

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_18
    return v1
.end method

.method public final hashCode()I
    .registers 1

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method
