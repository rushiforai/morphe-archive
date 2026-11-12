.class public final synthetic Lm57;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lm57;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    iget-byte p0, p0, Lm57;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_1ea

    check-cast p1, Lp1d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c
    check-cast p1, Ll0a;

    iget-object p0, p1, Ll0a;->b:Lv08;

    return-object p0

    :pswitch_11
    check-cast p1, Ll0a;

    iget-object p0, p1, Ll0a;->c:Ll08;

    return-object p0

    :pswitch_16
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->j:Landroid/view/View;

    return-object p0

    :pswitch_1d
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->g:Landroid/view/View;

    return-object p0

    :pswitch_24
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->f:Landroid/view/View;

    return-object p0

    :pswitch_2b
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->d:Landroid/view/View;

    return-object p0

    :pswitch_32
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->i:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    return-object p0

    :pswitch_3b
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->c:Landroid/view/View;

    return-object p0

    :pswitch_42
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->h:Landroid/view/View;

    return-object p0

    :pswitch_49
    check-cast p1, Lbfl;

    invoke-virtual {p1}, Lbfl;->b()Z

    move-result p0

    if-eqz p0, :cond_57

    invoke-virtual {p1}, Lbfl;->c()Z

    move-result p0

    if-eqz p0, :cond_59

    :cond_57
    iget-object v1, p1, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    :cond_59
    return-object v1

    :pswitch_5a
    check-cast p1, Lbfl;

    iget-object p0, p1, Lbfl;->e:Lcom/opera/hype/image/editor/TextBoxFrame;

    return-object p0

    :pswitch_5f
    check-cast p1, Landroid/view/View;

    sget-object p0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    const p0, 0x7f0a0561

    invoke-virtual {p1, p0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    instance-of p1, p0, Lbfl;

    if-eqz p1, :cond_71

    move-object v1, p0

    check-cast v1, Lbfl;

    :cond_71
    return-object v1

    :pswitch_72
    check-cast p1, Landroid/view/ViewGroup;

    sget-object p0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getLayoutTransition()Landroid/animation/LayoutTransition;

    move-result-object p0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_83
    check-cast p1, Lbfl;

    sget-object p0, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p1}, Lbfl;->b()Z

    move-result p0

    if-eqz p0, :cond_94

    invoke-virtual {p1}, Lbfl;->a()Z

    move-result p0

    if-nez p0, :cond_94

    const/4 v0, 0x1

    :cond_94
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_99
    check-cast p1, Lvmg;

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_9e
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a6
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ae
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b6
    check-cast p1, Lk45;

    iget-object p0, p1, Lk45;->a:Lpna;

    iget-object p0, p0, Lpna;->g:Lmpa;

    sget-object p1, Lmpa;->f:Lc30;

    new-instance v0, Ly40;

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Ly40;-><init>(ILmt5;)V

    invoke-virtual {p0, p1, v0}, Lcfg;->f(Lc30;Lcr9;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ca
    check-cast p1, Ljava/net/InetAddress;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_d1
    invoke-static {p1}, Lna2;->i(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_da
    check-cast p1, Lg57;

    sget-object p0, Lt97;->a:Lr16;

    iget-object p1, p1, Lg57;->m:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lt97;->d:Lh58;

    invoke-virtual {p0}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_e9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_101

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lt97;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_e9

    move-object v1, v0

    :cond_101
    check-cast v1, Lt97;

    if-nez v1, :cond_107

    sget-object v1, Lt97;->b:Lt97;

    :cond_107
    return-object v1

    :pswitch_108
    check-cast p1, Lg57;

    iget-boolean p0, p1, Lg57;->k:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_111
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_156

    sget p0, Lny5;->a:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    const/4 v2, 0x2

    if-ne p0, v2, :cond_141

    :goto_122
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p0

    if-ge v0, p0, :cond_143

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    sget v2, Lwym;->a:I

    const/16 v2, 0x61

    if-gt v2, p0, :cond_136

    const/16 v2, 0x7b

    if-lt p0, v2, :cond_13e

    :cond_136
    const/16 v2, 0x41

    if-gt v2, p0, :cond_141

    const/16 v2, 0x5b

    if-ge p0, v2, :cond_141

    :cond_13e
    add-int/lit8 v0, v0, 0x1

    goto :goto_122

    :cond_141
    move-object p0, v1

    goto :goto_149

    :cond_143
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    :goto_149
    if-eqz p0, :cond_14d

    move-object v1, p0

    goto :goto_156

    :cond_14d
    const-string p0, "Invalid country code: "

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :cond_156
    :goto_156
    return-object v1

    :pswitch_157
    check-cast p1, Lg57;

    sget-object p0, Lnrk;->a:Lcpj;

    iget-object p1, p1, Lg57;->E:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_182

    sget-object p0, Lnrk;->d:Lh58;

    invoke-virtual {p0}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_168
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_180

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lnrk;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_168

    move-object v1, v0

    :cond_180
    check-cast v1, Lnrk;

    :cond_182
    return-object v1

    :pswitch_183
    check-cast p1, Lg57;

    iget p0, p1, Lg57;->j:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    if-lez p0, :cond_18e

    move-object v1, p1

    :cond_18e
    if-eqz v1, :cond_195

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_197

    :cond_195
    const/16 p0, 0x3c

    :goto_197
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_19c
    check-cast p1, Lg57;

    sget-object p0, Lft8;->a:Li06;

    iget-object p1, p1, Lg57;->y:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_1c7

    sget-object p0, Lft8;->d:Lh58;

    invoke-virtual {p0}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1ad
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c5

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lft8;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1ad

    move-object v1, v0

    :cond_1c5
    check-cast v1, Lft8;

    :cond_1c7
    return-object v1

    :pswitch_1c8
    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1d9

    move-object v1, p0

    :cond_1d9
    return-object v1

    :pswitch_1da
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-lez p0, :cond_1e4

    move-object v1, p1

    goto :goto_1e9

    :cond_1e4
    const-string p0, "Timeout must be greater than zero."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1e9
    return-object v1

    :pswitch_data_1ea
    .packed-switch 0x0
        :pswitch_1da
        :pswitch_1c8
        :pswitch_19c
        :pswitch_183
        :pswitch_157
        :pswitch_111
        :pswitch_108
        :pswitch_da
        :pswitch_d1
        :pswitch_ca
        :pswitch_b6
        :pswitch_ae
        :pswitch_a6
        :pswitch_9e
        :pswitch_99
        :pswitch_83
        :pswitch_72
        :pswitch_5f
        :pswitch_5a
        :pswitch_49
        :pswitch_42
        :pswitch_3b
        :pswitch_32
        :pswitch_2b
        :pswitch_24
        :pswitch_1d
        :pswitch_16
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method
