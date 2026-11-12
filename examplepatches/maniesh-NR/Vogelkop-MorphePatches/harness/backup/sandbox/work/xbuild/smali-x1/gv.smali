.class public final synthetic Lgv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/util/Collection;B)V
    .registers 4

    iput-byte p3, p0, Lgv;->a:B

    iput p1, p0, Lgv;->b:I

    iput-object p2, p0, Lgv;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lgv;->a:B

    iput-object p1, p0, Lgv;->c:Ljava/lang/Object;

    iput p2, p0, Lgv;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lgv;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v4, p0, Lgv;->b:I

    iget-object p0, p0, Lgv;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_190

    check-cast p0, Ljava/util/List;

    check-cast p1, Lcom/opera/android/startup/WelcomeActivity;

    iget-object v0, p1, Lcom/opera/android/startup/WelcomeActivity;->v:Lxbf;

    iget-object v1, p1, Lcom/opera/android/startup/WelcomeActivity;->r:Lmcj;

    if-nez v1, :cond_18

    move-object v6, v2

    goto :goto_19

    :cond_18
    move-object v6, v1

    :goto_19
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v7, v1, Ld6j;->c:Lx5f;

    iget-object v1, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lmdf;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->h()Lr65;

    move-result-object v9

    iget-object p1, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Lxbf;

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Lmi;

    iget-object p1, p1, Lmi;->m:Lhi;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    move-object v10, p1

    check-cast v10, Lyl6;

    new-instance v5, Lpdf;

    invoke-direct/range {v5 .. v10}, Lpdf;-><init>(Lmcj;Lorm;Lmdf;Lr65;Lyl6;)V

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_68
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lm0o;

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_68

    :cond_7c
    new-array p0, v3, [Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Ljava/lang/String;

    const-string v0, "key.onboarding_page_ids"

    invoke-virtual {p1, v0, p0}, Landroid/os/BaseBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string p0, "key.steps_after_feature_onboarding"

    invoke-virtual {p1, p0, v4}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v5, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v5

    :pswitch_92
    check-cast p0, Ljava/lang/ref/WeakReference;

    check-cast p1, Lifd;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc7n;

    if-eqz p0, :cond_a5

    iget v0, p0, Lc7n;->r:I

    if-ne v0, v4, :cond_a5

    invoke-virtual {p0, p1}, Lc7n;->o0(Lifd;)V

    :cond_a5
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a8
    check-cast p0, Lz5l;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object p0, p0, Lz5l;->u:Lypd;

    iget-object p0, p0, Lypd;->c:Ljava/lang/Object;

    check-cast p0, Lz5l;

    invoke-virtual {p0}, Lz5l;->b()V

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p0, p1, v4}, Lexg;->z(Landroidx/recyclerview/widget/RecyclerView;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c1
    check-cast p0, Ljava/util/Collection;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1, v4, p0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_ce
    check-cast p0, Lifg;

    check-cast p1, Lp1d;

    iget v0, p0, Lifg;->a:I

    sub-int/2addr v4, v0

    div-int/2addr v4, v1

    invoke-static {p1, p0, v4, v3}, Lp1d;->h(Lp1d;Lifg;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_dc
    check-cast p0, Ljava/util/ArrayList;

    move-object v7, p1

    check-cast v7, Lyj0;

    invoke-static {v4}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_123

    const/4 v0, 0x1

    if-eq p1, v0, :cond_113

    if-eq p1, v1, :cond_103

    const/4 v0, 0x3

    if-ne p1, v0, :cond_ff

    new-instance v5, Ls2;

    const/4 v11, 0x0

    const/16 v12, 0x15

    const/4 v6, 0x2

    const-class v8, Lyj0;

    const-string v9, "putOmnibarAutocompleteSuggestions"

    const-string v10, "putOmnibarAutocompleteSuggestions$behavior_impl(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V"

    invoke-direct/range {v5 .. v12}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    goto :goto_132

    :cond_ff
    invoke-static {}, Lh9o;->p()V

    goto :goto_153

    :cond_103
    new-instance v5, Ls2;

    const/4 v11, 0x0

    const/16 v12, 0x14

    const/4 v6, 0x2

    const-class v8, Lyj0;

    const-string v9, "putOmnibarSearchSuggestions"

    const-string v10, "putOmnibarSearchSuggestions$behavior_impl(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V"

    invoke-direct/range {v5 .. v12}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    goto :goto_132

    :cond_113
    new-instance v5, Ls2;

    const/4 v11, 0x0

    const/16 v12, 0x13

    const/4 v6, 0x2

    const-class v8, Lyj0;

    const-string v9, "putOmnibarSuggestedSites"

    const-string v10, "putOmnibarSuggestedSites$behavior_impl(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V"

    invoke-direct/range {v5 .. v12}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    goto :goto_132

    :cond_123
    new-instance v5, Ls2;

    const/4 v11, 0x0

    const/16 v12, 0x12

    const/4 v6, 0x2

    const-class v8, Lyj0;

    const-string v9, "putStartPageSuggestedSites"

    const-string v10, "putStartPageSuggestedSites$behavior_impl(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V"

    invoke-direct/range {v5 .. v12}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    :goto_132
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :goto_136
    if-ge v3, p1, :cond_151

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v3, v3, 0x1

    check-cast v0, La3g;

    iget v1, v0, La3g;->a:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lo5f;

    const/16 v4, 0xf

    invoke-direct {v2, v0, v4}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v5, v1, v2}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_136

    :cond_151
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_153
    return-object v2

    :pswitch_154
    check-cast p0, Lne5;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lne5;->f:Ljava/lang/Object;

    check-cast p0, Lk4a;

    invoke-virtual {p0, p1, v4}, Lk4a;->c(Landroid/graphics/drawable/Drawable;I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_162
    check-cast p0, Lau2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_16f

    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_16f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_172
    check-cast p0, Lhd;

    check-cast p1, Lkotlin/Unit;

    new-instance p1, Llxh;

    const v0, 0x7f0803ec

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    iget-object p0, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Ldx3;

    invoke-virtual {p1, p0}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-static {p1, v4, v4}, Lz5i;->x(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p0, p1, v2, v3, v3}, Lcom/opera/android/webapps/ShortcutHelper;->b(Ldx3;Landroid/graphics/Bitmap;Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_190
    .packed-switch 0x0
        :pswitch_172
        :pswitch_162
        :pswitch_154
        :pswitch_dc
        :pswitch_ce
        :pswitch_c1
        :pswitch_a8
        :pswitch_92
    .end packed-switch
.end method
