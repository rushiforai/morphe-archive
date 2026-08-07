.class public Lcom/momo/xeengine/game/XEGameView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/game/XEGameView$MyRender;,
        Lcom/momo/xeengine/game/XEGameView$SafeArea;
    }
.end annotation


# static fields
.field public static FRAME_NO_LIMIT:I = 0x0

.field public static TYPE_SURFACE_VIEW:I = 0x0

.field public static TYPE_TEXTURE_VIEW:I = 0x1


# instance fields
.field private callback:Lcom/momo/xeengine/game/XEGameViewCallback;

.field protected enableBackgroundTick:Z

.field private enableClearBackground:Z

.field private glSurfaceView:Landroid/view/SurfaceView;

.field private glTextureView:Landroid/view/TextureView;

.field private mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

.field private final mHandler:Landroid/os/Handler;

.field private final mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

.field private mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

.field private final mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

.field private final mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private paused:Z

.field private preferredFramesPerSecond:I

.field private renderScale:F

.field private renderViewType:I

.field private touchEnable:Z

.field private viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    .line 15
    .line 16
    const/16 v1, 0x1e

    .line 17
    .line 18
    iput v1, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    iput-boolean v1, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 24
    .line 25
    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    .line 27
    iput v1, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 28
    .line 29
    sget v1, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    .line 30
    .line 31
    iput v1, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 32
    .line 33
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    .line 36
    .line 37
    new-instance v0, Landroid/os/Handler;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mHandler:Landroid/os/Handler;

    .line 43
    .line 44
    new-instance v0, Lcom/momo/xeengine/game/XEGameView$1;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Lcom/momo/xeengine/game/XEGameView$1;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 50
    .line 51
    new-instance v0, Lcom/momo/xeengine/game/XEGameView$2;

    .line 52
    .line 53
    invoke-direct {v0, p0}, Lcom/momo/xeengine/game/XEGameView$2;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

    .line 57
    .line 58
    new-instance v0, Lcom/momo/xeengine/game/XEGameView$3;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Lcom/momo/xeengine/game/XEGameView$3;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 64
    .line 65
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    .line 66
    .line 67
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 68
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 69
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 70
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 71
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 72
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    const/4 p2, 0x0

    .line 73
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    const/16 v0, 0x1e

    .line 74
    iput v0, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    const/4 v0, 0x1

    .line 75
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 76
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    const/high16 v0, 0x3f800000    # 1.0f

    .line 77
    iput v0, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 78
    sget v0, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    iput v0, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 79
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 80
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    .line 81
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mHandler:Landroid/os/Handler;

    .line 82
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$1;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$1;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 83
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$2;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$2;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

    .line 84
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$3;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$3;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 85
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 86
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 87
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 88
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 89
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 90
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    const/4 p2, 0x0

    .line 91
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    const/16 p3, 0x1e

    .line 92
    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    const/4 p3, 0x1

    .line 93
    iput-boolean p3, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 94
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    const/high16 p3, 0x3f800000    # 1.0f

    .line 95
    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 96
    sget p3, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 97
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 98
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    .line 99
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mHandler:Landroid/os/Handler;

    .line 100
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$1;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$1;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 101
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$2;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$2;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

    .line 102
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$3;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$3;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 103
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 104
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p1, 0x0

    .line 105
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 106
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 107
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 108
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    const/4 p2, 0x0

    .line 109
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    const/16 p3, 0x1e

    .line 110
    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    const/4 p3, 0x1

    .line 111
    iput-boolean p3, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 112
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    const/high16 p3, 0x3f800000    # 1.0f

    .line 113
    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 114
    sget p3, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    iput p3, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 115
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 116
    iput-boolean p2, p0, Lcom/momo/xeengine/game/XEGameView;->enableBackgroundTick:Z

    .line 117
    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mHandler:Landroid/os/Handler;

    .line 118
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$1;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$1;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 119
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$2;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$2;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

    .line 120
    new-instance p2, Lcom/momo/xeengine/game/XEGameView$3;

    invoke-direct {p2, p0}, Lcom/momo/xeengine/game/XEGameView$3;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    iput-object p2, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 121
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    return-void
.end method

