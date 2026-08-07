.class public Ll/tc2;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "BackupZipHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 4

    .line 1
    invoke-static {p1}, Ll/zie;->d(Ll/aje;)Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ll/zie;->c(Ll/aje;)Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/zie;->a(Ljava/io/File;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    const/16 v3, 0xb

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    const-string p1, "\u5220\u9664\u5df2\u7ecf\u5b58\u5728\u7684\u5907\u4efd\u6587\u4ef6\u5931\u8d25"

    .line 19
    .line 20
    invoke-virtual {p0, v3, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    invoke-virtual {v0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_1
    const-string p1, "\u79fb\u52a8\u5230\u5907\u4efd\u6587\u4ef6\u5931\u8d25"

    .line 33
    .line 34
    invoke-virtual {p0, v3, p1}, Ll/wr4;->h(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return v2
.end method
