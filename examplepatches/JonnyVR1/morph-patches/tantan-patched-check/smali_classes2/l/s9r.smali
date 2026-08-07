.class public final Ll/s9r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u3d0;
.implements Ll/fum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/u3d0<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;",
        "Ll/fum;"
    }
.end annotation


# instance fields
.field private final a:Landroid/content/res/Resources;

.field private final b:Ll/u3d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/u3d0<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/res/Resources;Ll/u3d0;)V
    .locals 0
    .param p1    # Landroid/content/res/Resources;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/u3d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ll/u3d0<",
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
    check-cast p1, Landroid/content/res/Resources;

    .line 9
    .line 10
    iput-object p1, p0, Ll/s9r;->a:Landroid/content/res/Resources;

    .line 11
    .line 12
    invoke-static {p2}, Ll/vn80;->d(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Ll/u3d0;

    .line 17
    .line 18
    iput-object p1, p0, Ll/s9r;->b:Ll/u3d0;

    .line 19
    .line 20
    return-void
.end method

.method public static b(Landroid/content/res/Resources;Ll/u3d0;)Ll/u3d0;
    .locals 1
    .param p0    # Landroid/content/res/Resources;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ll/u3d0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/res/Resources;",
            "Ll/u3d0<",
            "Landroid/graphics/Bitmap;",
            ">;)",
            "Ll/u3d0<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ll/s9r;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/s9r;-><init>(Landroid/content/res/Resources;Ll/u3d0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method


# virtual methods
.method public a()Landroid/graphics/drawable/BitmapDrawable;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    .line 2
    .line 3
    iget-object v1, p0, Ll/s9r;->a:Landroid/content/res/Resources;

    .line 4
    .line 5
    iget-object p0, p0, Ll/s9r;->b:Ll/u3d0;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/u3d0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/graphics/Bitmap;

    .line 12
    .line 13
    invoke-direct {v0, v1, p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/s9r;->a()Landroid/graphics/drawable/BitmapDrawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getResourceClass()Ljava/lang/Class;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Landroid/graphics/drawable/BitmapDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s9r;->b:Ll/u3d0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u3d0;->getSize()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public initialize()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/s9r;->b:Ll/u3d0;

    .line 2
    .line 3
    instance-of v0, p0, Ll/fum;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Ll/fum;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/fum;->initialize()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public recycle()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s9r;->b:Ll/u3d0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u3d0;->recycle()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
