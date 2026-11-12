.class public final Li7k;
.super Lv5k;
.source "SourceFile"


# instance fields
.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Ltsd;

.field public final f:Lcom/opera/android/settings/SettingsManager;

.field public final g:Lbvl;

.field public final h:Lr22;

.field public final i:Lss8;

.field public final j:Lagm;


# direct methods
.method public constructor <init>(Lfwf;Landroidx/recyclerview/widget/RecyclerView;Lijc;Ltsd;Lpde;Lcom/opera/android/settings/SettingsManager;Llg;Lfd;Lhv3;Ltsd;Lmbf;Lbvl;Lr22;)V
    .registers 21

    sget-object v0, Le6k;->f:Le6k;

    const v1, 0x7f0d03c1

    const-class v2, Lg7k;

    invoke-direct {p0, v2, p3, v0, v1}, Lv5k;-><init>(Ljava/lang/Class;Lijc;Le6k;I)V

    iput-object p2, p0, Li7k;->d:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Li7k;->e:Ltsd;

    iput-object p6, p0, Li7k;->f:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 p2, p12

    iput-object p2, p0, Li7k;->g:Lbvl;

    move-object/from16 p3, p13

    iput-object p3, p0, Li7k;->h:Lr22;

    new-instance p3, Lss8;

    move-object/from16 v1, p11

    invoke-direct {p3, p0, v1, v0}, Lss8;-><init>(Li7k;Lmbf;Le6k;)V

    iput-object p3, p0, Li7k;->i:Lss8;

    new-instance p3, Lagm;

    new-instance v0, Lkkc;

    move-object v1, p0

    move-object v2, p5

    move-object v3, p7

    move-object v4, p8

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    invoke-direct/range {v0 .. v6}, Lkkc;-><init>(Li7k;Lpde;Llg;Lfd;Lhv3;Ltsd;)V

    invoke-direct {p3, v0}, Lagm;-><init>(Lkotlin/jvm/functions/Function0;)V

    iput-object p3, p0, Li7k;->j:Lagm;

    new-instance p3, Lezg;

    const/4 v0, 0x6

    invoke-direct {p3, p0, v0}, Lezg;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lf7k;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lf7k;-><init>(Li7k;B)V

    new-instance v2, Lt7d;

    const/16 v3, 0x11

    invoke-direct {v2, v0, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p4, p1, v2}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p4, Lvme;

    const/16 v0, 0x13

    invoke-direct {p4, v0}, Lvme;-><init>(B)V

    invoke-static {p6, p1, p3, p4}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    invoke-interface {p2}, Lbvl;->getState()Lpde;

    move-result-object p2

    new-instance p3, Lf7k;

    const/4 p4, 0x1

    invoke-direct {p3, p0, p4}, Lf7k;-><init>(Li7k;B)V

    new-instance p0, Lt7d;

    invoke-direct {p0, p3, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p2, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/ViewGroup;)Lab2;
    .registers 2

    iget-object p0, p0, Li7k;->j:Lagm;

    invoke-virtual {p0}, Lagm;->r()Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final t()Lja2;
    .registers 2

    new-instance p0, Lg7k;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public final u()Lk6k;
    .registers 1

    iget-object p0, p0, Li7k;->i:Lss8;

    return-object p0
.end method

.method public final z()Z
    .registers 4

    iget-object v0, p0, Li7k;->g:Lbvl;

    invoke-interface {v0}, Lbvl;->getState()Lpde;

    move-result-object v0

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lavl;

    iget-boolean v0, v0, Lavl;->b:Z

    const/4 v1, 0x0

    if-nez v0, :cond_19

    iget-object v0, p0, Li7k;->h:Lr22;

    invoke-virtual {v0}, Lr22;->i()Z

    move-result v0

    if-eqz v0, :cond_23

    :cond_19
    iget-object v0, p0, Li7k;->f:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "enable_search_shortcuts_tablet"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_24

    :cond_23
    return v1

    :cond_24
    iget-object v0, p0, Li7k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Li7k;->e:Ltsd;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkl5;

    iget-object p0, p0, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    move-result p0

    invoke-static {p0, v0}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_50

    const/4 v0, 0x1

    if-eq p0, v0, :cond_4f

    const/4 v2, 0x2

    if-eq p0, v2, :cond_4f

    const/4 v2, 0x3

    if-eq p0, v2, :cond_4f

    invoke-static {}, Lh9o;->p()V

    return v1

    :cond_4f
    return v0

    :cond_50
    return v1
.end method
