.class public final Lk8k;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lt8k;

.field public final f:Lfd;

.field public final g:Ltsd;

.field public final h:Lpde;

.field public final i:Lcom/opera/android/settings/SettingsManager;

.field public final j:Lo4b;

.field public final k:Lagm;


# direct methods
.method public constructor <init>(Lfwf;Landroidx/recyclerview/widget/RecyclerView;Lijc;Lt8k;Lfd;Ltsd;Lpde;Lcom/opera/android/settings/SettingsManager;Ltsd;)V
    .registers 13

    sget-object v0, Le6k;->e:Le6k;

    const v1, 0x7f0d03c3

    const-class v2, Lg8k;

    invoke-direct {p0, v2, p3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p2, p0, Lk8k;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Lk8k;->e:Lt8k;

    iput-object p5, p0, Lk8k;->f:Lfd;

    iput-object p6, p0, Lk8k;->g:Ltsd;

    iput-object p7, p0, Lk8k;->h:Lpde;

    iput-object p8, p0, Lk8k;->i:Lcom/opera/android/settings/SettingsManager;

    new-instance p2, Lo4b;

    const/16 p3, 0xb

    invoke-direct {p2, p0, v0, p3}, Lo4b;-><init>(Lu5k;Le6k;B)V

    iput-object p2, p0, Lk8k;->j:Lo4b;

    new-instance p2, Lagm;

    new-instance p4, Ls4f;

    const/16 p7, 0x1b

    invoke-direct {p4, p0, p9, p7}, Ls4f;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, p4}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p2, p0, Lk8k;->k:Lagm;

    new-instance p2, Lezg;

    const/4 p4, 0x7

    invoke-direct {p2, p0, p4}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Lyc;

    const/4 p7, 0x4

    invoke-direct {p4, p0, p7}, Lyc;-><init>(Ljava/lang/Object;B)V

    new-instance p9, Ldnj;

    const/16 v0, 0xc

    invoke-direct {p9, p0, v0}, Ldnj;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Lfwf;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {p5, v0, p4, p9}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p4, Ln6k;

    invoke-direct {p4, p0, p7}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    invoke-direct {p0, p4, p3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p6, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p0, Lvme;

    const/16 p3, 0x13

    invoke-direct {p0, p3}, Lvme;-><init>(B)V

    invoke-static {p8, p1, p2, p0}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Lk8k;->k:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lg8k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Lk8k;->j:Lo4b;

    return-object p0
.end method

.method public final z()Z
    .registers 5

    iget-object v0, p0, Lk8k;->i:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_search_shortcuts"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5d

    iget-object v0, p0, Lk8k;->g:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkl5;

    iget-object v0, v0, Lkl5;->b:Landroid/graphics/Rect;

    iget-object v2, p0, Lk8k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-static {v0, v2}, Lddh;->s(ILandroid/content/Context;)Lgpj;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_5d

    const/4 v2, 0x1

    if-eq v0, v2, :cond_33

    const/4 v3, 0x2

    if-eq v0, v3, :cond_33

    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_33
    iget-object v0, p0, Lk8k;->e:Lt8k;

    iget-object v0, v0, Lt8k;->d:Lr8k;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_5d

    if-ne v0, v2, :cond_5a

    sget-object v0, Lpc;->z:Lpc;

    iget-object p0, p0, Lk8k;->f:Lfd;

    invoke-virtual {p0, v0}, Lfd;->b(Lpc;)Z

    move-result v0

    if-nez v0, :cond_51

    sget-object v0, Lpc;->m:Lpc;

    invoke-virtual {p0, v0}, Lfd;->b(Lpc;)Z

    move-result v0

    if-eqz v0, :cond_5d

    :cond_51
    sget-object v0, Lpc;->A:Lpc;

    invoke-virtual {p0, v0}, Lfd;->b(Lpc;)Z

    move-result p0

    if-eqz p0, :cond_5d

    return v2

    :cond_5a
    invoke-static {}, Lh9o;->p()V

    :cond_5d
    return v1
.end method
