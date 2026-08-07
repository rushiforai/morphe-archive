.class public Ll/rgr$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rgr;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZZZLjava/lang/String;Ll/rcj;Lcom/p1/mobile/putong/core/newui/home/d;)Z
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

.field public final synthetic e:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/CounterLikeLimit;Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rgr$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    iput-object p2, p0, Ll/rgr$a;->e:Lcom/p1/mobile/android/app/Act;

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
    new-instance p2, Ll/qgr;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/qgr;-><init>(Ll/rgr$a;)V

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
    iput-object p1, p0, Ll/rgr$a;->c:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method public static synthetic a(Ll/rgr$a;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rgr$a;->d(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b(Ll/rgr$a;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rgr$a;->f(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/rgr$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rgr$a;->e()V

    return-void
.end method


# virtual methods
.method public final synthetic d(Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/rgr$a;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgr$a;->c:Ll/kcg0;

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
    iget-object p0, p0, Ll/rgr$a;->c:Ll/kcg0;

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
    iget-object v0, p0, Ll/rgr$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

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
    iget-object v2, p0, Ll/rgr$a;->a:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object v2, p0, Ll/rgr$a;->a:Lcom/p1/mobile/android/app/Dialog;

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
    iget-object v1, p0, Ll/rgr$a;->b:Landroid/widget/TextView;

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
    iget-object p0, p0, Ll/rgr$a;->b:Landroid/widget/TextView;

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
    iget-object v0, p0, Ll/rgr$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/rgr$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L3:I

    .line 10
    .line 11
    iget-object v3, p0, Ll/rgr$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 12
    .line 13
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 14
    .line 15
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v1, p0, Ll/rgr$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    sget v2, Lcom/p1/mobile/putong/core/R$string;->K3:I

    .line 34
    .line 35
    iget-object v3, p0, Ll/rgr$a;->d:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 36
    .line 37
    iget v3, v3, Lcom/p1/mobile/putong/data/CounterLikeLimit;->total:I

    .line 38
    .line 39
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sget v1, Ll/dbc0;->ju:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->c0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/ogr;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/ogr;-><init>(Ll/rgr$a;)V

    .line 68
    .line 69
    .line 70
    const-string v2, ""

    .line 71
    .line 72
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v1, p0, Ll/rgr$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 77
    .line 78
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    sget v2, Ll/dbc0;->ku:I

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->w0(Landroid/graphics/drawable/Drawable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    new-instance v1, Ll/pgr;

    .line 93
    .line 94
    invoke-direct {v1, p0}, Ll/pgr;-><init>(Ll/rgr$a;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Ll/rgr$a;->a:Lcom/p1/mobile/android/app/Dialog;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->Z()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v0}, Ll/bnl0;->J0(Landroid/view/View;)Landroid/widget/TextView;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Ll/rgr$a;->b:Landroid/widget/TextView;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/widget/TextView;->getTextSize()F

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const v2, 0x3f8ccccd    # 1.1f

    .line 122
    .line 123
    .line 124
    mul-float/2addr v1, v2

    .line 125
    const/4 v2, 0x0

    .line 126
    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p0}, Ll/rgr$a;->g()V

    .line 130
    .line 131
    .line 132
    return-void
.end method
