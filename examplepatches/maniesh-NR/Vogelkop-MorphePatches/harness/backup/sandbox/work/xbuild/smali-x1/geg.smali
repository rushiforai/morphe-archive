.class public final Lgeg;
.super Lm73;
.source "SourceFile"


# virtual methods
.method public final l(I)V
    .registers 2

    iget-boolean p0, p0, Lm73;->a:Z

    if-nez p0, :cond_b

    const/4 p0, 0x2

    invoke-static {p1, p0}, Lj7c;->a(II)Z

    move-result p0

    if-nez p0, :cond_12

    :cond_b
    const/4 p0, 0x3

    invoke-static {p1, p0}, Lj7c;->a(II)Z

    move-result p0

    if-eqz p0, :cond_1d

    :cond_12
    sget-object p0, Lyne;->b:Ldeg;

    iget-object p0, p0, Ldeg;->e:Lnv6;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Lua1;

    invoke-virtual {p0}, Landroid/util/LruCache;->evictAll()V

    :cond_1d
    return-void
.end method
