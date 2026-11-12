.class public final Lcx;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lot2;

.field public final e:Lsw;

.field public final f:Lcom/opera/android/autofill/AutofillManager;

.field public final g:Lnkm;

.field public final h:Lode;

.field public final i:Lbx;

.field public j:Lcom/opera/android/undo/UndoBar;


# direct methods
.method public constructor <init>(Lot2;Ld8j;Lcom/opera/android/settings/SettingsManager;Lsw;Lcom/opera/android/autofill/AutofillManager;Lnkm;)V
    .registers 7

    invoke-direct {p0, p3, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p1, p0, Lcx;->d:Lot2;

    iput-object p4, p0, Lcx;->e:Lsw;

    iput-object p5, p0, Lcx;->f:Lcom/opera/android/autofill/AutofillManager;

    iput-object p6, p0, Lcx;->g:Lnkm;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lcx;->h:Lode;

    new-instance p1, Lbx;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lbx;-><init>(Ll7n;B)V

    iput-object p1, p0, Lcx;->i:Lbx;

    invoke-virtual {p0}, Lcx;->g()V

    iget-object p0, p4, Lgv2;->d:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p4, Lgv2;->a:Lcom/opera/android/autofill/AutofillManager;

    iget-object p1, p4, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-nez p1, :cond_45

    new-instance p1, Lfv2;

    invoke-direct {p1, p4, p2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object p1

    iput-object p1, p4, Lgv2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-virtual {p4, p0}, Lgv2;->a(Lcom/opera/android/autofill/AutofillManager;)Lkotlin/jvm/functions/Function1;

    move-result-object p0

    new-instance p1, Liu2;

    const/4 p2, 0x2

    invoke-direct {p1, p4, p2}, Liu2;-><init>(Ljava/lang/Object;B)V

    check-cast p0, Lr2;

    invoke-virtual {p0, p1}, Lr2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_45
    return-void
.end method


# virtual methods
.method public final e()V
    .registers 3

    iget-object v0, p0, Lcx;->e:Lsw;

    iget-object v1, p0, Lcx;->i:Lbx;

    invoke-virtual {v0, v1}, Lgv2;->f(Lbx;)V

    iget-object v0, p0, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    if-eqz v0, :cond_f

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    :cond_f
    const/4 v0, 0x0

    iput-object v0, p0, Lcx;->j:Lcom/opera/android/undo/UndoBar;

    return-void
.end method

.method public final g()V
    .registers 5

    new-instance v0, Lzw;

    iget-object v1, p0, Lcx;->f:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MMr_2O4r()Z

    move-result v1

    iget-object v2, p0, Lcx;->e:Lsw;

    invoke-virtual {v2}, Lgv2;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1a

    sget-object v2, Ljw;->h:Ljw;

    goto :goto_20

    :cond_1a
    new-instance v3, Lkw;

    invoke-direct {v3, v2}, Lkw;-><init>(Ljava/util/ArrayList;)V

    move-object v2, v3

    :goto_20
    invoke-direct {v0, v1, v2}, Lzw;-><init>(ZLsfe;)V

    iget-object p0, p0, Lcx;->h:Lode;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
