.class public Ll/ewb$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ewb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ll/ewb;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ewb;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ll/ewb;-><init>(Landroid/net/Uri;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/ewb;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/graphics/Bitmap$CompressFormat;)Ll/ewb$a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ewb;->a(Ll/ewb;Landroid/graphics/Bitmap$CompressFormat;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 9
    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-static {v1, p1}, Ll/ewb;->c(Ll/ewb;Z)V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    invoke-static {v1, p1}, Ll/ewb;->c(Ll/ewb;Z)V

    .line 19
    .line 20
    .line 21
    return-object p0
.end method

.method public c(I)Ll/ewb$a;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
            to = 0x64L
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ewb;->e(Ll/ewb;I)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public d(II)Ll/ewb$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ewb;->f(Ll/ewb;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 7
    .line 8
    invoke-static {p1, p2}, Ll/ewb;->b(Ll/ewb;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public e(Ll/qcj;)Ll/ewb$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Integer;",
            ">;)",
            "Ll/ewb$a;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ewb$a;->a:Ll/ewb;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ewb;->d(Ll/ewb;Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
