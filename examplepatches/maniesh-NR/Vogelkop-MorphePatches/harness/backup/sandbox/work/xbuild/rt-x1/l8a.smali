.class public final Ll8a;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# instance fields
.field public final a:Lc5o;

.field public b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/FileInputStream;Lc5o;)V
    .registers 3

    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p2, p0, Ll8a;->a:Lc5o;

    return-void
.end method


# virtual methods
.method public final close()V
    .registers 3

    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    iget-object v0, p0, Ll8a;->a:Lc5o;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lf8a;->d:Lf8a;

    iget-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/security/MessageDigest;

    iget-object v0, v0, Lc5o;->b:Ljava/lang/Object;

    check-cast v0, Lf8a;

    iget-object v0, v0, Lf8a;->b:Lv7a;

    invoke-static {v1, v0}, Lw7d;->u(Ljava/security/MessageDigest;Lv7a;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ll8a;->b:Ljava/lang/String;

    return-void
.end method

.method public final read()I
    .registers 3

    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_13

    iget-object p0, p0, Ll8a;->a:Lc5o;

    int-to-byte v1, v0

    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Ljava/security/MessageDigest;

    invoke-virtual {p0, v1}, Ljava/security/MessageDigest;->update(B)V

    :cond_13
    return v0
.end method

.method public final read([BII)I
    .registers 5

    .line 20
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_12

    .line 21
    iget-object p0, p0, Ll8a;->a:Lc5o;

    .line 22
    iget-object p0, p0, Lc5o;->a:Ljava/lang/Object;

    check-cast p0, Ljava/security/MessageDigest;

    .line 23
    invoke-virtual {p0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    :cond_12
    return p3
.end method
