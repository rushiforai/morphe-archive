.class public Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/view/ViewGroup;",
        "Landroid/view/View$OnTouchListener;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public a:I

.field public b:Ljava/util/Timer;

.field public c:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public d:I

.field public e:I

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public b(IIILjava/util/List;Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/List<",
            "TT;>;",
            "Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 4
    .line 5
    iput-object p5, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->c:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;

    .line 6
    .line 7
    iput-boolean p6, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->f:Z

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget p2, Ll/eac0;->n:I

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 26
    .line 27
    .line 28
    invoke-interface {p4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-eqz p2, :cond_0

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->c:Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    invoke-interface {p3, p2, p4}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$b;->i(Ljava/lang/Object;Landroid/content/Context;)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->f:Z

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    sget p2, Ll/qec0;->k5:I

    .line 69
    .line 70
    const/4 p3, 0x0

    .line 71
    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Landroid/widget/ImageView;

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    sget p3, Ll/ibc0;->K7:I

    .line 86
    .line 87
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    .line 93
    .line 94
    sget-object p2, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 95
    .line 96
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 106
    .line 107
    .line 108
    :cond_1
    return-void
.end method

.method public final c()V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/Timer;

    .line 2
    .line 3
    const-string v1, "KeyboardPagerAdapterPage-Thread"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->b:Ljava/util/Timer;

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-long v2, p0

    .line 20
    const-wide/16 v4, 0x82

    .line 21
    .line 22
    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->b:Ljava/util/Timer;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->b:Ljava/util/Timer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->b:Ljava/util/Timer;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/d3z;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Landroid/view/KeyEvent;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    const/16 v1, 0x43

    .line 27
    .line 28
    invoke-direct {p1, v0, v1}, Landroid/view/KeyEvent;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->f:Z

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 16
    .line 17
    add-int/lit8 p3, p3, -0x1

    .line 18
    .line 19
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 20
    .line 21
    mul-int/2addr p3, p4

    .line 22
    sub-int/2addr p2, p3

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    sub-int/2addr p2, p3

    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    sub-int/2addr p2, p3

    .line 33
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 34
    .line 35
    div-int/2addr p2, p3

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result p3

    .line 40
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 41
    .line 42
    add-int/lit8 p4, p4, -0x1

    .line 43
    .line 44
    iget p5, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 45
    .line 46
    mul-int/2addr p4, p5

    .line 47
    sub-int/2addr p3, p4

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    sub-int/2addr p3, p4

    .line 53
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 54
    .line 55
    .line 56
    move-result p4

    .line 57
    sub-int/2addr p3, p4

    .line 58
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 59
    .line 60
    div-int/2addr p3, p4

    .line 61
    const/4 p4, 0x0

    .line 62
    :goto_0
    if-ge p4, p1, :cond_1

    .line 63
    .line 64
    iget p5, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 65
    .line 66
    rem-int v0, p4, p5

    .line 67
    .line 68
    div-int p5, p4, p5

    .line 69
    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 75
    .line 76
    add-int/2addr v2, p2

    .line 77
    mul-int/2addr v0, v2

    .line 78
    add-int/2addr v1, v0

    .line 79
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 84
    .line 85
    add-int/2addr v2, p3

    .line 86
    mul-int/2addr p5, v2

    .line 87
    add-int/2addr v0, p5

    .line 88
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object p5

    .line 92
    add-int v2, v1, p2

    .line 93
    .line 94
    add-int v3, v0, p3

    .line 95
    .line 96
    invoke-virtual {p5, v1, v0, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 97
    .line 98
    .line 99
    add-int/lit8 p4, p4, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->f:Z

    .line 103
    .line 104
    if-eqz p1, :cond_2

    .line 105
    .line 106
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 107
    .line 108
    add-int/lit8 p1, p1, -0x1

    .line 109
    .line 110
    iget p4, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 111
    .line 112
    add-int/lit8 p4, p4, -0x1

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 115
    .line 116
    .line 117
    move-result p5

    .line 118
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 119
    .line 120
    add-int/2addr v0, p2

    .line 121
    mul-int/2addr p1, v0

    .line 122
    add-int/2addr p5, p1

    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 128
    .line 129
    add-int/2addr v0, p3

    .line 130
    mul-int/2addr p4, v0

    .line 131
    add-int/2addr p1, p4

    .line 132
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 133
    .line 134
    .line 135
    move-result p4

    .line 136
    add-int/lit8 p4, p4, -0x1

    .line 137
    .line 138
    invoke-virtual {p0, p4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    add-int/2addr p2, p5

    .line 143
    add-int/2addr p3, p1

    .line 144
    invoke-virtual {p0, p5, p1, p2, p3}, Landroid/view/View;->layout(IIII)V

    .line 145
    .line 146
    .line 147
    :cond_2
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 17
    .line 18
    add-int/lit8 p2, p2, -0x1

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 21
    .line 22
    mul-int/2addr p2, v0

    .line 23
    sub-int/2addr p1, p2

    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    sub-int/2addr p1, p2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    sub-int/2addr p1, p2

    .line 34
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->e:I

    .line 35
    .line 36
    div-int/2addr p1, p2

    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 42
    .line 43
    add-int/lit8 v0, v0, -0x1

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->a:I

    .line 46
    .line 47
    mul-int/2addr v0, v1

    .line 48
    sub-int/2addr p2, v0

    .line 49
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    sub-int/2addr p2, v0

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    sub-int/2addr p2, v0

    .line 59
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d:I

    .line 60
    .line 61
    div-int/2addr p2, v0

    .line 62
    const/4 v0, 0x0

    .line 63
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-ge v0, v1, :cond_0

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1, p1, p2}, Landroid/view/View;->measure(II)V

    .line 74
    .line 75
    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->c()V

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_2

    .line 17
    .line 18
    invoke-static {p1, p2}, Ll/bnl0;->O(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    const/4 p2, 0x3

    .line 30
    if-ne p1, p2, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d()V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/KeyboardPagerAdapterPage;->d()V

    .line 37
    .line 38
    .line 39
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public requestLayout()V
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingSuperCall"
        }
    .end annotation

    return-void
.end method
