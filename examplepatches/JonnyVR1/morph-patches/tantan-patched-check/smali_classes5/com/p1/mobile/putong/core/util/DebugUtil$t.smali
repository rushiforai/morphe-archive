.class public Lcom/p1/mobile/putong/core/util/DebugUtil$t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->xj(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Dialog;

.field public b:Landroid/widget/TextView;

.field public c:Ll/kcg0;

.field public final synthetic d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

.field public final synthetic e:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const-wide/16 p1, 0x1

    .line 9
    .line 10
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    invoke-static {p1, p2, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance p2, Ll/ddd;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/ddd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->c:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/util/DebugUtil$t;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->f(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/util/DebugUtil$t;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->d(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e()V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->resetNowMillis()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v2, v0, v2

    .line 10
    .line 11
    if-gtz v2, :cond_0

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/app/Dialog;->cancel()V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-static {v0, v1}, Ll/tzi0;->b(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L3:I

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 20
    .line 21
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 22
    .line 23
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    sget v2, Lcom/p1/mobile/putong/core/R$string;->K3:I

    .line 46
    .line 47
    iget-object v3, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 48
    .line 49
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 50
    .line 51
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->s()Lcom/p1/mobile/android/app/Dialog$e;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget v1, Ll/dbc0;->ju:I

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->c0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-instance v1, Ll/edd;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/edd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V

    .line 84
    .line 85
    .line 86
    const-string v2, ""

    .line 87
    .line 88
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->e:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sget v2, Ll/dbc0;->ku:I

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->w0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v1, Ll/fdd;

    .line 113
    .line 114
    invoke-direct {v1, p0}, Ll/fdd;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 126
    .line 127
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->Z()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Ll/bnl0;->J0(Landroid/view/View;)Landroid/widget/TextView;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->b:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    const v2, 0x3f8ccccd    # 1.1f

    .line 142
    .line 143
    .line 144
    mul-float/2addr v1, v2

    .line 145
    const/4 v2, 0x0

    .line 146
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->g()V

    .line 150
    .line 151
    .line 152
    return-void
.end method
