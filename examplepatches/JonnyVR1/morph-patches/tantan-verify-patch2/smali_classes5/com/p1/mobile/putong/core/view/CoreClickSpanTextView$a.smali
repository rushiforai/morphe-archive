.class public Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;->a:Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;

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
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x2

    .line 11
    if-eq p1, p0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->d()F

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->a()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    sub-float/2addr p1, v0

    .line 28
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    add-float/2addr p0, p1

    .line 33
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->i(F)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->e()F

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->b()F

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    sub-float/2addr p1, v0

    .line 49
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    add-float/2addr p0, p1

    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->j(F)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->f(F)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->g(F)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 73
    .line 74
    .line 75
    move-result-wide p0

    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->c()J

    .line 77
    .line 78
    .line 79
    move-result-wide v1

    .line 80
    sub-long/2addr p0, v1

    .line 81
    const-wide/16 v1, 0xc8

    .line 82
    .line 83
    cmp-long p0, p0, v1

    .line 84
    .line 85
    if-lez p0, :cond_4

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->d()F

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    const/high16 p1, 0x41a00000    # 20.0f

    .line 92
    .line 93
    cmpl-float p0, p0, p1

    .line 94
    .line 95
    if-gtz p0, :cond_2

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->e()F

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    const/high16 p1, 0x41200000    # 10.0f

    .line 102
    .line 103
    cmpl-float p0, p0, p1

    .line 104
    .line 105
    if-lez p0, :cond_4

    .line 106
    .line 107
    :cond_2
    return v0

    .line 108
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView$a;->a:Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-interface {p0, v0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->f(F)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->g(F)V

    .line 129
    .line 130
    .line 131
    const/4 p0, 0x0

    .line 132
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->i(F)V

    .line 133
    .line 134
    .line 135
    invoke-static {p0}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->j(F)V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 139
    .line 140
    .line 141
    move-result-wide p0

    .line 142
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/view/CoreClickSpanTextView;->h(J)V

    .line 143
    .line 144
    .line 145
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 146
    return p0
.end method
