.class public Ll/enj;
.super Ll/wce;
.source "SourceFile"

# interfaces
.implements Ll/fum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/wce<",
        "Ll/bnj;",
        ">;",
        "Ll/fum;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/bnj;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wce;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getResourceClass()Ljava/lang/Class;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Ll/bnj;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Ll/bnj;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    check-cast p0, Ll/bnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bnj;->i()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public initialize()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    check-cast p0, Ll/bnj;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bnj;->e()Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->prepareToDraw()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public recycle()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wce;->a:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    check-cast v0, Ll/bnj;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bnj;->stop()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/wce;->a:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    check-cast p0, Ll/bnj;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/bnj;->k()V

    .line 13
    .line 14
    .line 15
    return-void
.end method