.method public static synthetic a(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/game/GameEngine;->setOnBackground(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->callOnResume()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xeengine/game/XEGameView;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/xeengine/game/XEGameView;->onNativeWindowCreate(Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEngineRenderThread;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/momo/xeengine/game/XEGameView;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mHandler:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xeengine/game/XEGameView;->createRenderView()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$400(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEGameViewCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$700(Lcom/momo/xeengine/game/XEGameView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lcom/momo/xeengine/game/XEGameView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$800(Lcom/momo/xeengine/game/XEGameView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$900(Lcom/momo/xeengine/game/XEGameView;)Lcom/momo/xeengine/game/XEGameView$SafeArea;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/game/GameEngine;->setOnBackground(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->callOnPause()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private createRenderView()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 2
    .line 3
    sget v1, Lcom/momo/xeengine/game/XEGameView;->TYPE_SURFACE_VIEW:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x2

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/view/SurfaceView;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-direct {v0, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 19
    .line 20
    invoke-virtual {v0, v3, v2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, -0x3

    .line 30
    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 34
    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setZOrderOnTop(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 47
    .line 48
    invoke-interface {v0, v1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onRenderViewCreate(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceHolderCallback:Landroid/view/SurfaceHolder$Callback;

    .line 58
    .line 59
    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    sget v1, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    .line 64
    .line 65
    if-ne v0, v1, :cond_1

    .line 66
    .line 67
    new-instance v0, Landroid/view/TextureView;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-direct {v0, v1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 77
    .line 78
    invoke-virtual {v0, v3, v2}, Landroid/view/TextureView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 82
    .line 83
    const/4 v1, 0x0

    .line 84
    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setOpaque(Z)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 95
    .line 96
    invoke-interface {v0, v1}, Lcom/momo/xeengine/game/XEGameViewCallback;->onRenderViewCreate(Landroid/view/View;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 100
    .line 101
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    .line 102
    .line 103
    invoke-virtual {v0, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 108
    .line 109
    const-string v0, "\u9519\u8bef\u7684\u6e32\u67d3\u89c6\u56fe\u7c7b\u578b\u8bbe\u7f6e"

    .line 110
    .line 111
    invoke-interface {p0, v0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method private getNotchParams()V
    .locals 9

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1c

    .line 4
    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto/16 :goto_7

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    goto/16 :goto_7

    .line 16
    .line 17
    :cond_1
    invoke-static {v0}, Ll/mgq0;->a(Landroid/view/WindowInsets;)Landroid/view/DisplayCutout;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    goto/16 :goto_7

    .line 24
    .line 25
    :cond_2
    invoke-static {v0}, Ll/n4z0;->a(Landroid/view/DisplayCutout;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    if-eqz v1, :cond_a

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    goto/16 :goto_7

    .line 38
    .line 39
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    instance-of v2, v1, Landroid/app/Activity;

    .line 44
    .line 45
    const/4 v3, 0x0

    .line 46
    if-eqz v2, :cond_4

    .line 47
    .line 48
    check-cast v1, Landroid/app/Activity;

    .line 49
    .line 50
    new-instance v2, Landroid/util/DisplayMetrics;

    .line 51
    .line 52
    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V

    .line 64
    .line 65
    .line 66
    iget v1, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 67
    .line 68
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    move v1, v3

    .line 72
    move v2, v1

    .line 73
    :goto_0
    if-eqz v2, :cond_a

    .line 74
    .line 75
    if-nez v1, :cond_5

    .line 76
    .line 77
    goto/16 :goto_7

    .line 78
    .line 79
    :cond_5
    const/4 v4, 0x2

    .line 80
    new-array v4, v4, [I

    .line 81
    .line 82
    invoke-virtual {p0, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 83
    .line 84
    .line 85
    aget v3, v4, v3

    .line 86
    .line 87
    const/4 v5, 0x1

    .line 88
    aget v4, v4, v5

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    add-int/2addr v5, v3

    .line 95
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v6

    .line 99
    add-int/2addr v6, v4

    .line 100
    invoke-static {v0}, Ll/ilq0;->a(Landroid/view/DisplayCutout;)I

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    const/4 v8, 0x0

    .line 105
    if-gt v7, v3, :cond_6

    .line 106
    .line 107
    move v3, v8

    .line 108
    goto :goto_1

    .line 109
    :cond_6
    invoke-static {v0}, Ll/ilq0;->a(Landroid/view/DisplayCutout;)I

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    sub-int/2addr v7, v3

    .line 114
    int-to-float v3, v7

    .line 115
    :goto_1
    invoke-static {v0}, Ll/jlq0;->a(Landroid/view/DisplayCutout;)I

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    if-gt v7, v4, :cond_7

    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_7
    invoke-static {v0}, Ll/jlq0;->a(Landroid/view/DisplayCutout;)I

    .line 123
    .line 124
    .line 125
    move-result v7

    .line 126
    sub-int/2addr v7, v4

    .line 127
    int-to-float v8, v7

    .line 128
    :goto_2
    invoke-static {v0}, Ll/klq0;->a(Landroid/view/DisplayCutout;)I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    sub-int v4, v1, v4

    .line 133
    .line 134
    if-gt v5, v4, :cond_8

    .line 135
    .line 136
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    int-to-float v1, v1

    .line 141
    :goto_3
    sub-float/2addr v1, v3

    .line 142
    goto :goto_4

    .line 143
    :cond_8
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    invoke-static {v0}, Ll/klq0;->a(Landroid/view/DisplayCutout;)I

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    sub-int/2addr v1, v7

    .line 152
    sub-int/2addr v5, v1

    .line 153
    sub-int/2addr v4, v5

    .line 154
    int-to-float v1, v4

    .line 155
    goto :goto_3

    .line 156
    :goto_4
    invoke-static {v0}, Ll/tgy0;->a(Landroid/view/DisplayCutout;)I

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    sub-int v4, v2, v4

    .line 161
    .line 162
    if-gt v6, v4, :cond_9

    .line 163
    .line 164
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    int-to-float v0, v0

    .line 169
    :goto_5
    sub-float/2addr v0, v8

    .line 170
    goto :goto_6

    .line 171
    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result v4

    .line 175
    invoke-static {v0}, Ll/tgy0;->a(Landroid/view/DisplayCutout;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    sub-int/2addr v2, v0

    .line 180
    sub-int/2addr v6, v2

    .line 181
    sub-int/2addr v4, v6

    .line 182
    int-to-float v0, v4

    .line 183
    goto :goto_5

    .line 184
    :goto_6
    new-instance v2, Lcom/momo/xeengine/game/XEGameView$SafeArea;

    .line 185
    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 187
    .line 188
    .line 189
    move-result v4

    .line 190
    int-to-float v4, v4

    .line 191
    div-float/2addr v3, v4

    .line 192
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 193
    .line 194
    .line 195
    move-result v4

    .line 196
    int-to-float v4, v4

    .line 197
    div-float/2addr v8, v4

    .line 198
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    int-to-float v4, v4

    .line 203
    div-float/2addr v1, v4

    .line 204
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    int-to-float v4, v4

    .line 209
    div-float/2addr v0, v4

    .line 210
    invoke-direct {v2, v3, v8, v1, v0}, Lcom/momo/xeengine/game/XEGameView$SafeArea;-><init>(FFFF)V

    .line 211
    .line 212
    .line 213
    monitor-enter p0

    .line 214
    :try_start_0
    iput-object v2, p0, Lcom/momo/xeengine/game/XEGameView;->viewSafeArea:Lcom/momo/xeengine/game/XEGameView$SafeArea;

    .line 215
    .line 216
    monitor-exit p0

    .line 217
    return-void

    .line 218
    :catchall_0
    move-exception v0

    .line 219
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 220
    throw v0

    .line 221
    :cond_a
    :goto_7
    return-void
.end method

.method private onNativeWindowCreate(Ljava/lang/Object;II)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Lcom/momo/xeengine/game/XEGameView$MyRender;-><init>(Lcom/momo/xeengine/game/XEGameView;Lcom/momo/xeengine/game/XEGameView$1;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 12
    .line 13
    new-instance v0, Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 16
    .line 17
    invoke-direct {v0, p1, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;-><init>(Ljava/lang/Object;Lcom/momo/xeengine/game/IXRender;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 21
    .line 22
    invoke-virtual {v0, p2, p3}, Lcom/momo/xeengine/game/XEngineRenderThread;->onSizeChanged(II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/game/XEngineRenderThread;->resetNativeWindow(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public getEngineEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return-object v0

    .line 7
    :cond_0
    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    invoke-virtual {p0}, Lcom/momo/xeengine/game/GameEngine;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public getPreferredFramesPerSecond()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    .line 2
    .line 3
    return p0
.end method

.method public getRenderScale()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 2
    .line 3
    return p0
.end method

.method public isEnableClearBackground()Z
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    .line 2
    .line 3
    return p0
.end method

.method public isPaused()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 2
    .line 3
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/momo/xeengine/game/XEGameView;->stop()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iget p3, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 12
    .line 13
    div-float/2addr p2, p3

    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    cmpl-float p1, p1, p2

    .line 19
    .line 20
    if-nez p1, :cond_2

    .line 21
    .line 22
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    cmpl-float p1, p1, p2

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    :goto_0
    return-void

    .line 34
    :cond_2
    :goto_1
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    int-to-float p3, p3

    .line 47
    iget p4, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 48
    .line 49
    mul-float/2addr p3, p4

    .line 50
    float-to-int p3, p3

    .line 51
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    int-to-float p3, p3

    .line 58
    iget p4, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 59
    .line 60
    mul-float/2addr p3, p4

    .line 61
    float-to-int p3, p3

    .line 62
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 63
    .line 64
    const/16 p3, 0x11

    .line 65
    .line 66
    iput p3, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 67
    .line 68
    iget-object p3, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 69
    .line 70
    invoke-virtual {p3, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 74
    .line 75
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 79
    .line 80
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-direct {p0}, Lcom/momo/xeengine/game/XEGameView;->getNotchParams()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    :catchall_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 13
    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    return v1

    .line 17
    :cond_2
    invoke-static {v0}, Lcom/momo/xeengine/game/XEGameView$MyRender;->access$500(Lcom/momo/xeengine/game/XEGameView$MyRender;)Lcom/momo/xeengine/game/GameEngine;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    return v1

    .line 24
    :cond_3
    invoke-virtual {v0}, Lcom/momo/xeengine/game/GameEngine;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0

    .line 35
    :cond_4
    iget p0, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 36
    .line 37
    invoke-interface {v0, p1, p0, p0}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchEvent(Landroid/view/MotionEvent;FF)V

    .line 38
    .line 39
    .line 40
    const/4 p0, 0x1

    .line 41
    return p0
.end method

.method public pause()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/mlq0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/mlq0;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/xeengine/game/XEGameView;->paused:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/llq0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/llq0;-><init>(Lcom/momo/xeengine/game/XEGameView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/game/XEngineRenderThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setCallback(Lcom/momo/xeengine/game/IXGameView$Callback;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 10
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 11
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    :cond_0
    return-void
.end method

.method public setCallback(Lcom/momo/xeengine/game/XEGameViewCallback;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setEnableClearBackground(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->enableClearBackground:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPreferredFramesPerSecond(I)V
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/xeengine/game/XEGameView;->preferredFramesPerSecond:I

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string p0, "preferredFramesPerSecond must >= 0"

    .line 7
    .line 8
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setRenderScale(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_1

    .line 5
    .line 6
    iput p1, p0, Lcom/momo/xeengine/game/XEGameView;->renderScale:F

    .line 7
    .line 8
    iget-object p1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :cond_1
    const-string p0, "renderScale must >= 0"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public setRenderViewType(I)V
    .locals 1

    .line 1
    sget v0, Lcom/momo/xeengine/game/XEGameView;->TYPE_SURFACE_VIEW:I

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    sget v0, Lcom/momo/xeengine/game/XEGameView;->TYPE_TEXTURE_VIEW:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "RenderViewType only support TYPE_SURFACE_VIEW or TYPE_TEXTURE_VIEW"

    .line 11
    .line 12
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 17
    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput p1, p0, Lcom/momo/xeengine/game/XEGameView;->renderViewType:I

    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    const-string p0, "RenderViewType can set before start only"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setTouchEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/game/XEGameView;->touchEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->callback:Lcom/momo/xeengine/game/XEGameViewCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 10
    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/momo/xeengine/somanager/XEngineSOManager;->check(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/momo/xeengine/game/XEGameView;->mLoaderCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 22
    .line 23
    invoke-interface {p0}, Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;->onSuccess()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void

    .line 27
    :cond_1
    const-string p0, "\u6e38\u620f\u6b63\u5728\u8fd0\u884c \u65e0\u6cd5\u518d\u6b21\u542f\u52a8"

    .line 28
    .line 29
    invoke-interface {v0, p0}, Lcom/momo/xeengine/game/XEGameViewCallback;->onStartFailed(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_2
    const-string p0, "\u672a\u8bbe\u7f6e\u56de\u8c03\uff0c\u6e38\u620f\u542f\u52a8\u5931\u8d25"

    .line 34
    .line 35
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public stop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/xeengine/game/XEngineRenderThread;->requestStop()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->mGLThread:Lcom/momo/xeengine/game/XEngineRenderThread;

    .line 10
    .line 11
    :cond_0
    iput-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->mRender:Lcom/momo/xeengine/game/XEGameView$MyRender;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glTextureView:Landroid/view/TextureView;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/momo/xeengine/game/XEGameView;->glSurfaceView:Landroid/view/SurfaceView;

    .line 30
    .line 31
    :cond_2
    return-void
.end method
