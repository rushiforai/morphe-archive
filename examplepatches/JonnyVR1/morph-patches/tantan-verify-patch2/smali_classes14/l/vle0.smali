.class public Ll/vle0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vle0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/bme0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/vle0$a;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Ll/vle0;->b:Ljava/util/ArrayList;

    .line 17
    .line 18
    new-instance p1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance p1, Ll/vle0$a;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-direct {p1, v0}, Ll/vle0$a;-><init>(Ll/wle0;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/vle0;->d:Ll/vle0$a;

    .line 32
    .line 33
    new-instance p1, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/vle0;->e:Ljava/util/List;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic e0(Ll/vle0;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vle0;->o0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/vle0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vle0;->m0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g0(Ll/vle0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vle0;->n0(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic h0(Ll/vle0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/vle0;->p0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic i0(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vle0;->q0(Lcom/p1/mobile/putong/core/data/School;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic j0(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/vle0;->r0(Lcom/p1/mobile/putong/core/data/School;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final k0(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/School;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vle0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vle0;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/bme0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/bme0;->z()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l0()V
    .locals 2

    .line 1
    new-instance v0, Ll/ple0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ple0;-><init>(Ll/vle0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->i0:Lcom/p1/mobile/putong/core/api/d;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/d;->S:Lcom/p1/mobile/putong/core/api/d$a;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/qle0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/qle0;-><init>(Ll/vle0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic m0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/bme0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/bme0;->r()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/vle0;->e:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic n0(Ljava/util/List;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/16 v0, 0xa

    .line 16
    .line 17
    if-le p1, v0, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {p1, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/vle0;->e:Ljava/util/List;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p1, p0, Ll/vle0;->e:Ljava/util/List;

    .line 30
    .line 31
    iget-object v0, p0, Ll/vle0;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 37
    .line 38
    check-cast p0, Ll/bme0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/bme0;->k()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/vle0;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/core/data/School;

    .line 29
    .line 30
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 31
    .line 32
    sget-object v3, Ljava/util/Locale;->CHINESE:Ljava/util/Locale;

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-nez v2, :cond_1

    .line 47
    .line 48
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/School;->pinyin:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-eqz v2, :cond_0

    .line 63
    .line 64
    :cond_1
    iget-object v2, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-nez v2, :cond_0

    .line 71
    .line 72
    iget-object v2, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    iget-object p1, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_3

    .line 85
    .line 86
    new-instance p1, Lcom/p1/mobile/putong/core/data/School;

    .line 87
    .line 88
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/data/School;-><init>()V

    .line 89
    .line 90
    .line 91
    const-string v0, "1"

    .line 92
    .line 93
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    sget v1, Lcom/p1/mobile/putong/core/R$string;->um:I

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p1, Lcom/p1/mobile/putong/core/data/School;->name:Ljava/lang/String;

    .line 106
    .line 107
    iget-object p0, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :cond_3
    return-object p2
.end method

.method public final synthetic p0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vle0;->d:Ll/vle0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, v0, Ll/vle0$a;->c:Z

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/vle0$a;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Ll/vle0;->d:Ll/vle0$a;

    .line 13
    .line 14
    iget-object p1, p1, Ll/vle0$a;->b:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/vle0;->s0(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Ll/vle0;->c:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/vle0;->k0(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p1, Ll/bme0;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/bme0;->m()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    iget-object p1, p0, Ll/vle0;->a:Ljava/util/List;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/vle0;->k0(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 49
    .line 50
    check-cast p1, Ll/bme0;

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/bme0;->y()V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 56
    .line 57
    check-cast p0, Ll/bme0;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/bme0;->u()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/School;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/bme0;

    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-virtual {p0, p1, p2}, Ll/bme0;->A(Lcom/p1/mobile/putong/core/data/School;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/core/data/School;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Ll/bme0;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    invoke-virtual {p0, p1, p2}, Ll/bme0;->A(Lcom/p1/mobile/putong/core/data/School;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public s0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vle0;->d:Ll/vle0$a;

    .line 2
    .line 3
    iput-object p1, v0, Ll/vle0$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-boolean v1, v0, Ll/vle0$a;->c:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, v0, Ll/vle0$a;->c:Z

    .line 11
    .line 12
    iput-object p1, v0, Ll/vle0$a;->a:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/rle0;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/rle0;-><init>(Ll/vle0;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/sle0;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/sle0;-><init>(Ll/vle0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 53
    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public t0(Lcom/p1/mobile/putong/core/data/School;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    new-instance v2, Lcom/p1/mobile/putong/data/Verification;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Verification;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 29
    .line 30
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 33
    .line 34
    new-instance v2, Lcom/p1/mobile/putong/data/StudentVerification;

    .line 35
    .line 36
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/StudentVerification;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 44
    .line 45
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 46
    .line 47
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/School;->id:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v2, v1, Lcom/p1/mobile/putong/data/StudentVerification;->school:Ljava/lang/String;

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 52
    .line 53
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->i0:Lcom/p1/mobile/putong/core/api/d;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/api/d;->n3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/tle0;

    .line 60
    .line 61
    invoke-direct {v1, p0, p1}, Ll/tle0;-><init>(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;)V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/ule0;

    .line 65
    .line 66
    invoke-direct {v2, p0, p1}, Ll/ule0;-><init>(Ll/vle0;Lcom/p1/mobile/putong/core/data/School;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    return-void
.end method
