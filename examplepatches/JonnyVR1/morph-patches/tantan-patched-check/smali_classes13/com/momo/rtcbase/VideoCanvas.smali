.class public Lcom/momo/rtcbase/VideoCanvas;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final RENDER_MODE_ADAPTIVE:I = 0x3

.field public static final RENDER_MODE_FIT:I = 0x2

.field public static final RENDER_MODE_HIDDEN:I = 0x1


# instance fields
.field public renderMode:I

.field public uid:I

.field public view:Landroid/view/SurfaceView;


# direct methods
.method public constructor <init>(Landroid/view/SurfaceView;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/momo/rtcbase/VideoCanvas;->view:Landroid/view/SurfaceView;

    const/4 p1, 0x1

    .line 13
    iput p1, p0, Lcom/momo/rtcbase/VideoCanvas;->renderMode:I

    return-void
.end method

.method public constructor <init>(Landroid/view/SurfaceView;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/rtcbase/VideoCanvas;->view:Landroid/view/SurfaceView;

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/VideoCanvas;->renderMode:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momo/rtcbase/VideoCanvas;->uid:I

    .line 9
    .line 10
    return-void
.end method
