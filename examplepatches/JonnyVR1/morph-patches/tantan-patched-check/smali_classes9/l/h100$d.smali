.class public Ll/h100$d;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h100;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/h100;


# direct methods
.method public constructor <init>(Ll/h100;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h100$d;->a:Ll/h100;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/h100$d;->a:Ll/h100;

    .line 6
    .line 7
    iget-object v0, v0, Ll/h100;->a:Lv/VLinear;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    int-to-float v0, v0

    .line 14
    cmpl-float p1, p1, v0

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/h100$d;->a:Ll/h100;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/h100$d;->a:Ll/h100;

    .line 6
    .line 7
    iget-object v1, v1, Ll/h100;->a:Lv/VLinear;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    cmpl-float v0, v0, v1

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/h100$d;->a:Ll/h100;

    .line 20
    .line 21
    invoke-static {v0}, Ll/h100;->u(Ll/h100;)Ll/s000;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ll/d3z;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 44
    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    check-cast v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 48
    .line 49
    new-instance v2, Landroid/graphics/Rect;

    .line 50
    .line 51
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 52
    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->x:Lcom/p1/mobile/putong/core/ui/messages/emoji/VEditTextEmojiCompat;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    float-to-int v0, v0

    .line 64
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    float-to-int p1, p1

    .line 69
    invoke-virtual {v2, v0, p1}, Landroid/graphics/Rect;->contains(II)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_0

    .line 74
    .line 75
    iget-object p0, p0, Ll/h100$d;->a:Ll/h100;

    .line 76
    .line 77
    invoke-static {p0}, Ll/h100;->v(Ll/h100;)V

    .line 78
    .line 79
    .line 80
    return v1

    .line 81
    :cond_0
    iget-object p0, p0, Ll/h100$d;->a:Ll/h100;

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/h100;->F()V

    .line 84
    .line 85
    .line 86
    :cond_1
    return v1
.end method
