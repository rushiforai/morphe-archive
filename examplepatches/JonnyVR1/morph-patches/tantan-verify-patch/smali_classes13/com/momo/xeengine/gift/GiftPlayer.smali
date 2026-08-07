.class public final Lcom/momo/xeengine/gift/GiftPlayer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/IGiftPlayer;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;
    }
.end annotation


# instance fields
.field private enablePlayWhenDownloadFailed:Z

.field private engine:Lcom/momo/xeengine/IXEngine;

.field private eventListener:Lcom/momo/xeengine/gift/GiftPlayerEventListener;

.field private final gameDelegate:Lcom/momo/xeengine/gift/GameDelegate;

.field private final gameViewCallback:Lcom/momo/xeengine/game/XEGameViewCallback;

.field private giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

.field private giftView:Lcom/momo/xeengine/gift/GiftView;

.field private final handler:Landroid/os/Handler;

.field private hotfixPatch:Ljava/lang/String;

.field private isVirtualView:Z

.field private listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

.field private logEnable:Z

.field private mute:Z

.field private final params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

.field private progressListener:Lcom/momo/xeengine/gift/VideoGiftProgressListener;

.field private final resourceChecker:Lcom/momo/xeengine/gift/ResourceChecker;

.field private startTimeoutRunnable:Ljava/lang/Runnable;

.field private final svgaCallback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

.field private svgaParser:Lcom/momo/xeengine/svgaplayer/SVGAParser;

.field private timeout:F

.field private virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

