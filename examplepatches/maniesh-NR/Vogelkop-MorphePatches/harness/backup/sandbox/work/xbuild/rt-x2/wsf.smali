.class public final Lwsf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lubk;


# instance fields
.field public final a:Lumi;

.field public final b:Lqs7;

.field public final c:Lshf;

.field public final d:Lqie;

.field public final e:Lmgh;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lwsf;->a:Lumi;

    new-instance p2, Lqs7;

    const/16 v0, 0x14

    invoke-direct {p2, v0}, Lqs7;-><init>(B)V

    iput-object p2, p0, Lwsf;->b:Lqs7;

    new-instance p2, Lshf;

    sget-object v0, Llkk;->e:Llkk;

    invoke-direct {p2, p1, v0}, Lshf;-><init>(Landroid/content/Context;Llkk;)V

    iput-object p2, p0, Lwsf;->c:Lshf;

    new-instance p1, Lqie;

    const/16 p2, 0x13

    invoke-direct {p1, p2}, Lqie;-><init>(B)V

    iput-object p1, p0, Lwsf;->d:Lqie;

    new-instance p1, Lmgh;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lmgh;-><init>(B)V

    iput-object p1, p0, Lwsf;->e:Lmgh;

    return-void
.end method

.method public static b(Lkl0;)Ljava/lang/String;
    .registers 2

    sget-object v0, Lkl0;->b:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, "adblocker"

    return-object p0

    :cond_b
    sget-object v0, Lkl0;->c:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string p0, "tracker_blocker"

    return-object p0

    :cond_16
    sget-object v0, Lkl0;->d:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_21

    const-string p0, "default_browser"

    return-object p0

    :cond_21
    sget-object v0, Lkl0;->e:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    const-string p0, "default_browser_failed"

    return-object p0

    :cond_2c
    sget-object v0, Lkl0;->f:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_37

    const-string p0, "notifications"

    return-object p0

    :cond_37
    sget-object v0, Lkl0;->g:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_42

    const-string p0, "pre_screen_consent"

    return-object p0

    :cond_42
    sget-object v0, Lkl0;->h:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    const-string p0, "consent_opera"

    return-object p0

    :cond_4d
    sget-object v0, Lkl0;->i:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_58

    const-string p0, "consent_usercentrics"

    return-object p0

    :cond_58
    sget-object v0, Lkl0;->j:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    const-string p0, "welcome_screen"

    return-object p0

    :cond_63
    sget-object v0, Lkl0;->k:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    const-string p0, "consent_opera_layer_two"

    return-object p0

    :cond_6e
    sget-object v0, Lkl0;->l:Lkl0;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_79

    const-string p0, "reached_main_ui"

    return-object p0

    :cond_79
    const-string p0, "unknown"

    return-object p0
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)V
    .registers 5

    invoke-static {}, Lqs7;->u()Lv56;

    move-result-object v0

    new-instance v1, Lak0;

    iget-object v2, p0, Lwsf;->b:Lqs7;

    invoke-direct {v1, v2, v0}, Lak0;-><init>(Lqs7;Lv56;)V

    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lwsf;->e:Lmgh;

    invoke-virtual {p1, v0}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-eqz p1, :cond_17

    return-void

    :cond_17
    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v1, p0, Lwsf;->a:Lumi;

    invoke-direct {p1, v0, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lo5f;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lwsf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final i(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Lwsf;->c:Lshf;

    invoke-virtual {p0, p1}, Lshf;->N(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final m(Landroidx/fragment/app/r;)V
    .registers 2

    iget-object p0, p0, Lwsf;->c:Lshf;

    invoke-virtual {p0, p1}, Lshf;->f(Landroidx/fragment/app/r;)V

    return-void
.end method

.method public final n(JZ)V
    .registers 7

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object v2, p0, Lwsf;->a:Lumi;

    invoke-direct {v0, v1, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lh5f;

    invoke-direct {v1, p0, p1, p2, p3}, Lh5f;-><init>(Lwsf;JZ)V

    invoke-virtual {v0, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lwsf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method

.method public final setEnabled(Z)V
    .registers 2

    return-void
.end method
