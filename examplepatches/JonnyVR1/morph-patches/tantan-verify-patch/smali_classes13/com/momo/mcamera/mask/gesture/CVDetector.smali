.class public Lcom/momo/mcamera/mask/gesture/CVDetector;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;
    }
.end annotation


# instance fields
.field protected gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 3
    .line 4
    return-void
.end method

.method public setDetectInterval(I)V
    .locals 0

    return-void
.end method

.method public setGestureDetectorListener(Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public startDetect()V
    .locals 0

    return-void
.end method

.method public stopDetect()V
    .locals 0

    return-void
.end method
