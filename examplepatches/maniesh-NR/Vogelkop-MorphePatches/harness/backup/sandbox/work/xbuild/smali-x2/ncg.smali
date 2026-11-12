.class public final synthetic Lncg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Locg;


# direct methods
.method public synthetic constructor <init>(Locg;B)V
    .registers 3

    iput-byte p2, p0, Lncg;->a:B

    iput-object p1, p0, Lncg;->b:Locg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lncg;->a:B

    sget-object v1, Lgl0;->f:Lgl0;

    sget-object v2, Lkl0;->m:Lkl0;

    iget-object p0, p0, Lncg;->b:Locg;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_110

    check-cast p1, Lrdf;

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p0

    iget-boolean v0, p0, Lzcg;->l:Z

    if-nez v0, :cond_1d

    iput-boolean v3, p0, Lzcg;->l:Z

    iget-object v0, p0, Lzcg;->c:Lmdf;

    invoke-virtual {v0, v2, v1}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_1d
    iget-object v0, p0, Lzcg;->k:Ljava/util/LinkedHashSet;

    iget-object v1, p1, Lrdf;->a:Lqdf;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lzcg;->h:Lijd;

    iget-object v0, p1, Lrdf;->a:Lqdf;

    iget-boolean p1, p1, Lrdf;->b:Z

    xor-int/2addr p1, v3

    iget-object v1, p0, Lijd;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_5c

    if-eq v2, v3, :cond_51

    const/4 v3, 0x2

    if-eq v2, v3, :cond_4b

    const/4 v1, 0x3

    if-eq v2, v1, :cond_48

    const/4 v1, 0x4

    if-ne v2, v1, :cond_43

    iput-boolean p1, p0, Lijd;->c:Z

    goto :goto_5e

    :cond_43
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    goto :goto_95

    :cond_48
    iput-boolean p1, p0, Lijd;->b:Z

    goto :goto_5e

    :cond_4b
    const-string v2, "live_scores_enabled"

    invoke-virtual {v1, p1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_5e

    :cond_51
    const-string v2, "enable_google_ai_mode"

    invoke-virtual {v1, p1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const-string v2, "ai_assistant_menu_shortcut"

    invoke-virtual {v1, p1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_5e

    :cond_5c
    iput-boolean p1, p0, Lijd;->a:Z

    :goto_5e
    iget-object p0, p0, Lijd;->h:Ljava/lang/Object;

    check-cast p0, Lwnm;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {v1, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_77
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_90

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lrdf;

    iget-object v4, v3, Lrdf;->a:Lqdf;

    if-ne v4, v0, :cond_8c

    new-instance v3, Lrdf;

    invoke-direct {v3, v4, p1}, Lrdf;-><init>(Lqdf;Z)V

    :cond_8c
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_77

    :cond_90
    invoke-virtual {p0, v2}, Ltsd;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_95
    return-object p0

    :pswitch_96
    check-cast p1, Leef;

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p0

    iget-object v0, p0, Lzcg;->f:Lqln;

    iget-object v4, p0, Lzcg;->c:Lmdf;

    iget-object v5, p0, Lzcg;->p:Leef;

    if-eqz v5, :cond_bf

    invoke-static {p1, v5}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_bf

    iget-boolean v5, p0, Lzcg;->l:Z

    if-nez v5, :cond_b3

    iput-boolean v3, p0, Lzcg;->l:Z

    invoke-virtual {v4, v2, v1}, Lmdf;->a(Lkl0;Lgl0;)V

    :cond_b3
    iget-object v1, p1, Leef;->a:Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xf

    invoke-virtual {v0, v2, v1}, Lqln;->p(ILjava/lang/String;)V

    goto :goto_e8

    :cond_bf
    iget-object v1, p1, Leef;->a:Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v4, Lmdf;->b:Lx5f;

    iget-boolean v4, v2, Lx5f;->h:Z

    if-eqz v4, :cond_dd

    iget-object v4, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    invoke-virtual {v5, v4}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v4

    const/16 v6, 0x4b

    invoke-virtual {v4, v6, v1}, Lb66;->D(ILjava/lang/String;)V

    invoke-virtual {v2, v5}, Lx5f;->U0(Lx56;)V

    :cond_dd
    iget-object v1, p1, Leef;->a:Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v0, v2, v1}, Lqln;->p(ILjava/lang/String;)V

    :goto_e8
    iput-object p1, p0, Lzcg;->p:Leef;

    iget-object p0, p0, Lzcg;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Leef;->b:Lg7j;

    invoke-virtual {p0, p1, v3}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_f4
    check-cast p1, Leef;

    invoke-virtual {p0}, Locg;->f0()Lzcg;

    move-result-object p0

    iget-object v0, p0, Lzcg;->j:Ljava/util/LinkedHashSet;

    iget-object v1, p1, Leef;->a:Laln;

    invoke-interface {v1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Lzcg;->e:Lcom/opera/android/settings/SettingsManager;

    iget-object p1, p1, Leef;->b:Lg7j;

    invoke-virtual {p0, p1, v3}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_f4
        :pswitch_96
    .end packed-switch
.end method
