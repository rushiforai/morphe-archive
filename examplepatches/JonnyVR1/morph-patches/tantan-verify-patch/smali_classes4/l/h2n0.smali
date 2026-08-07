.class public abstract Ll/h2n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/u1n0;

.field public final b:Ll/xzm0;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/kcg0;

.field public final e:Landroid/app/Application$ActivityLifecycleCallbacks;


# direct methods
.method public constructor <init>(Ll/xzm0;Ll/u1n0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/h2n0;->c:Lrx/subjects/a;

    .line 14
    .line 15
    new-instance v0, Ll/h2n0$a;

    .line 16
    .line 17
    invoke-direct {v0, p0}, Ll/h2n0$a;-><init>(Ll/h2n0;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/h2n0;->e:Landroid/app/Application$ActivityLifecycleCallbacks;

    .line 21
    .line 22
    iput-object p1, p0, Ll/h2n0;->b:Ll/xzm0;

    .line 23
    .line 24
    iput-object p2, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 25
    .line 26
    sget-object p0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h2n0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public b(I)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->d7:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x4

    .line 11
    if-ne p1, v0, :cond_4

    .line 12
    .line 13
    iget-object p1, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/u1n0;->k()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v0, "busy"

    .line 20
    .line 21
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/u1n0;->o()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_4

    .line 34
    .line 35
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->c7:I

    .line 36
    .line 37
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    const-string v0, "rejected"

    .line 42
    .line 43
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/u1n0;->o()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->k7:I

    .line 58
    .line 59
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    const-string v0, "canceled"

    .line 64
    .line 65
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_3

    .line 70
    .line 71
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/u1n0;->o()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_4

    .line 78
    .line 79
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->P6:I

    .line 80
    .line 81
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_3
    const-string v0, "finished"

    .line 86
    .line 87
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-eqz p1, :cond_4

    .line 92
    .line 93
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/u1n0;->f()Ll/azm0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget-boolean p0, p0, Ll/azm0;->s:Z

    .line 100
    .line 101
    if-nez p0, :cond_4

    .line 102
    .line 103
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->h7:I

    .line 104
    .line 105
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 106
    .line 107
    .line 108
    :cond_4
    return-void
.end method

.method public abstract c(I)V
.end method

.method public d(Ll/u1n0;)V
    .locals 2

    .line 1
    new-instance v0, Ll/g2n0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/g2n0;-><init>(Ll/h2n0;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "VoiceCallViewInterface"

    .line 7
    .line 8
    invoke-virtual {p1, v1, v0}, Ll/u1n0;->t(Ljava/lang/String;Ll/y20;)Ll/kcg0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/h2n0;->d:Ll/kcg0;

    .line 13
    .line 14
    return-void
.end method

.method public abstract e(Landroid/app/Activity;)V
.end method

.method public abstract f(Landroid/content/Context;)V
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract g(Landroid/content/Context;)V
.end method

.method public h(Landroid/content/Context;I)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/h2n0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eq v0, p2, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/h2n0;->c:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-virtual {v0, p2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/h2n0;->f(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public i()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/h2n0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method
