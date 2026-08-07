.class public Ll/aqf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/aqf;->h(Ll/spf$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
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

.field public final synthetic e:Ll/spf$a;

.field public final synthetic f:Ll/aqf;


# direct methods
.method public constructor <init>(Ll/aqf;Lcom/p1/mobile/putong/data/CounterLikeLimit;Ll/spf$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/aqf$a;->f:Ll/aqf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/aqf$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 4
    .line 5
    iput-object p3, p0, Ll/aqf$a;->e:Ll/spf$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p3, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    const-wide/16 p2, 0x1

    .line 13
    .line 14
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {p2, p3, v0}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    invoke-virtual {p2, p3}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/zpf;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/zpf;-><init>(Ll/aqf$a;)V

    .line 39
    .line 40
    .line 41
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/aqf$a;->c:Ll/kcg0;

    .line 50
    .line 51
    return-void
.end method

.method public static synthetic a(Ll/aqf$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aqf$a;->f(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b(Ll/aqf$a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/aqf$a;->d(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ll/aqf$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqf$a;->e()V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/aqf$a;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aqf$a;->c:Ll/kcg0;

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
    iget-object p0, p0, Ll/aqf$a;->c:Ll/kcg0;

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
    iget-object v0, p0, Ll/aqf$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

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
    iget-object v2, p0, Ll/aqf$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 14
    .line 15
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Ll/aqf$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/app/Dialog;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-static {v0, v1}, Ll/tzi0;->b(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/aqf$a;->b:Landroid/widget/TextView;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Ll/aqf$a;->b:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/aqf$a;->e:Ll/spf$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/aqf$a;->e:Ll/spf$a;

    .line 10
    .line 11
    iget-object v1, v1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L3:I

    .line 14
    .line 15
    iget-object v3, p0, Ll/aqf$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 16
    .line 17
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 18
    .line 19
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Ll/aqf$a;->e:Ll/spf$a;

    .line 36
    .line 37
    iget-object v1, v1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    sget v2, Lcom/p1/mobile/putong/core/R$string;->K3:I

    .line 40
    .line 41
    iget-object v3, p0, Ll/aqf$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 42
    .line 43
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 44
    .line 45
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->s()Lcom/p1/mobile/android/app/Dialog$e;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget v1, Ll/dbc0;->ju:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->c0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    new-instance v1, Ll/xpf;

    .line 76
    .line 77
    invoke-direct {v1, p0}, Ll/xpf;-><init>(Ll/aqf$a;)V

    .line 78
    .line 79
    .line 80
    const-string v2, ""

    .line 81
    .line 82
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v1, p0, Ll/aqf$a;->e:Ll/spf$a;

    .line 87
    .line 88
    iget-object v1, v1, Ll/spf$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 89
    .line 90
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    sget v2, Ll/dbc0;->ku:I

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->w0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/ypf;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/ypf;-><init>(Ll/aqf$a;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iput-object v0, p0, Ll/aqf$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->Z()Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v0}, Ll/bnl0;->J0(Landroid/view/View;)Landroid/widget/TextView;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iput-object v0, p0, Ll/aqf$a;->b:Landroid/widget/TextView;

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    const v2, 0x3f8ccccd    # 1.1f

    .line 134
    .line 135
    .line 136
    mul-float/2addr v1, v2

    .line 137
    const/4 v2, 0x0

    .line 138
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0}, Ll/aqf$a;->g()V

    .line 142
    .line 143
    .line 144
    return-void
.end method
