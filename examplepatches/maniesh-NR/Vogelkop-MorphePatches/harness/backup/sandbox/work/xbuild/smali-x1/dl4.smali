.class public final Ldl4;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lot2;

.field public final e:Lgv2;

.field public final f:Lnkm;

.field public final g:Lwh2;

.field public final h:Ljvg;

.field public final i:Lode;

.field public final j:Ls9;

.field public final k:Lbx;

.field public l:Lcom/opera/android/undo/UndoBar;


# direct methods
.method public constructor <init>(Lot2;Ld8j;Lcom/opera/android/settings/SettingsManager;Lgv2;Lnkm;Lgjm;Lwh2;)V
    .registers 8

    invoke-direct {p0, p3, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p1, p0, Ldl4;->d:Lot2;

    iput-object p4, p0, Ldl4;->e:Lgv2;

    iput-object p5, p0, Ldl4;->f:Lnkm;

    iput-object p7, p0, Ldl4;->g:Lwh2;

    new-instance p1, Ljvg;

    invoke-direct {p1, p0, p6}, Ljvg;-><init>(Ll7n;Lgjm;)V

    iput-object p1, p0, Ldl4;->h:Ljvg;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Ldl4;->i:Lode;

    new-instance p1, Ls9;

    const/16 p2, 0x9

    invoke-direct {p1, p0, p2}, Ls9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ldl4;->j:Ls9;

    new-instance p2, Lbx;

    const/4 p5, 0x2

    invoke-direct {p2, p0, p5}, Lbx;-><init>(Ll7n;B)V

    iput-object p2, p0, Ldl4;->k:Lbx;

    invoke-virtual {p0}, Ldl4;->g()V

    invoke-virtual {p3, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p0, p4, Lgv2;->d:Li7f;

    invoke-virtual {p0, p2}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p4, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    iget-object p1, p4, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-nez p1, :cond_56

    new-instance p1, Lfv2;

    const/4 p2, 0x0

    invoke-direct {p1, p4, p2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object p1

    iput-object p1, p4, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-virtual {p4, p0}, Lgv2;->a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object p0

    new-instance p1, Liu2;

    invoke-direct {p1, p4, p5}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_56
    return-void
.end method


# virtual methods
.method public final e()V
    .registers 3

    iget-object v0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Ldl4;->j:Ls9;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Ldl4;->e:Lgv2;

    iget-object v1, p0, Ldl4;->k:Lbx;

    invoke-virtual {v0, v1}, Lgv2;->f(Lbx;)V

    iget-object v0, p0, Ldl4;->l:Lcom/opera/android/undo/UndoBar;

    if-eqz v0, :cond_16

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    :cond_16
    const/4 v0, 0x0

    iput-object v0, p0, Ldl4;->l:Lcom/opera/android/undo/UndoBar;

    return-void
.end method

.method public final g()V
    .registers 5

    new-instance v0, Lbl4;

    iget-object v1, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "automatic_card_save_ask"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    iget-object v2, p0, Ldl4;->e:Lgv2;

    invoke-virtual {v2}, Lgv2;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_19

    sget-object v2, Lkk4;->o:Lkk4;

    goto :goto_1f

    :cond_19
    new-instance v3, Llk4;

    invoke-direct {v3, v2}, Llk4;-><init>(Ljava/util/ArrayList;)V

    move-object v2, v3

    :goto_1f
    invoke-direct {v0, v1, v2}, Lbl4;-><init>(ZLna2;)V

    iget-object p0, p0, Ldl4;->i:Lode;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
