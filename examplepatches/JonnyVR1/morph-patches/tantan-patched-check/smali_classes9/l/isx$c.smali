.class public Ll/isx$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/isx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public final synthetic d:Ll/isx;


# direct methods
.method public constructor <init>(Ll/isx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isx$c;->d:Ll/isx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/isx;Ll/jsx;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/isx$c;-><init>(Ll/isx;)V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    iget-object p1, p0, Ll/isx$c;->d:Ll/isx;

    .line 2
    .line 3
    invoke-static {p1}, Ll/isx;->e(Ll/isx;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    float-to-int p1, p1

    .line 22
    iput p1, p0, Ll/isx$c;->a:I

    .line 23
    .line 24
    iput v0, p0, Ll/isx$c;->c:I

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    const/4 v1, 0x2

    .line 32
    if-ne p1, v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    float-to-int p1, p1

    .line 39
    iput p1, p0, Ll/isx$c;->b:I

    .line 40
    .line 41
    iget p2, p0, Ll/isx$c;->a:I

    .line 42
    .line 43
    sub-int p2, p1, p2

    .line 44
    .line 45
    iput p2, p0, Ll/isx$c;->c:I

    .line 46
    .line 47
    iput p1, p0, Ll/isx$c;->a:I

    .line 48
    .line 49
    iget-object p1, p0, Ll/isx$c;->d:Ll/isx;

    .line 50
    .line 51
    invoke-static {p1}, Ll/isx;->c(Ll/isx;)Landroid/view/WindowManager$LayoutParams;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget p2, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 56
    .line 57
    iget v1, p0, Ll/isx$c;->c:I

    .line 58
    .line 59
    add-int/2addr p2, v1

    .line 60
    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 61
    .line 62
    iget-object p1, p0, Ll/isx$c;->d:Ll/isx;

    .line 63
    .line 64
    invoke-static {p1}, Ll/isx;->f(Ll/isx;)Landroid/view/WindowManager;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object p2, p0, Ll/isx$c;->d:Ll/isx;

    .line 69
    .line 70
    invoke-static {p2}, Ll/isx;->e(Ll/isx;)Landroid/widget/TextView;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iget-object p0, p0, Ll/isx$c;->d:Ll/isx;

    .line 75
    .line 76
    invoke-static {p0}, Ll/isx;->c(Ll/isx;)Landroid/view/WindowManager$LayoutParams;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-interface {p1, p2, p0}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    const/4 p2, 0x1

    .line 89
    if-ne p1, p2, :cond_3

    .line 90
    .line 91
    iget-object p1, p0, Ll/isx$c;->d:Ll/isx;

    .line 92
    .line 93
    invoke-static {p1}, Ll/isx;->f(Ll/isx;)Landroid/view/WindowManager;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iget-object p2, p0, Ll/isx$c;->d:Ll/isx;

    .line 98
    .line 99
    invoke-static {p2}, Ll/isx;->e(Ll/isx;)Landroid/widget/TextView;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-object p0, p0, Ll/isx$c;->d:Ll/isx;

    .line 104
    .line 105
    invoke-static {p0}, Ll/isx;->c(Ll/isx;)Landroid/view/WindowManager$LayoutParams;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p1, p2, p0}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    :cond_3
    :goto_0
    return v0
.end method
