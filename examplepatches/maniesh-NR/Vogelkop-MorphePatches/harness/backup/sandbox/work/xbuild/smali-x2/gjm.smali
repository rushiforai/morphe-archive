.class public final Lgjm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static final g:Ljava/lang/String;


# instance fields
.field public final a:Landroidx/fragment/app/w;

.field public final b:Lkotlin/jvm/functions/Function1;

.field public final c:Lshf;

.field public final d:Ljava/util/ArrayList;

.field public final e:Lejm;

.field public final f:Ljava/util/LinkedHashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-class v0, Lu7i;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ui-dest-"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lgjm;->g:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroidx/fragment/app/w;Ltcc;Lkotlin/jvm/functions/Function1;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgjm;->a:Landroidx/fragment/app/w;

    iput-object p3, p0, Lgjm;->b:Lkotlin/jvm/functions/Function1;

    new-instance v0, Lshf;

    new-instance v1, Llrk;

    const/4 v7, 0x0

    const/16 v8, 0xf

    const/4 v2, 0x1

    const-class v4, Lgjm;

    const-string v5, "allowNavigationBack"

    const-string v6, "allowNavigationBack(Landroidx/fragment/app/FragmentManager$BackStackEntry;)Z"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Llrk;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance p0, Lp7l;

    const/16 v2, 0x18

    invoke-direct {p0, v3, v2}, Lp7l;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1, p0}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v0, v3, Lgjm;->c:Lshf;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v3, Lgjm;->d:Ljava/util/ArrayList;

    new-instance p0, Lejm;

    invoke-direct {p0, p2, p3}, Lejm;-><init>(Ltcc;Lkotlin/jvm/functions/Function1;)V

    iput-object p0, v3, Lgjm;->e:Lejm;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, v3, Lgjm;->f:Ljava/util/LinkedHashMap;

    const/4 p2, 0x1

    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/w;->b0(Lx1p;Z)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Lnim;

    iget-object p0, p0, Lgjm;->e:Lejm;

    iget-object v0, p0, Lejm;->t:Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lejm;->u:Levl;

    iget-object p1, p1, Lnim;->a:Lqim;

    iget-boolean p0, p0, Levl;->a:Z

    iput-boolean p0, p1, Lqim;->q:Z

    if-eqz p0, :cond_1b

    invoke-virtual {p1}, Lqim;->d()Z

    move-result p0

    invoke-virtual {p1, p0}, Lqim;->e(Z)V

    return-void

    :cond_1b
    invoke-virtual {p1}, Lqim;->a()V

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lnim;

    iget-object p0, p0, Lgjm;->e:Lejm;

    iget-object p0, p0, Lejm;->t:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Ljava/lang/Class;)Loje;
    .registers 4

    invoke-static {p1}, Lu0h;->h(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lgjm;->e:Lejm;

    invoke-virtual {p0}, Lejm;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Loje;

    iget-object v1, v0, Loje;->a:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    return-object v0

    :cond_1f
    const-string p0, "No entry: "

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Ln37;)Z
    .registers 8

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ui-dest-"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lgjm;->e:Lejm;

    invoke-virtual {v2}, Lejm;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_14
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_b5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Loje;

    iget-object v3, v3, Loje;->a:Ljava/lang/String;

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lgjm;->g:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v3, 0x1

    if-nez v0, :cond_5a

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v5, p0, Lgjm;->a:Landroidx/fragment/app/w;

    invoke-virtual {v5, v0}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_5a

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0, p1, v3}, Lgjm;->g(Ljava/lang/Class;Z)V

    return v3

    :cond_5a
    iget-object p0, p0, Lgjm;->c:Lshf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7a

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->C(Ljava/lang/Integer;)Z

    move-result p0

    return p0

    :cond_7a
    iget-object v0, p0, Lshf;->a:Ljava/lang/Object;

    check-cast v0, Landroidx/fragment/app/w;

    invoke-virtual {v0}, Landroidx/fragment/app/w;->J()I

    move-result v2

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    sub-int/2addr v2, v3

    :goto_8f
    if-ltz v2, :cond_a5

    invoke-virtual {v0, v2}, Landroidx/fragment/app/w;->I(I)Landroidx/fragment/app/a;

    move-result-object v1

    iget-object v1, v1, Lym9;->k:Ljava/lang/String;

    invoke-static {v1, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_a6

    :cond_a2
    add-int/lit8 v2, v2, -0x1

    goto :goto_8f

    :cond_a5
    const/4 p1, 0x0

    :goto_a6
    if-eqz p1, :cond_b5

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lshf;->C(Ljava/lang/Integer;)Z

    move-result p0

    return p0

    :cond_b5
    return v4
.end method

.method public final c(Lr37;Lndc;Lf7f;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ui-dest-"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lode;

    invoke-direct {v1}, Lekc;-><init>()V

    invoke-virtual {v1, p2, p3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object p2, p0, Lgjm;->f:Ljava/util/LinkedHashMap;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lgjm;->f(Ln37;Z)V

    return-void
.end method

.method public final e(Ln37;Z)V
    .registers 5

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ui-dest-"

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lgjm;->f:Ljava/util/LinkedHashMap;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1, p2}, Lgjm;->f(Ln37;Z)V

    return-void
.end method

.method public final f(Ln37;Z)V
    .registers 16

    iget-object v0, p0, Lgjm;->a:Landroidx/fragment/app/w;

    invoke-virtual {v0}, Landroidx/fragment/app/w;->R()Z

    move-result v1

    if-nez v1, :cond_534

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ui-dest-"

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lgjm;->e:Lejm;

    invoke-virtual {v3}, Lejm;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const-string v6, "__dest_bundle_key"

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v5, :cond_66

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Loje;

    iget-object v5, v5, Loje;->a:Ljava/lang/String;

    invoke-static {v5, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1c

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v1

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v4

    if-nez v1, :cond_40

    move v5, v8

    goto :goto_41

    :cond_40
    move v5, v7

    :goto_41
    invoke-virtual {p0, v4, v5}, Lgjm;->g(Ljava/lang/Class;Z)V

    if-eqz v1, :cond_52

    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, v6, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {v1, p0}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-void

    :cond_52
    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v4, Lgjm;->g:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_534

    :cond_66
    iget-object v1, p0, Lgjm;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move-object v9, v5

    move v10, v7

    :cond_6f
    if-ge v10, v4, :cond_48e

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v10, v10, 0x1

    check-cast v9, Lfj;

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v11

    iget-byte v9, v9, Lfj;->a:B

    const-class v12, Lskj;

    packed-switch v9, :pswitch_data_53c

    const-class v9, Lspn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_90

    const-class v9, Ltpn;

    goto/16 :goto_48c

    :cond_90
    const-class v9, Lmon;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lqon;

    goto/16 :goto_48c

    :pswitch_9c
    const-class v9, Lrkn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a8

    const-class v9, Lukn;

    goto/16 :goto_48c

    :cond_a8
    const-class v9, Ldmn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_b4

    const-class v9, Ljmn;

    goto/16 :goto_48c

    :cond_b4
    const-class v9, Lmkn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_c0

    const-class v9, Lnkn;

    goto/16 :goto_48c

    :cond_c0
    const-class v9, Lsln;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Ltln;

    goto/16 :goto_48c

    :pswitch_cc
    const-class v9, Lfhf;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lodn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_e0

    const-class v12, Lldn;

    goto/16 :goto_468

    :cond_e0
    const-class v9, Lvfn;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    const-class v12, Lcgn;

    goto/16 :goto_468

    :pswitch_ec
    const-class v9, Lduh;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Leuh;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Loyk;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    const-class v12, Lsyk;

    goto/16 :goto_468

    :pswitch_108
    const-class v9, Lwrk;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_114

    const-class v12, Lxrk;

    goto/16 :goto_468

    :cond_114
    const-class v9, Lork;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_120

    const-class v12, Lqrk;

    goto/16 :goto_468

    :cond_120
    const-class v9, Ltrk;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12c

    const-class v12, Lvrk;

    goto/16 :goto_468

    :cond_12c
    const-class v9, Lzrk;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    goto/16 :goto_468

    :pswitch_136
    const-class v9, Lo2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_142

    const-class v12, Lu2;

    goto/16 :goto_468

    :cond_142
    const-class v9, Lj9;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_14e

    const-class v12, Lp9;

    goto/16 :goto_468

    :cond_14e
    const-class v9, Ld01;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_15a

    const-class v12, Lg01;

    goto/16 :goto_468

    :cond_15a
    const-class v9, Lku1;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_166

    const-class v12, Lpu1;

    goto/16 :goto_468

    :cond_166
    const-class v9, Lfs1;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_172

    const-class v12, Lgs1;

    goto/16 :goto_468

    :cond_172
    const-class v9, Lft1;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_17e

    const-class v12, Lht1;

    goto/16 :goto_468

    :cond_17e
    const-class v9, Ljt1;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Llt1;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_192

    const-class v12, Lnt1;

    goto/16 :goto_468

    :cond_192
    const-class v9, Lic2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_19e

    const-class v12, Lkc2;

    goto/16 :goto_468

    :cond_19e
    const-class v9, Ldy3;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1aa

    const-class v12, Lgy3;

    goto/16 :goto_468

    :cond_1aa
    const-class v9, Ln35;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1b6

    const-class v12, Lp35;

    goto/16 :goto_468

    :cond_1b6
    const-class v9, Lpb6;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1c2

    const-class v12, Lsb6;

    goto/16 :goto_468

    :cond_1c2
    const-class v9, Lzl8;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1ce

    const-class v12, Ldm8;

    goto/16 :goto_468

    :cond_1ce
    const-class v9, Lb29;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1da

    const-class v12, Lc29;

    goto/16 :goto_468

    :cond_1da
    const-class v9, Ldw9;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1e6

    const-class v12, Lfw9;

    goto/16 :goto_468

    :cond_1e6
    const-class v9, Lbaa;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1f2

    const-class v12, Lcaa;

    goto/16 :goto_468

    :cond_1f2
    const-class v9, Ltca;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1fe

    const-class v12, Ldda;

    goto/16 :goto_468

    :cond_1fe
    const-class v9, Lbrd;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_20a

    const-class v12, Lcrd;

    goto/16 :goto_468

    :cond_20a
    const-class v9, Lx2f;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_216

    const-class v12, La3f;

    goto/16 :goto_468

    :cond_216
    const-class v9, Lc9g;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_222

    const-class v12, Lg9g;

    goto/16 :goto_468

    :cond_222
    const-class v9, Lfcg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_22e

    const-class v12, Lhcg;

    goto/16 :goto_468

    :cond_22e
    const-class v9, Lxyg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_23a

    const-class v12, Lazg;

    goto/16 :goto_468

    :cond_23a
    const-class v9, Lhsi;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_246

    const-class v12, Lisi;

    goto/16 :goto_468

    :cond_246
    const-class v9, Lxvi;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_252

    const-class v12, Lawi;

    goto/16 :goto_468

    :cond_252
    const-class v9, Le6j;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_25e

    const-class v12, Lk6j;

    goto/16 :goto_468

    :cond_25e
    const-class v9, Lt8j;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_26a

    const-class v12, Lc9j;

    goto/16 :goto_468

    :cond_26a
    const-class v9, Lmoj;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_276

    const-class v12, Looj;

    goto/16 :goto_468

    :cond_276
    const-class v9, Lido;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_282

    const-class v12, Ljdo;

    goto/16 :goto_468

    :cond_282
    const-class v9, Lm7k;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_28e

    const-class v12, Lv7k;

    goto/16 :goto_468

    :cond_28e
    const-class v9, Laak;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    const-class v12, Lz9k;

    goto/16 :goto_468

    :pswitch_29a
    const-class v9, Ln3i;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2a6

    const-class v9, Ls3i;

    goto/16 :goto_48c

    :cond_2a6
    const-class v9, Lg4i;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2b2

    const-class v9, Lk4i;

    goto/16 :goto_48c

    :cond_2b2
    const-class v9, Lt4i;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lr4i;

    goto/16 :goto_48c

    :pswitch_2be
    const-class v9, Ljnh;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lknh;

    goto/16 :goto_48c

    :pswitch_2ca
    const-class v9, Lavg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2d6

    const-class v12, Lcvg;

    goto/16 :goto_468

    :cond_2d6
    const-class v9, Lptg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2e2

    const-class v12, Lxtg;

    goto/16 :goto_468

    :cond_2e2
    const-class v9, Laug;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lgug;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lytg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lbug;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lmtg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lntg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lotg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lztg;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Leug;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    goto/16 :goto_468

    :pswitch_32c
    const-class v9, Lswe;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_338

    const-class v9, Lxwe;

    goto/16 :goto_48c

    :cond_338
    const-class v9, Lexe;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lkxe;

    goto/16 :goto_48c

    :pswitch_344
    const-class v9, Lxse;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_350

    const-class v9, Lzse;

    goto/16 :goto_48c

    :cond_350
    const-class v9, Lqse;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lrse;

    goto/16 :goto_48c

    :pswitch_35c
    const-class v9, Lmrc;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Llrc;

    goto/16 :goto_48c

    :pswitch_368
    const-class v9, Lm2b;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lo2b;

    goto/16 :goto_48c

    :pswitch_374
    const-class v9, Lys;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_380

    const-class v9, Lct;

    goto/16 :goto_48c

    :cond_380
    const-class v9, Lqs;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lss;

    goto/16 :goto_48c

    :pswitch_38c
    const-class v9, Lxl3;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_398

    const-class v9, Lim3;

    goto/16 :goto_48c

    :cond_398
    const-class v9, Lpx7;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lqx7;

    goto/16 :goto_48c

    :pswitch_3a4
    const-class v9, Lku;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3b0

    const-class v12, Lru;

    goto/16 :goto_468

    :cond_3b0
    const-class v9, Lbu2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3bc

    const-class v12, Leu2;

    goto/16 :goto_468

    :cond_3bc
    const-class v9, Lih3;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3c8

    const-class v12, Ljh3;

    goto/16 :goto_468

    :cond_3c8
    const-class v9, La27;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Ld3b;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3dc

    const-class v12, Lg3b;

    goto/16 :goto_468

    :cond_3dc
    const-class v9, Ls4g;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lo5g;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3f0

    const-class v12, Lt5g;

    goto/16 :goto_468

    :cond_3f0
    const-class v9, La6g;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3fc

    const-class v12, Lf6g;

    goto/16 :goto_468

    :cond_3fc
    const-class v9, Lmmm;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_407

    const-class v12, Lnmm;

    goto :goto_468

    :cond_407
    const-class v9, Lj8n;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_412

    const-class v12, Llu2;

    goto :goto_468

    :cond_412
    const-class v9, Lzv7;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    const-class v12, Lqt2;

    goto :goto_468

    :pswitch_41d
    const-class v9, Ltw;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_428

    const-class v12, Luw;

    goto :goto_468

    :cond_428
    const-class v9, Ljp2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_433

    const-class v12, Lkp2;

    goto :goto_468

    :cond_433
    const-class v9, Llp2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_43e

    const-class v12, Lmp2;

    goto :goto_468

    :cond_43e
    const-class v9, Luq2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_449

    const-class v12, Lxq2;

    goto :goto_468

    :cond_449
    const-class v9, Lsr2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_454

    const-class v12, Lwr2;

    goto :goto_468

    :cond_454
    const-class v9, Lbs2;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_468

    const-class v9, Lxk4;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_467

    const-class v12, Lzk4;

    goto :goto_468

    :cond_467
    move-object v12, v5

    :cond_468
    :goto_468
    move-object v9, v12

    goto :goto_48c

    :pswitch_46a
    const-class v9, Lij;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_475

    const-class v9, Ljj;

    goto :goto_48c

    :cond_475
    const-class v9, Lvj;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_480

    const-class v9, Llk;

    goto :goto_48c

    :cond_480
    const-class v9, Lqk;

    invoke-static {v11, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_48b

    const-class v9, Lwk;

    goto :goto_48c

    :cond_48b
    move-object v9, v5

    :goto_48c
    if-eqz v9, :cond_6f

    :cond_48e
    if-eqz v9, :cond_535

    invoke-interface {p1}, Ln37;->getId()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v2, v6, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p0, p0, Lgjm;->b:Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, v9}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcjm;

    if-eqz p0, :cond_534

    iget v4, p0, Lcjm;->a:I

    iget-boolean p0, p0, Lcjm;->b:Z

    new-instance v5, Landroidx/fragment/app/a;

    invoke-direct {v5, v0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {v5, v1}, Lym9;->c(Ljava/lang/String;)V

    if-eqz p2, :cond_4be

    move v6, v7

    goto :goto_4c0

    :cond_4be
    const/16 v6, 0x1003

    :goto_4c0
    iput v6, v5, Lym9;->h:I

    if-eqz p0, :cond_4df

    invoke-virtual {v0}, Landroidx/fragment/app/w;->L()Lol9;

    move-result-object v4

    const-class v6, Landroidx/fragment/app/a;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Lol9;->a(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v4

    check-cast v4, Landroidx/fragment/app/i;

    invoke-virtual {v4, v2}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v4, v5, v1}, Landroidx/fragment/app/i;->show(Lym9;Ljava/lang/String;)I

    goto :goto_4ff

    :cond_4df
    iget-object v6, v5, Lym9;->p:Ljava/util/ArrayList;

    if-eqz v6, :cond_4f5

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4f5

    invoke-virtual {v5, v9, v2}, Lym9;->d(Ljava/lang/Class;Landroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    const/4 v6, 0x2

    invoke-virtual {v5, v4, v2, v1, v6}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {v5}, Landroidx/fragment/app/a;->h()I

    goto :goto_4ff

    :cond_4f5
    invoke-virtual {v5, v9, v2}, Lym9;->d(Ljava/lang/Class;Landroid/os/Bundle;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    invoke-virtual {v5, v4, v2, v1, v8}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {v5}, Landroidx/fragment/app/a;->h()I

    :goto_4ff
    instance-of p1, p1, Luj9;

    xor-int/2addr p1, v8

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Loje;

    invoke-direct {v2, v1, p1, p0}, Loje;-><init>(Ljava/lang/String;ZZ)V

    iget-object p0, v3, Lejm;->r:Ljava/util/LinkedHashMap;

    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, v3, Lejm;->q:Ljava/util/ArrayDeque;

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfjm;

    if-eqz p0, :cond_520

    iget-object p0, p0, Lfjm;->b:Ldjm;

    iput-boolean v7, p0, Ldjm;->c:Z

    invoke-virtual {p0}, Ldjm;->a()V

    :cond_520
    invoke-virtual {v3}, Lejm;->Z()Levl;

    move-result-object p0

    invoke-virtual {v3, p0}, Lejm;->a0(Levl;)V

    iget-object p0, v3, Lejm;->s:Landroid/os/Handler;

    invoke-virtual {p0, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    if-eqz p2, :cond_534

    invoke-virtual {v0}, Landroidx/fragment/app/w;->D()V

    :cond_534
    return-void

    :cond_535
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_53c
    .packed-switch 0x0
        :pswitch_46a
        :pswitch_41d
        :pswitch_3a4
        :pswitch_38c
        :pswitch_374
        :pswitch_368
        :pswitch_35c
        :pswitch_344
        :pswitch_32c
        :pswitch_2ca
        :pswitch_2be
        :pswitch_29a
        :pswitch_136
        :pswitch_108
        :pswitch_ec
        :pswitch_cc
        :pswitch_9c
    .end packed-switch
.end method

.method public final g(Ljava/lang/Class;Z)V
    .registers 5

    invoke-static {p1}, Lu0h;->h(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lgjm;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    iget-object v1, p0, Lgjm;->a:Landroidx/fragment/app/w;

    if-eqz v0, :cond_14

    const/4 p1, 0x0

    const/4 p2, 0x1

    invoke-virtual {v1, p2, p1}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    goto :goto_17

    :cond_14
    invoke-virtual {v1, p2, p1}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    :goto_17
    iget-object p0, p0, Lgjm;->e:Lejm;

    iget-object p1, p0, Lejm;->s:Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final h(Ljava/lang/Class;Ljava/lang/Object;)V
    .registers 3

    iget-object p0, p0, Lgjm;->f:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Lu0h;->h(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lode;

    if-eqz p0, :cond_11

    invoke-virtual {p0, p2}, Lekc;->r(Ljava/lang/Object;)V

    :cond_11
    return-void
.end method
