.class public abstract Ll/e0r0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a()I
.end method

.method public abstract b(Ll/suq0;)Ll/e0r0;
.end method

.method public c([B)Ll/e0r0;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    array-length v1, p1

    .line 3
    invoke-virtual {p0, p1, v0, v1}, Ll/e0r0;->d([BII)Ll/e0r0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d([BII)Ll/e0r0;
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1, p2, p3}, Ll/suq0;->h([BII)Ll/suq0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/e0r0;->b(Ll/suq0;)Ll/e0r0;

    .line 6
    .line 7
    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p1, p2}, Ll/suq0;->j(I)V
    :try_end_0
    .catch Lcom/xiaomi/push/d; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :catch_0
    const-string p0, "Reading from a byte array threw an IOException (should never happen)."

    .line 14
    .line 15
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0

    .line 20
    :catch_1
    move-exception p0

    .line 21
    throw p0
.end method

.method public abstract e(Lcom/xiaomi/push/c;)V
.end method

.method public f([BII)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p1, p2, p3}, Lcom/xiaomi/push/c;->p([BII)Lcom/xiaomi/push/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/e0r0;->e(Lcom/xiaomi/push/c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/xiaomi/push/c;->K()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    const-string p0, "Serializing to a byte array threw an IOException (should never happen)."

    .line 13
    .line 14
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public g(Ll/suq0;I)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/suq0;->m(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public h()[B
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/e0r0;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-array v1, v0, [B

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p0, v1, v2, v0}, Ll/e0r0;->f([BII)V

    .line 9
    .line 10
    .line 11
    return-object v1
.end method

.method public abstract i()I
.end method
