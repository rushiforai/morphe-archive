.class public Ll/auj0;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "UnZipHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x3

    .line 7
    invoke-virtual {p0, v0}, Ll/wr4;->j(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/zie;->l()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/zie;->m(Ll/aje;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Ll/zie;->a(Ljava/io/File;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    const/4 v3, 0x0

    .line 14
    const/16 v4, 0x9

    .line 15
    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    const-string p1, "\u5220\u9664\u5df2\u7ecf\u5b58\u5728\u7684\u89e3\u538b\u6587\u4ef6\u5931\u8d25"

    .line 19
    .line 20
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return v3

    .line 24
    :cond_0
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1, v0}, Ll/mki;->b(Ljava/lang/String;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_2
    :goto_0
    const-string p1, "unzip failed"

    .line 52
    .line 53
    invoke-virtual {p0, v4, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return v3
.end method
