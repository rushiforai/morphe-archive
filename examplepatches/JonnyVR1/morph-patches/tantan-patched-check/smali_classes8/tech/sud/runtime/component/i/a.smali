.class Ltech/sud/runtime/component/i/a;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field a:Landroid/widget/Button;

.field b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ltech/sud/runtime/component/i/c;",
            ">;"
        }
    .end annotation
.end field

.field private c:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltech/sud/runtime/component/i/c;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ltech/sud/runtime/component/i/a$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ltech/sud/runtime/component/i/a$1;-><init>(Ltech/sud/runtime/component/i/a;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ltech/sud/runtime/component/i/a;->c:Landroid/view/View$OnClickListener;

    .line 10
    .line 11
    const/high16 v0, -0x1000000

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Landroid/widget/Button;

    .line 17
    .line 18
    invoke-direct {v1, p1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 27
    .line 28
    const-string v0, "exit"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 34
    .line 35
    const/high16 v0, 0x41c00000    # 24.0f

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 41
    .line 42
    const v0, -0xbbbbbc

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    .line 51
    .line 52
    .line 53
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 54
    .line 55
    const/4 v0, -0x2

    .line 56
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 57
    .line 58
    .line 59
    const/4 v0, 0x5

    .line 60
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    const/16 v1, 0x14

    .line 64
    .line 65
    invoke-virtual {p1, v0, v1, v1, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 69
    .line 70
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 74
    .line 75
    iget-object v0, p0, Ltech/sud/runtime/component/i/a;->c:Landroid/view/View$OnClickListener;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ltech/sud/runtime/component/i/a;->a:Landroid/widget/Button;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 89
    .line 90
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Ltech/sud/runtime/component/i/a;->b:Ljava/lang/ref/WeakReference;

    .line 94
    .line 95
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 21
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public a(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 4
    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v0, -0x2

    .line 13
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
