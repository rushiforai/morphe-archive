.class public Ll/fnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tgj0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/tgj0<",
        "Ll/bnj;",
        ">;"
    }
.end annotation


# instance fields
.field private final b:Ll/tgj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/tgj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/tgj0<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/tgj0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/fnj;->b:Ll/tgj0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Ljava/security/MessageDigest;)V
    .locals 0
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/fnj;->b:Ll/tgj0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/kzq;->a(Ljava/security/MessageDigest;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Landroid/content/Context;Ll/u3d0;II)Ll/u3d0;
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/u3d0<",
            "Ll/bnj;",
            ">;II)",
            "Ll/u3d0<",
            "Ll/bnj;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p2}, Ll/u3d0;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/bnj;

    .line 6
    .line 7
    invoke-static {p1}, Lcom/bumptech/glide/a;->c(Landroid/content/Context;)Lcom/bumptech/glide/a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Lcom/bumptech/glide/a;->f()Ll/w23;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0}, Ll/bnj;->e()Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Ll/e33;

    .line 20
    .line 21
    invoke-direct {v3, v2, v1}, Ll/e33;-><init>(Landroid/graphics/Bitmap;Ll/w23;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ll/fnj;->b:Ll/tgj0;

    .line 25
    .line 26
    invoke-interface {v1, p1, v3, p3, p4}, Ll/tgj0;->b(Landroid/content/Context;Ll/u3d0;II)Ll/u3d0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-eq v3, p1, :cond_0

    .line 31
    .line 32
    invoke-interface {v3}, Ll/u3d0;->recycle()V

    .line 33
    .line 34
    .line 35
    :cond_0
    invoke-interface {p1}, Ll/u3d0;->get()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Landroid/graphics/Bitmap;

    .line 40
    .line 41
    iget-object p0, p0, Ll/fnj;->b:Ll/tgj0;

    .line 42
    .line 43
    invoke-virtual {v0, p0, p1}, Ll/bnj;->m(Ll/tgj0;Landroid/graphics/Bitmap;)V

    .line 44
    .line 45
    .line 46
    return-object p2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Ll/fnj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/fnj;

    .line 6
    .line 7
    iget-object p0, p0, Ll/fnj;->b:Ll/tgj0;

    .line 8
    .line 9
    iget-object p1, p1, Ll/fnj;->b:Ll/tgj0;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fnj;->b:Ll/tgj0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
