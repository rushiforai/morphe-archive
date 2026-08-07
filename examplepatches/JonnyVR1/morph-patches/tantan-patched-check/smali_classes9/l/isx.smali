.class public Ll/isx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/isx$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/hsx;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/hsx;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Landroid/view/WindowManager;

.field public d:Landroid/view/WindowManager$LayoutParams;

.field public e:Landroid/view/WindowManager$LayoutParams;

.field public f:Landroid/widget/TextView;

.field public g:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/isx;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/isx;->r()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic a(Ll/isx;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->g:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/isx;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->b:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/isx;)Landroid/view/WindowManager$LayoutParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->d:Landroid/view/WindowManager$LayoutParams;

    return-object p0
.end method

.method public static bridge synthetic d(Ll/isx;)Ll/hsx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->a:Ll/hsx;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/isx;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->f:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/isx;)Landroid/view/WindowManager;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/isx;->c:Landroid/view/WindowManager;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-interface {v0, v1}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iput-object v2, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 20
    .line 21
    invoke-interface {v1, v0}, Landroid/view/ViewManager;->removeView(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    iput-object v2, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public i(Ll/hsx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isx;->a:Ll/hsx;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/hsx;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/isx;->i(Ll/hsx;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 15
    .line 16
    iget-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 17
    .line 18
    iget-object p0, p0, Ll/isx;->e:Landroid/view/WindowManager$LayoutParams;

    .line 19
    .line 20
    invoke-interface {p1, v0, p0}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 25
    .line 26
    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/isx;->e:Landroid/view/WindowManager$LayoutParams;

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 33
    .line 34
    iget v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 35
    .line 36
    or-int/lit8 v3, v3, 0x8

    .line 37
    .line 38
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 39
    .line 40
    const/high16 v3, 0x43960000    # 300.0f

    .line 41
    .line 42
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 47
    .line 48
    iget-object v0, p0, Ll/isx;->e:Landroid/view/WindowManager$LayoutParams;

    .line 49
    .line 50
    const/4 v4, -0x3

    .line 51
    iput v4, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 52
    .line 53
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 58
    .line 59
    iget-object v0, p0, Ll/isx;->e:Landroid/view/WindowManager$LayoutParams;

    .line 60
    .line 61
    const/16 v3, 0x11

    .line 62
    .line 63
    iput v3, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 64
    .line 65
    new-instance v0, Landroid/widget/TextView;

    .line 66
    .line 67
    iget-object v3, p0, Ll/isx;->b:Lcom/p1/mobile/android/app/Act;

    .line 68
    .line 69
    invoke-direct {v0, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 70
    .line 71
    .line 72
    iput-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 73
    .line 74
    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 92
    .line 93
    const/high16 v0, 0x41600000    # 14.0f

    .line 94
    .line 95
    invoke-virtual {p1, v2, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 99
    .line 100
    const/4 v0, -0x1

    .line 101
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 105
    .line 106
    const/4 v0, 0x3

    .line 107
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setGravity(I)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 111
    .line 112
    sget v0, Ll/obc0;->c0:I

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 118
    .line 119
    sget v0, Ll/qa00;->l:I

    .line 120
    .line 121
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 122
    .line 123
    .line 124
    iget-object p1, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 125
    .line 126
    iget-object v0, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 127
    .line 128
    iget-object v1, p0, Ll/isx;->e:Landroid/view/WindowManager$LayoutParams;

    .line 129
    .line 130
    invoke-interface {p1, v0, v1}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/isx;->g:Landroid/widget/TextView;

    .line 134
    .line 135
    new-instance v0, Ll/isx$b;

    .line 136
    .line 137
    invoke-direct {v0, p0}, Ll/isx$b;-><init>(Ll/isx;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public r()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/isx;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/Window;->getWindowManager()Landroid/view/WindowManager;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 12
    .line 13
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/isx;->d:Landroid/view/WindowManager$LayoutParams;

    .line 19
    .line 20
    const/16 v1, 0x63

    .line 21
    .line 22
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 23
    .line 24
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 25
    .line 26
    or-int/lit8 v1, v1, 0x8

    .line 27
    .line 28
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 29
    .line 30
    sget v1, Ll/qa00;->B:I

    .line 31
    .line 32
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 33
    .line 34
    const/4 v2, -0x3

    .line 35
    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 36
    .line 37
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 38
    .line 39
    const v1, 0x800015

    .line 40
    .line 41
    .line 42
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 43
    .line 44
    new-instance v0, Landroid/widget/TextView;

    .line 45
    .line 46
    iget-object v1, p0, Ll/isx;->b:Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 52
    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 58
    .line 59
    const-string v1, "D"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 65
    .line 66
    const/4 v1, 0x2

    .line 67
    const/high16 v2, 0x41a00000    # 20.0f

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 73
    .line 74
    const/high16 v1, -0x10000

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 80
    .line 81
    const/16 v1, 0x11

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 87
    .line 88
    sget v1, Ll/obc0;->e0:I

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/isx;->c:Landroid/view/WindowManager;

    .line 94
    .line 95
    iget-object v1, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 96
    .line 97
    iget-object v2, p0, Ll/isx;->d:Landroid/view/WindowManager$LayoutParams;

    .line 98
    .line 99
    invoke-interface {v0, v1, v2}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 103
    .line 104
    new-instance v1, Ll/isx$c;

    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    invoke-direct {v1, p0, v2}, Ll/isx$c;-><init>(Ll/isx;Ll/jsx;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/isx;->f:Landroid/widget/TextView;

    .line 114
    .line 115
    new-instance v1, Ll/isx$a;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/isx$a;-><init>(Ll/isx;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 121
    .line 122
    .line 123
    return-void
.end method
