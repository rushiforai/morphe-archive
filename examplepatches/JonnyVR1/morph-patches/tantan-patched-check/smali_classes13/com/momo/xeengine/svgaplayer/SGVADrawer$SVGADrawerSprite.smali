.class public final Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/svgaplayer/SGVADrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "SVGADrawerSprite"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0017\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;",
        "",
        "imageKey",
        "",
        "frameEntity",
        "Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;",
        "(Lcom/momo/xeengine/svgaplayer/SGVADrawer;Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;)V",
        "getFrameEntity",
        "()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;",
        "getImageKey",
        "()Ljava/lang/String;",
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
.field private final frameEntity:Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final imageKey:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field final synthetic this$0:Lcom/momo/xeengine/svgaplayer/SGVADrawer;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/svgaplayer/SGVADrawer;Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/svgaplayer/SGVADrawer;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->this$0:Lcom/momo/xeengine/svgaplayer/SGVADrawer;

    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->imageKey:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->frameEntity:Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getFrameEntity()Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->frameEntity:Lcom/momo/xeengine/svgaplayer/SVGAVideoSpriteFrameEntity;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getImageKey()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/svgaplayer/SGVADrawer$SVGADrawerSprite;->imageKey:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
