.class public final Lcom/immomo/svgaplayer/bean/InsertImgBean;
.super Lcom/immomo/svgaplayer/bean/BaseInsertBean;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0018\u00002\u00020\u0001B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B+\u0008\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nB3\u0008\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\u000c\u00a2\u0006\u0002\u0010\rR\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u0013X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u001a\u0010\u0005\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001bR\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u001a\u0010\u0008\u001a\u00020\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001f\u0010 \"\u0004\u0008!\u0010\"\u00a8\u0006#"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/bean/InsertImgBean;",
        "Lcom/immomo/svgaplayer/bean/BaseInsertBean;",
        "()V",
        "key",
        "",
        "imgUrl",
        "isCircle",
        "",
        "radius",
        "",
        "(Ljava/lang/String;Ljava/lang/String;ZI)V",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;)V",
        "getBitmap",
        "()Landroid/graphics/Bitmap;",
        "setBitmap",
        "(Landroid/graphics/Bitmap;)V",
        "corner",
        "Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;",
        "getCorner",
        "()Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;",
        "setCorner",
        "(Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;)V",
        "getImgUrl",
        "()Ljava/lang/String;",
        "setImgUrl",
        "(Ljava/lang/String;)V",
        "()Z",
        "setCircle",
        "(Z)V",
        "getRadius",
        "()I",
        "setRadius",
        "(I)V",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private imgUrl:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private isCircle:Z

.field private radius:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;-><init>()V

    .line 37
    const-string v0, ""

    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 38
    sget-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 48
    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 33
    const/16 v6, 0xc

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v7}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 34
    const/16 v5, 0x8

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZI)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    invoke-direct {p0}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;-><init>()V

    .line 41
    const-string v0, ""

    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 42
    sget-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 43
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setKey(Ljava/lang/String;)V

    .line 44
    iput-object p2, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 45
    iput-boolean p3, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 46
    iput p4, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->radius:I

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p3, v0

    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    move p4, v0

    .line 39
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/immomo/svgaplayer/bean/BaseInsertBean;->setKey(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object p2, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 25
    .line 26
    iput-boolean p3, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 27
    .line 28
    iput p4, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->radius:I

    .line 29
    .line 30
    iput-object p5, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->bitmap:Landroid/graphics/Bitmap;

    .line 31
    .line 32
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    and-int/lit8 p7, p6, 0x4

    const/4 v0, 0x0

    if-eqz p7, :cond_0

    move p3, v0

    :cond_0
    and-int/lit8 p6, p6, 0x8

    if-eqz p6, :cond_1

    move p4, v0

    .line 47
    :cond_1
    invoke-direct/range {p0 .. p5}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLandroid/graphics/Bitmap;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 35
    const/16 v6, 0x8

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v7}, Lcom/immomo/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZILandroid/graphics/Bitmap;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public final getBitmap()Landroid/graphics/Bitmap;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCorner()Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getImgUrl()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->radius:I

    .line 2
    .line 3
    return p0
.end method

.method public final isCircle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 2
    .line 3
    return p0
.end method

.method public final setBitmap(Landroid/graphics/Bitmap;)V
    .locals 0
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->bitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public final setCircle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setCorner(Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;)V
    .locals 0
    .param p1    # Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->corner:Lcom/immomo/svgaplayer/corner/BitmapFillet$Corner;

    .line 5
    .line 6
    return-void
.end method

.method public final setImgUrl(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/bean/InsertImgBean;->radius:I

    .line 2
    .line 3
    return-void
.end method
