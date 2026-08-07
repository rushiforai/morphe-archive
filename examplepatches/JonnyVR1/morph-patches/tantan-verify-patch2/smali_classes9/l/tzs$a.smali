.class public Ll/tzs$a;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/tzs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/tzs;


# direct methods
.method public constructor <init>(Ll/tzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tzs$a;->a:Ll/tzs;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/tzs$a;->a:Ll/tzs;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tzs;->a(Ll/tzs;)Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/tzs$a;->a:Ll/tzs;

    .line 10
    .line 11
    invoke-static {p0}, Ll/tzs;->a(Ll/tzs;)Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/window/inApp/LiveInAppFloatView;->h()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method
