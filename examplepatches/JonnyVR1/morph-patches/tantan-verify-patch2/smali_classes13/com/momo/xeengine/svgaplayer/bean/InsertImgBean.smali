.class public final Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;
.super Lcom/momo/xeengine/svgaplayer/bean/BaseInsertBean;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0018\u00002\u00020\u0001B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B+\u0008\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nR\u001a\u0010\u000b\u001a\u00020\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010R\u001a\u0010\u0005\u001a\u00020\u0004X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u001a\u0010\u0008\u001a\u00020\tX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019\"\u0004\u0008\u001a\u0010\u001b\u00a8\u0006\u001c"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;",
        "Lcom/momo/xeengine/svgaplayer/bean/BaseInsertBean;",
        "()V",
        "key",
        "",
        "imgUrl",
        "isCircle",
        "",
        "radius",
        "",
        "(Ljava/lang/String;Ljava/lang/String;ZI)V",
        "corner",
        "Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;",
        "getCorner",
        "()Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;",
        "setCorner",
        "(Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;)V",
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
        "gift_player_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xf
    }
.end annotation


# instance fields
.field private corner:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;
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

    .line 29
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/bean/BaseInsertBean;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 31
    sget-object v0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->corner:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

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

    .line 33
    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

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

    .line 28
    const/16 v5, 0x8

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V

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

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/momo/xeengine/svgaplayer/bean/BaseInsertBean;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v0, Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;->CORNER_NONE:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->corner:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/momo/xeengine/svgaplayer/bean/BaseInsertBean;->setKey(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 22
    .line 23
    iput-boolean p3, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 24
    .line 25
    iput p4, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->radius:I

    .line 26
    .line 27
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;ZIILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    and-int/lit8 p6, p5, 0x4

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p3, v0

    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    move p4, v0

    .line 32
    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;-><init>(Ljava/lang/String;Ljava/lang/String;ZI)V

    return-void
.end method


# virtual methods
.method public final getCorner()Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->corner:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getImgUrl()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->radius:I

    .line 2
    .line 3
    return p0
.end method

.method public final isCircle()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 2
    .line 3
    return p0
.end method

.method public final setCircle(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->isCircle:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setCorner(Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->corner:Lcom/momo/xeengine/svgaplayer/corner/BitmapFillet$Corner;

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
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->imgUrl:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/svgaplayer/bean/InsertImgBean;->radius:I

    .line 2
    .line 3
    return-void
.end method