.field private volume:F


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/gift/GiftView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xeengine/gift/ResourceChecker;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/xeengine/gift/ResourceChecker;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->resourceChecker:Lcom/momo/xeengine/gift/ResourceChecker;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 22
    .line 23
    sget-object v1, Lcom/momo/xeengine/gift/GiftPlayerType;->Hardware:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->mute:Z

    .line 28
    .line 29
    const/high16 v1, 0x3f800000    # 1.0f

    .line 30
    .line 31
    iput v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->volume:F

    .line 32
    .line 33
    const/high16 v1, 0x41700000    # 15.0f

    .line 34
    .line 35
    iput v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->timeout:F

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    iput-boolean v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->enablePlayWhenDownloadFailed:Z

    .line 39
    .line 40
    new-instance v1, Landroid/os/Handler;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->engine:Lcom/momo/xeengine/IXEngine;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->startTimeoutRunnable:Ljava/lang/Runnable;

    .line 51
    .line 52
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$1;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$1;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 55
    .line 56
    .line 57
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameDelegate:Lcom/momo/xeengine/gift/GameDelegate;

    .line 58
    .line 59
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$2;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$2;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 62
    .line 63
    .line 64
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameViewCallback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 65
    .line 66
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$3;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$3;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->svgaCallback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 74
    .line 75
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 76
    .line 77
    new-instance v0, Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 78
    .line 79
    invoke-direct {v0, p1}, Lcom/momo/xeengine/svgaplayer/SVGAParser;-><init>(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->svgaParser:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 83
    .line 84
    return-void
.end method

.method public constructor <init>(Lcom/momo/xeengine/gift/XEVirtualGiftView;)V
    .locals 2

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Lcom/momo/xeengine/gift/ResourceChecker;

    invoke-direct {v0}, Lcom/momo/xeengine/gift/ResourceChecker;-><init>()V

    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->resourceChecker:Lcom/momo/xeengine/gift/ResourceChecker;

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    const/4 v0, 0x0

    .line 88
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 89
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 90
    sget-object v1, Lcom/momo/xeengine/gift/GiftPlayerType;->Hardware:Lcom/momo/xeengine/gift/GiftPlayerType;

    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 91
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->mute:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 92
    iput v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->volume:F

    const/high16 v0, 0x41700000    # 15.0f

    .line 93
    iput v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->timeout:F

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->enablePlayWhenDownloadFailed:Z

    .line 95
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    const/4 v1, 0x0

    .line 96
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->engine:Lcom/momo/xeengine/IXEngine;

    .line 97
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->startTimeoutRunnable:Ljava/lang/Runnable;

    .line 98
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$1;

    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$1;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameDelegate:Lcom/momo/xeengine/gift/GameDelegate;

    .line 99
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$2;

    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$2;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameViewCallback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 100
    new-instance v1, Lcom/momo/xeengine/gift/GiftPlayer$3;

    invoke-direct {v1, p0}, Lcom/momo/xeengine/gift/GiftPlayer$3;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->svgaCallback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 101
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 102
    iput-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/util/Set;Ljava/util/Map;ZLcom/momo/xeengine/gift/GiftPlayData;Z)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->enablePlayWhenDownloadFailed:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 p1, 0x67

    .line 9
    .line 10
    const-string p2, "Resource download failed"

    .line 11
    .line 12
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayer;->callDelegatePlayFailed(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    if-eqz p5, :cond_4

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p5

    .line 30
    check-cast p5, Ljava/lang/String;

    .line 31
    .line 32
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ljava/lang/String;

    .line 51
    .line 52
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    invoke-static {p5}, Lcom/momo/xeengine/gift/GiftUtils;->getResourceNameWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Lcom/momo/xeengine/gift/GiftUtils;->fileExitsAtCacheDir(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_3

    .line 71
    .line 72
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_4
    if-eqz p3, :cond_5

    .line 79
    .line 80
    invoke-direct {p0, p4}, Lcom/momo/xeengine/gift/GiftPlayer;->playIMPL(Lcom/momo/xeengine/gift/GiftPlayData;)V

    .line 81
    .line 82
    .line 83
    :cond_5
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xeengine/gift/GiftPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$100(Lcom/momo/xeengine/gift/GiftPlayer;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/XEVirtualGiftView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1100(Lcom/momo/xeengine/gift/GiftPlayer;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayer;->callDelegatePlayFailed(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1200(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->callPlayFinished(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1302(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/IXEngine;)Lcom/momo/xeengine/IXEngine;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic access$1400(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GameDelegate;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameDelegate:Lcom/momo/xeengine/gift/GameDelegate;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1600(Lcom/momo/xeengine/gift/GiftPlayer;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->hotfixPatch:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1700(Lcom/momo/xeengine/gift/GiftPlayer;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayer;->nativeExecuteInternalVideoPlayerScript(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1900(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->cancelTimeoutRunnable()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->svgaCallback:Lcom/momo/xeengine/svgaplayer/listener/SVGACallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftPlayerEventListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->eventListener:Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/xeengine/gift/GiftPlayer;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$500(Lcom/momo/xeengine/gift/GiftPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->mute:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/momo/xeengine/gift/GiftPlayer;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->volume:F

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$700(Lcom/momo/xeengine/gift/GiftPlayer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$800(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/GiftView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/momo/xeengine/gift/GiftPlayer;)Lcom/momo/xeengine/gift/VideoGiftProgressListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->progressListener:Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerListener;Lcom/momo/xeengine/gift/GiftPlayData;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-interface {p1, p0, p2, p3, p4}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayFailed(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge;Z)V
    .locals 0

    .line 1
    if-eqz p4, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Lcom/momo/xeengine/gift/GiftUtils;->getResourceNameWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :try_start_0
    invoke-virtual {p1, p2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    invoke-static {p1, p3}, Lcom/momo/xeengine/gift/GiftPlayer;->callGameContext(Lorg/json/JSONObject;Lcom/momo/xeengine/script/ScriptBridge;)V

    .line 11
    .line 12
    .line 13
    :catch_0
    :cond_0
    return-void
.end method

.method private callDelegatePlayFailed(ILjava/lang/String;)V
    .locals 7

    .line 1
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 5
    .line 6
    if-nez v3, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/16 v0, 0x6e

    .line 10
    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0, p1, p2}, Lcom/momo/xeengine/gift/GiftLogEvent;->createPlayFailedEvent(Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Lcom/momo/xeengine/gift/GiftLogUploader;->getInstance()Lcom/momo/xeengine/gift/GiftLogUploader;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftLogUploader;->addEvent(Lcom/momo/xeengine/gift/GiftLogEvent;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {v3}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x0

    .line 34
    const-string v2, "timeout"

    .line 35
    .line 36
    const-string v4, "4"

    .line 37
    .line 38
    invoke-static {v0, v4, v1, v2}, Lcom/momo/xeengine/gift/GiftLogEvent;->createEvent(Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;ILjava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {}, Lcom/momo/xeengine/gift/GiftLogUploader;->getInstance()Lcom/momo/xeengine/gift/GiftLogUploader;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/gift/GiftLogUploader;->addEvent(Lcom/momo/xeengine/gift/GiftLogEvent;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    iget-object v2, p0, Lcom/momo/xeengine/gift/GiftPlayer;->listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 50
    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    iget-object v6, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    .line 54
    .line 55
    new-instance v0, Lcom/momo/xeengine/gift/c;

    .line 56
    .line 57
    move-object v1, p0

    .line 58
    move v4, p1

    .line 59
    move-object v5, p2

    .line 60
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/gift/c;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftPlayerListener;Lcom/momo/xeengine/gift/GiftPlayData;ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v6, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_1
    return-void
.end method

.method private static callGameContext(Lorg/json/JSONObject;Lcom/momo/xeengine/script/ScriptBridge;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "GameContext"

    .line 13
    .line 14
    const-string v1, "updateExtendValue"

    .line 15
    .line 16
    invoke-interface {p1, v0, v1, p0}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private callPlayCanceled()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v1, p0, v0}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayCanceled(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private callPlayFinished(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v1, p1}, Lcom/momo/xeengine/gift/GiftLogEvent;->createPlaySuccessEvent(Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftLogEvent;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {}, Lcom/momo/xeengine/gift/GiftLogUploader;->getInstance()Lcom/momo/xeengine/gift/GiftLogUploader;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v2, v1}, Lcom/momo/xeengine/gift/GiftLogUploader;->addEvent(Lcom/momo/xeengine/gift/GiftLogEvent;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getGiftEntity()Lcom/momo/xeengine/gift/GiftEntity;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v1, p0, v0, p1}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayFinished(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method private cancelTimeoutRunnable()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->startTimeoutRunnable:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->startTimeoutRunnable:Ljava/lang/Runnable;

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method private checkExtendResource(Ljava/util/Map;Lcom/momo/xeengine/gift/GiftPlayData;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/momo/xeengine/gift/GiftPlayData;",
            "Z)V"
        }
    .end annotation

    .line 1
    new-instance v2, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_4

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    check-cast v3, Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    if-eqz v4, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string v4, "http"

    .line 40
    .line 41
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_3

    .line 46
    .line 47
    invoke-static {v3}, Lcom/momo/xeengine/gift/GiftUtils;->getResourcePathWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    new-instance v5, Ljava/io/File;

    .line 52
    .line 53
    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    if-eqz v4, :cond_2

    .line 61
    .line 62
    iget-boolean v4, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 63
    .line 64
    if-eqz v4, :cond_1

    .line 65
    .line 66
    const-string v4, "\u68c0\u67e5\u5230\u9700\u8981\u4e0b\u8f7d\u7684\u8d44\u6e90[%s]:%s "

    .line 67
    .line 68
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    :cond_1
    iget-object v4, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 76
    .line 77
    invoke-static {v3}, Lcom/momo/xeengine/gift/GiftUtils;->getResourceNameWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-interface {v4, v1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    :goto_1
    iget-object v4, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 89
    .line 90
    new-instance v5, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v1, "_origin_url"

    .line 99
    .line 100
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_3
    iget-object v3, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 112
    .line 113
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Ljava/lang/String;

    .line 118
    .line 119
    invoke-interface {v3, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_4
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    if-eqz v0, :cond_6

    .line 128
    .line 129
    if-eqz p3, :cond_5

    .line 130
    .line 131
    invoke-direct {p0, p2}, Lcom/momo/xeengine/gift/GiftPlayer;->playIMPL(Lcom/momo/xeengine/gift/GiftPlayData;)V

    .line 132
    .line 133
    .line 134
    :cond_5
    return-void

    .line 135
    :cond_6
    iget-object v6, p0, Lcom/momo/xeengine/gift/GiftPlayer;->resourceChecker:Lcom/momo/xeengine/gift/ResourceChecker;

    .line 136
    .line 137
    new-instance v7, Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-direct {v7, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Lcom/momo/xeengine/gift/d;

    .line 143
    .line 144
    move-object v1, p0

    .line 145
    move-object v3, p1

    .line 146
    move-object v5, p2

    .line 147
    move v4, p3

    .line 148
    invoke-direct/range {v0 .. v5}, Lcom/momo/xeengine/gift/d;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;Ljava/util/Set;Ljava/util/Map;ZLcom/momo/xeengine/gift/GiftPlayData;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v6, v7, v0}, Lcom/momo/xeengine/gift/ResourceChecker;->downloadResources(Ljava/util/List;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public static synthetic d(Lcom/momo/xeengine/gift/GiftPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->onEngineStartTimeout()V

    return-void
.end method

.method private native nativeExecuteInternalVideoPlayerScript(J)V
.end method

.method private onEngineStartTimeout()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->cancelTimeoutRunnable()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->stop()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->stop()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    const/16 v0, 0x6e

    .line 24
    .line 25
    const-string v1, "\u5f15\u64ce\u542f\u52a8\u8d85\u65f6"

    .line 26
    .line 27
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->callDelegatePlayFailed(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method private playEngineGift()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    :cond_0
    new-instance v0, Ll/rwj;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/rwj;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->startTimeoutRunnable:Ljava/lang/Runnable;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->handler:Landroid/os/Handler;

    .line 18
    .line 19
    iget v2, p0, Lcom/momo/xeengine/gift/GiftPlayer;->timeout:F

    .line 20
    .line 21
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 22
    .line 23
    mul-float/2addr v2, v3

    .line 24
    float-to-long v2, v2

    .line 25
    invoke-virtual {v1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameViewCallback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->start()V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->gameViewCallback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEGameView;->setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private playIMPL(Lcom/momo/xeengine/gift/GiftPlayData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eq v0, p1, :cond_1

    .line 7
    .line 8
    :goto_0
    return-void

    .line 9
    :cond_1
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getType()Lcom/momo/xeengine/gift/GiftType;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget-object v1, Lcom/momo/xeengine/gift/GiftType;->ENGINE:Lcom/momo/xeengine/gift/GiftType;

    .line 14
    .line 15
    if-eq p1, v1, :cond_5

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getType()Lcom/momo/xeengine/gift/GiftType;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget-object v1, Lcom/momo/xeengine/gift/GiftType;->VIDEO:Lcom/momo/xeengine/gift/GiftType;

    .line 22
    .line 23
    if-ne p1, v1, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getType()Lcom/momo/xeengine/gift/GiftType;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget-object v1, Lcom/momo/xeengine/gift/GiftType;->SVGA:Lcom/momo/xeengine/gift/GiftType;

    .line 31
    .line 32
    if-ne p1, v1, :cond_4

    .line 33
    .line 34
    iget-boolean p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 35
    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    const/16 p1, 0x71

    .line 39
    .line 40
    const-string v0, "Virtual view does not support SVGA"

    .line 41
    .line 42
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/gift/GiftPlayer;->callDelegatePlayFailed(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftPlayData;->getSvgaGiftData()Lcom/momo/xeengine/gift/SVGAGiftDescriptor;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->playSVGAGift(Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :cond_4
    const/16 p1, 0x70

    .line 55
    .line 56
    const-string v0, "Invalid gift type"

    .line 57
    .line 58
    invoke-direct {p0, p1, v0}, Lcom/momo/xeengine/gift/GiftPlayer;->callDelegatePlayFailed(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_5
    :goto_1
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->playEngineGift()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method private playSVGAGift(Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor;->getSvgaInfo()Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/SVGAGiftDescriptor$SVGAInfo;->getSvgaPath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->svgaParser:Lcom/momo/xeengine/svgaplayer/SVGAParser;

    .line 10
    .line 11
    new-instance v2, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;

    .line 12
    .line 13
    invoke-direct {v2, p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer$ParseCompletion;-><init>(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/SVGAGiftDescriptor;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0, v2}, Lcom/momo/xeengine/svgaplayer/SVGAParser;->parseFile(Ljava/lang/String;Lcom/momo/xeengine/svgaplayer/SVGAParser$ParseCompletion;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public getPlayerType()Lcom/momo/xeengine/gift/GiftPlayerType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    return-object p0
.end method

.method public isEnablePlayWhenDownloadFailed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->enablePlayWhenDownloadFailed:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public play(Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 2
    .param p1    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_1
    new-instance v0, Lcom/momo/xeengine/gift/GiftPlayData;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Lcom/momo/xeengine/gift/GiftPlayData;-><init>(Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->params:Ljava/util/Map;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->getExtendValues()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftEntity;->isSyncDownloadResource()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 32
    .line 33
    invoke-direct {p0, v0, v1, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->checkExtendResource(Ljava/util/Map;Lcom/momo/xeengine/gift/GiftPlayData;Z)V

    .line 34
    .line 35
    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 39
    .line 40
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->playIMPL(Lcom/momo/xeengine/gift/GiftPlayData;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void

    .line 44
    :cond_3
    iget-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 45
    .line 46
    invoke-direct {p0, p1}, Lcom/momo/xeengine/gift/GiftPlayer;->playIMPL(Lcom/momo/xeengine/gift/GiftPlayData;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setEnablePlayWhenDownloadFailed(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->enablePlayWhenDownloadFailed:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEngineStartTimeout(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->timeout:F

    .line 2
    .line 3
    return-void
.end method

.method public setEventListener(Lcom/momo/xeengine/gift/GiftPlayerEventListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->eventListener:Lcom/momo/xeengine/gift/GiftPlayerEventListener;

    .line 2
    .line 3
    return-void
.end method

.method public setHotfixPatch(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->hotfixPatch:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setListener(Lcom/momo/xeengine/gift/GiftPlayerListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->listener:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 2
    .line 3
    return-void
.end method

.method public setLogEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->logEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMute(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->mute:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPlayerType(Lcom/momo/xeengine/gift/GiftPlayerType;)V
    .locals 0

    .line 8
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    return-void
.end method

.method public setPlayerType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/momo/xeengine/gift/GiftPlayerType;->fromString(Ljava/lang/String;)Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->playerType:Lcom/momo/xeengine/gift/GiftPlayerType;

    .line 6
    .line 7
    return-void
.end method

.method public setProgressListener(Lcom/momo/xeengine/gift/VideoGiftProgressListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->progressListener:Lcom/momo/xeengine/gift/VideoGiftProgressListener;

    .line 2
    .line 3
    return-void
.end method

.method public setVolume(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->volume:F

    .line 2
    .line 3
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->cancelTimeoutRunnable()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->isVirtualView:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->virtualGiftView:Lcom/momo/xeengine/gift/XEVirtualGiftView;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/XEVirtualGiftView;->stop()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftView:Lcom/momo/xeengine/gift/GiftView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/momo/xeengine/gift/GiftView;->stop()V

    .line 21
    .line 22
    .line 23
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/momo/xeengine/gift/GiftPlayer;->callPlayCanceled()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-object v0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->giftPlayData:Lcom/momo/xeengine/gift/GiftPlayData;

    .line 28
    .line 29
    return-void
.end method

.method public updateExtendValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/xeengine/gift/GiftPlayer;->engine:Lcom/momo/xeengine/IXEngine;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-interface {v1}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const-string v2, "http"

    .line 19
    .line 20
    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    invoke-static {p2}, Lcom/momo/xeengine/gift/GiftUtils;->getResourcePathWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/io/File;

    .line 31
    .line 32
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    :try_start_0
    invoke-static {p2}, Lcom/momo/xeengine/gift/GiftUtils;->getResourceNameWithURL(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    .line 47
    .line 48
    :catch_0
    invoke-static {v0, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->callGameContext(Lorg/json/JSONObject;Lcom/momo/xeengine/script/ScriptBridge;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    new-instance v2, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-interface {v2, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/xeengine/gift/GiftPlayer;->resourceChecker:Lcom/momo/xeengine/gift/ResourceChecker;

    .line 61
    .line 62
    new-instance v3, Ll/qwj;

    .line 63
    .line 64
    invoke-direct {v3, p2, v0, p1, v1}, Ll/qwj;-><init>(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v2, v3}, Lcom/momo/xeengine/gift/ResourceChecker;->downloadResources(Ljava/util/List;Lcom/momo/xeengine/gift/ResourceChecker$ResourceDownloadCompletion;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    :try_start_1
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->callGameContext(Lorg/json/JSONObject;Lcom/momo/xeengine/script/ScriptBridge;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    return-void

    .line 78
    :catch_1
    move-exception p0

    .line 79
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public updateExtendValues(Ljava/lang/String;Ljava/util/List;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_0

    .line 19
    .line 20
    new-instance v2, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, "_"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0, v2, v1}, Lcom/momo/xeengine/gift/GiftPlayer;->updateExtendValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method
