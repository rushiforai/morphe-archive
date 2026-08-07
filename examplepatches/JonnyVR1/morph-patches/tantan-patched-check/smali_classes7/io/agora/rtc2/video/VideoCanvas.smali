.class public Lio/agora/rtc2/video/VideoCanvas;
.super Ljava/lang/Object;


# static fields
.field public static final RENDER_MODE_ADAPTIVE:I = 0x3

.field public static final RENDER_MODE_FIT:I = 0x2

.field public static final RENDER_MODE_HIDDEN:I = 0x1

.field public static final VIEW_SETUP_MODE_ADD:I = 0x1

.field public static final VIEW_SETUP_MODE_REMOVE:I = 0x2

.field public static final VIEW_SETUP_MODE_REPLACE:I


# instance fields
.field public backgroundColor:I

.field public enableAlphaMask:Z

.field public mediaPlayerId:I

.field public mirrorMode:I

.field public position:Lio/agora/rtc2/Constants$VideoModulePosition;

.field public rect:Landroid/graphics/Rect;

.field public renderMode:I

.field public setupMode:I

.field public sourceType:I

.field public subviewUid:I

.field public surfaceTexture:Landroid/graphics/SurfaceTexture;

.field public uid:I

.field public view:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->setupMode:I

    sget-object v1, Lio/agora/rtc2/Constants$VideoModulePosition;->VIDEO_MODULE_POSITION_POST_CAPTURER:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput-object v1, p0, Lio/agora/rtc2/video/VideoCanvas;->position:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->uid:I

    iput-object p1, p0, Lio/agora/rtc2/video/VideoCanvas;->view:Landroid/view/View;

    const/4 p1, 0x1

    iput p1, p0, Lio/agora/rtc2/video/VideoCanvas;->renderMode:I

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->backgroundColor:I

    return-void
.end method

.method public constructor <init>(Landroid/view/View;II)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->setupMode:I

    sget-object v1, Lio/agora/rtc2/Constants$VideoModulePosition;->VIDEO_MODULE_POSITION_POST_CAPTURER:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput-object v1, p0, Lio/agora/rtc2/video/VideoCanvas;->position:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput p3, p0, Lio/agora/rtc2/video/VideoCanvas;->uid:I

    iput-object p1, p0, Lio/agora/rtc2/video/VideoCanvas;->view:Landroid/view/View;

    iput p2, p0, Lio/agora/rtc2/video/VideoCanvas;->renderMode:I

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->backgroundColor:I

    return-void
.end method

.method public constructor <init>(Landroid/view/View;III)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->setupMode:I

    sget-object v1, Lio/agora/rtc2/Constants$VideoModulePosition;->VIDEO_MODULE_POSITION_POST_CAPTURER:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput-object v1, p0, Lio/agora/rtc2/video/VideoCanvas;->position:Lio/agora/rtc2/Constants$VideoModulePosition;

    iput p3, p0, Lio/agora/rtc2/video/VideoCanvas;->uid:I

    iput p4, p0, Lio/agora/rtc2/video/VideoCanvas;->subviewUid:I

    iput-object p1, p0, Lio/agora/rtc2/video/VideoCanvas;->view:Landroid/view/View;

    iput p2, p0, Lio/agora/rtc2/video/VideoCanvas;->renderMode:I

    iput v0, p0, Lio/agora/rtc2/video/VideoCanvas;->backgroundColor:I

    return-void
.end method
