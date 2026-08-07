.class public Ll/sjk$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/sjk;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:F

.field public final synthetic b:Ll/sjk;


# direct methods
.method public constructor <init>(Ll/sjk;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sjk$b;->b:Ll/sjk;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Ll/sjk$b;->b:Ll/sjk;

    .line 2
    .line 3
    invoke-static {p1}, Ll/sjk;->n(Ll/sjk;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Ll/sjk$b;->a:F

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const/4 v0, 0x2

    .line 27
    if-ne p1, v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget p2, p0, Ll/sjk$b;->a:F

    .line 34
    .line 35
    sub-float/2addr p1, p2

    .line 36
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object p2, p0, Ll/sjk$b;->b:Ll/sjk;

    .line 41
    .line 42
    invoke-static {p2}, Ll/sjk;->m(Ll/sjk;)Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-static {p2}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledEdgeSlop()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    int-to-float p2, p2

    .line 55
    cmpl-float p1, p1, p2

    .line 56
    .line 57
    if-ltz p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Ll/sjk$b;->b:Ll/sjk;

    .line 60
    .line 61
    invoke-static {p1}, Ll/sjk;->m(Ll/sjk;)Lcom/p1/mobile/putong/core/ui/messages/group/GroupProfileAct;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object p0, p0, Ll/sjk$b;->b:Ll/sjk;

    .line 66
    .line 67
    invoke-static {p0}, Ll/sjk;->l(Ll/sjk;)Lv/VEditText;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 77
    return p0
.end method
