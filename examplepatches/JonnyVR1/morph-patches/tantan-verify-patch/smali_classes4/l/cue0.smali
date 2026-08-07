.class public Ll/cue0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/gue0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/cue0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cue0;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f0(Ll/cue0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cue0;->m0()V

    return-void
.end method

.method public static synthetic g0(Ll/cue0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cue0;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic h0(Ll/cue0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cue0;->n0(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic i0(Ll/cue0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cue0;->l0()V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/gue0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/gue0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/xte0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/xte0;-><init>(Ll/cue0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public j0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/cue0;->c:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/cue0;->b:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/cue0;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p0, Ll/gue0;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/gue0;->i(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic l0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/cue0;->q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n0(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public p0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/cue0;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/cue0;->s0(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/cue0;->b:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Ll/cue0;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->O3:I

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->r4:I

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->a:I

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    new-instance v6, Ll/yte0;

    .line 59
    .line 60
    invoke-direct {v6, p0}, Ll/yte0;-><init>(Ll/cue0;)V

    .line 61
    .line 62
    .line 63
    new-instance v7, Ll/zte0;

    .line 64
    .line 65
    invoke-direct {v7, p0}, Ll/zte0;-><init>(Ll/cue0;)V

    .line 66
    .line 67
    .line 68
    const-string v2, ""

    .line 69
    .line 70
    invoke-static/range {v1 .. v7}, Ll/p710;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/x20;Ll/x20;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public q0()V
    .locals 3

    .line 1
    const-string v0, "e_edit_nickname_page_done_button"

    .line 2
    .line 3
    const-string v1, "p_edit_nickname_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I2:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    iget-object v1, p0, Ll/cue0;->c:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p0, Ll/cue0;->b:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/dkb;->Ga(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/aue0;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/aue0;-><init>(Ll/cue0;)V

    .line 36
    .line 37
    .line 38
    new-instance v2, Ll/bue0;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/bue0;-><init>(Ll/cue0;)V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public r0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/cue0;->b:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/gue0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gue0;->m()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public s0(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/data/User;->ILLEGAL_NAME_PATTERN()Ljava/util/regex/Pattern;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-object v0

    .line 39
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 40
    .line 41
    sget p1, Lcom/p1/mobile/putong/common/R$string;->g2:I

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method
