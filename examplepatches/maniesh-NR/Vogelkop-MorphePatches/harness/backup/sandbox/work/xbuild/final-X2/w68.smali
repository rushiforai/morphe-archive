.class public final Lw68;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Lcom/opera/android/esim/ui/EsimActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lw68;->t:B

    iput-object p1, p0, Lw68;->v:Lcom/opera/android/esim/ui/EsimActivity;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lw68;->t:B

    iget-object p0, p0, Lw68;->v:Lcom/opera/android/esim/ui/EsimActivity;

    packed-switch p1, :pswitch_data_24

    new-instance p1, Lw68;

    const/4 v0, 0x3

    invoke-direct {p1, p0, p2, v0}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lw68;

    const/4 v0, 0x2

    invoke-direct {p1, p0, p2, v0}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    return-object p1

    :pswitch_15
    new-instance p1, Lw68;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    return-object p1

    :pswitch_1c
    new-instance p1, Lw68;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lw68;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_3e

    invoke-virtual {p0, p1, p2}, Lw68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lw68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lw68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lw68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lw68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lw68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_23
    invoke-virtual {p0, p1, p2}, Lw68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lw68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lw68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lpx5;->a:Lpx5;

    return-object p0

    :pswitch_31
    invoke-virtual {p0, p1, p2}, Lw68;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lw68;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lw68;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_31
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    iget-byte v0, p0, Lw68;->t:B

    iget-object v1, p0, Lw68;->v:Lcom/opera/android/esim/ui/EsimActivity;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_1ca

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lw68;->u:Z

    if-eqz v5, :cond_1b

    if-ne v5, v3, :cond_17

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_2f

    :cond_17
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_31

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lqcc;->d:Lqcc;

    new-instance v2, Lz68;

    invoke-direct {v2, v1, v4, v3}, Lz68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    iput-boolean v3, p0, Lw68;->u:Z

    invoke-static {v1, p1, v2, p0}, Lm5h;->w(Lndc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2f

    move-object v4, v0

    goto :goto_31

    :cond_2f
    :goto_2f
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_31
    return-object v4

    :pswitch_32
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lw68;->u:Z

    if-eqz v5, :cond_42

    if-ne v5, v3, :cond_3e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_56

    :cond_3e
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_58

    :cond_42
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lqcc;->d:Lqcc;

    new-instance v2, Lw68;

    invoke-direct {v2, v1, v4, v3}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    iput-boolean v3, p0, Lw68;->u:Z

    invoke-static {v1, p1, v2, p0}, Lm5h;->w(Lndc;Lqcc;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_56

    move-object v4, v0

    goto :goto_58

    :cond_56
    :goto_56
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_58
    return-object v4

    :pswitch_59
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lw68;->u:Z

    if-eqz v5, :cond_69

    if-eq v5, v3, :cond_65

    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_89

    :cond_65
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_84

    :cond_69
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    invoke-virtual {v1}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object p1

    iget-object p1, p1, Lu78;->n:Lrlh;

    new-instance v2, Lz68;

    const/4 v5, 0x0

    invoke-direct {v2, v1, v4, v5}, Lz68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    iput-boolean v3, p0, Lw68;->u:Z

    invoke-static {p1, v2, p0}, Lj14;->v(Lf99;Lkotlin/jvm/functions/Function2;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_84

    move-object v4, v0

    goto :goto_89

    :cond_84
    :goto_84
    const-string p0, "SharedFlow never completes, this call should never return."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_89
    return-object v4

    :pswitch_8a
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lw68;->u:Z

    if-eqz v5, :cond_9b

    if-ne v5, v3, :cond_96

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_c7

    :cond_96
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto/16 :goto_1c9

    :cond_9b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget p1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    invoke-virtual {v1}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object p1

    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_bb

    const-string v5, "esim_destination"

    const-class v6, Ls88;

    invoke-static {v2, v5, v6}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    check-cast v2, Ls88;

    goto :goto_bc

    :cond_bb
    move-object v2, v4

    :goto_bc
    iput-boolean v3, p0, Lw68;->u:Z

    invoke-virtual {p1, v2, p0}, Lu78;->h(Ls88;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v0, :cond_c7

    move-object v4, v0

    goto/16 :goto_1c9

    :cond_c7
    :goto_c7
    check-cast p1, Ls88;

    sget p0, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    iget-object p0, v1, Lcom/opera/android/esim/ui/EsimActivity;->R:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldp6;

    iget-object p0, p0, Ldp6;->k:Lhv5;

    iget-object p0, v1, Lcom/opera/android/esim/ui/EsimActivity;->S:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    const v0, 0x7f140893

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_1d4

    goto :goto_147

    :sswitch_f0
    const-string v2, "pt-PT"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "pt"

    goto :goto_147

    :sswitch_fb
    const-string v2, "nb-NO"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "nb"

    goto :goto_147

    :sswitch_106
    const-string v2, "ms-MY"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "ms"

    goto :goto_147

    :sswitch_111
    const-string v2, "bn-IN"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "bn"

    goto :goto_147

    :sswitch_11c
    const-string v2, "ar-SA"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "ar"

    goto :goto_147

    :sswitch_127
    const-string v2, "fil"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "tl"

    goto :goto_147

    :sswitch_132
    const-string v2, "en"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "en-US"

    goto :goto_147

    :sswitch_13d
    const-string v2, "es-419"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_147

    const-string v0, "es"

    :cond_147
    :goto_147
    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    instance-of v0, p1, Ll88;

    if-eqz v0, :cond_163

    const-string v0, "checkout"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v0, "success"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    check-cast p1, Ll88;

    iget-object p1, p1, Ll88;->a:Ljava/lang/String;

    const-string v0, "payment_ref"

    invoke-virtual {p0, v0, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1ba

    :cond_163
    sget-object v0, Lm88;->a:Lm88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_171

    const-string p1, "destinations"

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1ba

    :cond_171
    sget-object v0, Lo88;->a:Lo88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_186

    const-string p1, "ineligible"

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string p1, "view"

    const-string v0, "incompatible"

    invoke-virtual {p0, p1, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1ba

    :cond_186
    sget-object v0, Lp88;->a:Lp88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1ba

    sget-object v0, Ln88;->a:Ln88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "onboarding"

    if-eqz v0, :cond_19c

    invoke-virtual {p0, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1ba

    :cond_19c
    sget-object v0, Lq88;->a:Lq88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1ad

    invoke-virtual {p0, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string p1, "nonfree"

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1ba

    :cond_1ad
    sget-object v0, Lr88;->a:Lr88;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1c6

    const-string p1, "plans"

    invoke-virtual {p0, p1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_1ba
    :goto_1ba
    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    iput-object p0, v1, Lcom/opera/android/esim/ui/EsimActivity;->e0:Landroid/net/Uri;

    invoke-static {v1}, Lcom/opera/android/esim/ui/EsimActivity;->F0(Lcom/opera/android/esim/ui/EsimActivity;)V

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1c9

    :cond_1c6
    invoke-static {}, Lh9o;->p()V

    :goto_1c9
    return-object v4

    :pswitch_data_1ca
    .packed-switch 0x0
        :pswitch_8a
        :pswitch_59
        :pswitch_32
    .end packed-switch

    :sswitch_data_1d4
    .sparse-switch
        -0x4d3cbc43 -> :sswitch_13d
        0xca9 -> :sswitch_132
        0x18c09 -> :sswitch_127
        0x58b6d6a -> :sswitch_11c
        0x597b246 -> :sswitch_111
        0x634fb33 -> :sswitch_106
        0x63b587a -> :sswitch_fb
        0x65fb66d -> :sswitch_f0
    .end sparse-switch
.end method
