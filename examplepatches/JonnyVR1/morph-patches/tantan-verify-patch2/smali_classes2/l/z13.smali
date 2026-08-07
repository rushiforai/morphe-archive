.class public Ll/z13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c4d0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/c4d0<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field private final a:Ll/w23;

.field private final b:Ll/c4d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/c4d0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/w23;Ll/c4d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/w23;",
            "Ll/c4d0<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z13;->a:Ll/w23;

    .line 5
    .line 6
    iput-object p2, p0, Ll/z13;->b:Ll/c4d0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/io/File;Ll/u560;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Ll/u3d0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/z13;->c(Ll/u3d0;Ljava/io/File;Ll/u560;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b(Ll/u560;)Lcom/bumptech/glide/load/EncodeStrategy;
    .locals 0
    .param p1    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z13;->b:Ll/c4d0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/c4d0;->b(Ll/u560;)Lcom/bumptech/glide/load/EncodeStrategy;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Ll/u3d0;Ljava/io/File;Ll/u560;)Z
    .locals 2
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/File;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/u560;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/u3d0<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;",
            "Ljava/io/File;",
            "Ll/u560;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/z13;->b:Ll/c4d0;

    .line 2
    .line 3
    new-instance v1, Ll/e33;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/u3d0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ll/z13;->a:Ll/w23;

    .line 16
    .line 17
    invoke-direct {v1, p1, p0}, Ll/e33;-><init>(Landroid/graphics/Bitmap;Ll/w23;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, v1, p2, p3}, Ll/v0f;->a(Ljava/lang/Object;Ljava/io/File;Ll/u560;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method
