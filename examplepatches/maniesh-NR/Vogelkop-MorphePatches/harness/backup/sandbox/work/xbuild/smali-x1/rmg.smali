.class public final synthetic Lrmg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrmg;->a:B

    iput-object p1, p0, Lrmg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Lrmg;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object p0, p0, Lrmg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_474

    check-cast p0, Lt7i;

    check-cast p1, Lgpm;

    new-instance v0, Lh7i;

    invoke-direct {v0, p1, v3}, Lh7i;-><init>(Lgpm;Z)V

    iget-object p0, p0, Lt7i;->f:Lqq6;

    new-instance p1, Lv91;

    const/16 v1, 0x11

    invoke-direct {p1, v0, v1}, Lv91;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lr7i;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lr7i;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Lqq6;->h(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29
    check-cast p0, Ly5i;

    check-cast p1, Lng6;

    invoke-virtual {p0, p1}, Ly5i;->g(Lng6;)Lqsk;

    move-result-object p0

    return-object p0

    :pswitch_32
    check-cast p0, Lxbf;

    check-cast p1, Lto9;

    iput-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3b
    check-cast p0, Lx4i;

    iget-object v0, p0, Lx4i;->d:Lddc;

    check-cast p1, Lm18;

    sget-object v2, Lm18;->b:Lm18;

    if-ne p1, v2, :cond_62

    new-instance p1, Lr07;

    invoke-direct {p1, p0, v3, v4}, Lr07;-><init>(Lx4i;ZLmt5;)V

    invoke-static {v0, v4, v4, p1, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    iget-object p1, p0, Lx4i;->e:Ld3k;

    if-eqz p1, :cond_54

    invoke-virtual {p1, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_54
    new-instance p1, Lagb;

    const/16 v2, 0x17

    invoke-direct {p1, v2, v4, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v0, v4, v4, p1, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Lx4i;->e:Ld3k;

    goto :goto_70

    :cond_62
    iget-object p1, p0, Lx4i;->e:Ld3k;

    if-eqz p1, :cond_69

    invoke-virtual {p1, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_69
    iget-object p0, p0, Lx4i;->h:Lode;

    sget-object p1, Ln08;->a:Ln08;

    invoke-static {p0, p1}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    :goto_70
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_73
    check-cast p0, Lr4i;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lr4i;->j:J

    invoke-virtual {p0, v0, v1}, Lr4i;->h0(J)V

    iget-object p1, p0, Lr4i;->h:Lua7;

    iget-object v0, p0, Lr4i;->i:Lpt1;

    if-nez v0, :cond_87

    move-object v0, v4

    :cond_87
    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    iget-wide v0, p0, Lr4i;->j:J

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object v5

    check-cast v5, Lt4i;

    iget-object v5, v5, Lt4i;->a:Lk15;

    iget-wide v5, v5, Lk15;->b:J

    cmp-long v0, v0, v5

    if-ltz v0, :cond_a0

    move v0, v3

    goto :goto_a1

    :cond_a0
    move v0, v2

    :goto_a1
    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lt4i;

    iget-object v1, v1, Lt4i;->b:Lq4i;

    iget-object v5, p0, Lr4i;->i:Lpt1;

    if-nez v5, :cond_ae

    move-object v5, v4

    :cond_ae
    iget-object v5, v5, Lpt1;->g:Landroid/view/View;

    check-cast v5, Landroid/widget/TextView;

    if-eqz v0, :cond_c9

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_c5

    if-ne v6, v3, :cond_c0

    const v6, 0x7f140ec0

    goto :goto_cc

    :cond_c0
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_168

    :cond_c5
    const v6, 0x7f140ecf

    goto :goto_cc

    :cond_c9
    const v6, 0x7f140ec6

    :goto_cc
    invoke-virtual {p0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lt4i;

    iget-object p1, p1, Lt4i;->a:Lk15;

    iget-wide v5, p1, Lk15;->b:J

    if-eqz v0, :cond_114

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_f0

    if-ne p1, v3, :cond_eb

    const p1, 0x7f140ebf

    goto :goto_f3

    :cond_eb
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_168

    :cond_f0
    const p1, 0x7f140ece

    :goto_f3
    iget-object v7, p0, Lr4i;->i:Lpt1;

    if-nez v7, :cond_f8

    move-object v7, v4

    :cond_f8
    iget-object v7, v7, Lpt1;->f:Ljava/lang/Object;

    check-cast v7, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v5, v6, v3}, Lupj;->o(Landroid/content/Context;JZ)Landroid/text/SpannableString;

    move-result-object v5

    new-array v3, v3, [Ljava/lang/CharSequence;

    aput-object v5, v3, v2

    invoke-static {v8, p1, v3}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object p1

    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_137

    :cond_114
    iget-object p1, p0, Lr4i;->i:Lpt1;

    if-nez p1, :cond_119

    move-object p1, v4

    :cond_119
    iget-object p1, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eqz v2, :cond_12d

    if-ne v2, v3, :cond_129

    const v2, 0x7f140ec5

    goto :goto_130

    :cond_129
    invoke-static {}, Lh9o;->p()V

    goto :goto_168

    :cond_12d
    const v2, 0x7f140ec7

    :goto_130
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_137
    iget-wide v2, p0, Lr4i;->j:J

    invoke-virtual {p0, v2, v3}, Lr4i;->h0(J)V

    iget-object p1, p0, Lr4i;->i:Lpt1;

    if-nez p1, :cond_141

    move-object p1, v4

    :cond_141
    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v0, :cond_14b

    const v2, 0x7f140c71

    goto :goto_14e

    :cond_14b
    const v2, 0x7f140ec3

    :goto_14e
    invoke-virtual {p0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lr4i;->i:Lpt1;

    if-eqz p1, :cond_15a

    move-object v4, p1

    :cond_15a
    iget-object p1, v4, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v2, Lhv6;

    invoke-direct {v2, v0, p0, v1}, Lhv6;-><init>(ZLr4i;Lq4i;)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_168
    return-object v4

    :pswitch_169
    check-cast p0, Lx79;

    check-cast p1, Lm18;

    iput-object v4, p0, Lx79;->d:Ljava/lang/Object;

    iget-object p1, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p1, Lob;

    if-eqz p1, :cond_180

    iput-object v4, p0, Lx79;->e:Ljava/lang/Object;

    iget-object v0, p0, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Loje;

    iget-object v0, v0, Loje;->d:Lqdc;

    invoke-virtual {v0, p1}, Lqdc;->b(Lmdc;)V

    :cond_180
    iget-object p0, p0, Lx79;->c:Ljava/lang/Object;

    check-cast p0, Li51;

    invoke-virtual {p0}, Li51;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18a
    check-cast p0, Lm0f;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Lm0f;->b:Ljava/lang/String;

    if-eqz p0, :cond_19d

    invoke-static {p0}, Lddh;->y(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_19d

    sget-object v0, Llqm;->i:Llqm;

    invoke-static {p0, v0, v2, p1}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    :cond_19d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1a0
    check-cast p0, Ln0f;

    check-cast p1, Landroid/content/Context;

    iget-object p0, p0, Ln0f;->E:Lm0f;

    iget-object p0, p0, Lm0f;->b:Ljava/lang/String;

    if-eqz p0, :cond_1b5

    invoke-static {p0}, Lddh;->y(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    if-eqz p0, :cond_1b5

    sget-object v0, Llqm;->i:Llqm;

    invoke-static {p0, v0, v2, p1}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    :cond_1b5
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b8
    check-cast p0, Lvl6;

    iget-object v0, p0, Lvl6;->e:Ljava/lang/Object;

    check-cast v0, Lq3i;

    iget-object v5, p0, Lvl6;->b:Ljava/lang/Object;

    check-cast v5, Lwv1;

    check-cast p1, Lm18;

    sget-object v6, Ld59;->g:Ld59;

    if-nez p1, :cond_1ca

    const/4 p1, -0x1

    goto :goto_1d2

    :cond_1ca
    sget-object v7, Lp3i;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p1, v7, p1

    :goto_1d2
    if-eq p1, v3, :cond_224

    const/4 v7, 0x2

    if-eq p1, v7, :cond_1f9

    if-eq p1, v1, :cond_1e0

    const/4 p0, 0x4

    if-eq p1, p0, :cond_1e0

    invoke-static {}, Lh9o;->p()V

    goto :goto_226

    :cond_1e0
    iget-object p0, v5, Lwv1;->b:Lb6h;

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le59;

    iget-object p1, p0, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {p1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lc59;

    iget-object p1, p1, Lc59;->i:Lh7f;

    invoke-virtual {p1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p0, v6, v2}, Le59;->c(Ld59;Z)V

    goto :goto_224

    :cond_1f9
    iget-object p1, v5, Lwv1;->b:Lb6h;

    invoke-interface {p1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le59;

    iget-object v1, p1, Le59;->a:Ljava/util/HashMap;

    invoke-virtual {v1, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc59;

    iget-object v1, v1, Lc59;->i:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p1, v6}, Le59;->b(Ld59;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_221

    iget-object p0, p0, Lvl6;->d:Ljava/lang/Object;

    check-cast p0, Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly3i;

    invoke-interface {p0, v0}, Ly3i;->e(Ljava/lang/String;)V

    :cond_221
    invoke-virtual {p1, v6, v3}, Le59;->c(Ld59;Z)V

    :cond_224
    :goto_224
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_226
    return-object v4

    :pswitch_227
    check-cast p0, Lr2i;

    check-cast p1, Lm18;

    sget-object v0, Lm18;->b:Lm18;

    if-ne p1, v0, :cond_250

    iget-boolean p1, p0, Lr2i;->e:Z

    if-nez p1, :cond_235

    iput-boolean v3, p0, Lr2i;->e:Z

    :cond_235
    iget-object p1, p0, Lr2i;->g:Ld3k;

    if-eqz p1, :cond_23c

    invoke-virtual {p1, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_23c
    iget-object p1, p0, Lr2i;->d:Lndc;

    invoke-static {p1}, Lfsp;->y(Lndc;)Lddc;

    move-result-object p1

    new-instance v0, Lagb;

    const/16 v2, 0x12

    invoke-direct {v0, v2, v4, p0}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p1, v4, v4, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    iput-object p1, p0, Lr2i;->g:Ld3k;

    goto :goto_257

    :cond_250
    iget-object p0, p0, Lr2i;->g:Ld3k;

    if-eqz p0, :cond_257

    invoke-virtual {p0, v4}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_257
    :goto_257
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25a
    check-cast p0, Lo2i;

    check-cast p1, Lm18;

    invoke-virtual {p0}, Lo2i;->b()Z

    move-result p1

    iget-boolean v0, p0, Lo2i;->e:Z

    if-eq p1, v0, :cond_26d

    iput-boolean p1, p0, Lo2i;->e:Z

    iget-object p0, p0, Lo2i;->d:Lfd;

    invoke-virtual {p0}, Lfd;->c()V

    :cond_26d
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_270
    check-cast p0, Lxt2;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lgcf;->setEnabled(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27e
    check-cast p0, Ltoh;

    check-cast p1, Lus7;

    invoke-virtual {p0, p1}, Ltoh;->a(Lus7;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_288
    check-cast p0, Lhoh;

    check-cast p1, Ljava/lang/Throwable;

    const-string v0, "Recomposer effect job completed"

    invoke-static {v0, p1}, Lna2;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    move-result-object v0

    iget-object v1, p0, Lhoh;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_295
    iget-object v2, p0, Lhoh;->d:Lunb;

    if-eqz v2, :cond_2b3

    iget-object v3, p0, Lhoh;->u:Lnak;

    sget-object v5, Leoh;->b:Leoh;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-interface {v2, v0}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    iput-object v4, p0, Lhoh;->r:Lnh4;

    new-instance v0, Lvvf;

    const/16 v3, 0xb

    invoke-direct {v0, p0, p1, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v2, v0}, Lunb;->s(Lkotlin/jvm/functions/Function1;)Lxb7;

    goto :goto_2bf

    :cond_2b3
    iput-object v0, p0, Lhoh;->e:Ljava/lang/Throwable;

    iget-object p0, p0, Lhoh;->u:Lnak;

    sget-object p1, Leoh;->a:Leoh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v4, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_2bf
    .catchall {:try_start_295 .. :try_end_2bf} :catchall_2c3

    :goto_2bf
    monitor-exit v1

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :catchall_2c3
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_2c7
    check-cast p0, Lfi5;

    invoke-virtual {p0, p1}, Lfi5;->y(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2cf
    check-cast p0, Lcnh;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lcnh;->b:Lpt1;

    iget-object p0, p0, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2df
    check-cast p0, Ljkh;

    check-cast p1, Ljava/lang/Throwable;

    if-eqz p1, :cond_30a

    instance-of v0, p1, Ljava/util/concurrent/CancellationException;

    if-eqz v0, :cond_2ec

    move-object v4, p1

    check-cast v4, Ljava/util/concurrent/CancellationException;

    :cond_2ec
    if-nez v4, :cond_2fa

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2f6

    const-string v0, "Channel was cancelled"

    :cond_2f6
    invoke-static {v0, p1}, Lna2;->a(Ljava/lang/String;Ljava/lang/Throwable;)Ljava/util/concurrent/CancellationException;

    move-result-object v4

    :cond_2fa
    iget-object p1, p0, Ljkh;->c:Ld65;

    if-nez p1, :cond_30a

    new-instance p1, Ld65;

    invoke-direct {p1, v4}, Ld65;-><init>(Ljava/lang/Throwable;)V

    iput-object p1, p0, Ljkh;->c:Ld65;

    iget-object p0, p0, Ljkh;->b:Lj9b;

    invoke-virtual {p0}, Lj9b;->close()V

    :cond_30a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_30d
    check-cast p0, Lpg5;

    check-cast p1, Landroid/content/res/Configuration;

    iget-object p0, p0, Lpg5;->e:Ljava/lang/Object;

    check-cast p0, Lojh;

    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    invoke-virtual {p0, p1}, Lojh;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31d
    check-cast p0, Lpt1;

    check-cast p1, Ljava/lang/Integer;

    iget-object v0, p0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/DialogTitle;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_33a
    check-cast p0, Lidh;

    check-cast p1, Ljdh;

    iget-object p1, p1, Ljdh;->a:Lidh;

    if-ne p1, p0, :cond_343

    move v2, v3

    :cond_343
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_348
    check-cast p0, Lmdh;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0}, Lmdh;->a()Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lmdh;->h:Lh42;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lmdh;->c:Lcul;

    invoke-virtual {p0}, Lcul;->e()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_35d
    check-cast p0, Lu89;

    check-cast p1, Lq0j;

    invoke-interface {p0}, Lu89;->invoke()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_388

    new-instance v0, Lo4h;

    invoke-interface {p0}, Lu89;->invoke()F

    move-result p0

    new-instance v1, Lh65;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v2}, Lh65;-><init>(F)V

    invoke-direct {v0, p0, v1}, Lo4h;-><init>(FLh65;)V

    sget-object p0, Lo0j;->a:[Lxtb;

    sget-object p0, Ln0j;->c:Lp0j;

    sget-object v1, Lo0j;->a:[Lxtb;

    aget-object v1, v1, v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p1, p0, v0}, Lq0j;->b(Lp0j;Ljava/lang/Object;)V

    :cond_388
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38b
    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Li72;

    invoke-virtual {p0, p1}, Li72;->addLast(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_397
    check-cast p0, Lq8h;

    check-cast p1, Lzf;

    iget-object p0, p0, Lq8h;->e:Lx79;

    new-instance v0, Lvvh;

    invoke-direct {v0, p1}, Lvvh;-><init>(Lzf;)V

    iget-object p0, p0, Lx79;->d:Ljava/lang/Object;

    check-cast p0, Lp04;

    invoke-interface {p0, v0}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3ac
    check-cast p0, Lxvh;

    check-cast p1, Ljava/lang/Throwable;

    iget-object p0, p0, Lxvh;->b:Lcd5;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lxob;->j0(Ljava/lang/Object;)Z

    return-object p1

    :pswitch_3b8
    check-cast p0, Lcd5;

    check-cast p1, Ljava/lang/Throwable;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lxob;->j0(Ljava/lang/Object;)Z

    return-object p1

    :pswitch_3c2
    check-cast p0, Lx79;

    iget-object p0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast p0, Li72;

    invoke-virtual {p0, p1}, Li72;->addLast(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3ce
    check-cast p0, Lbzg;

    move-object v0, p1

    check-cast v0, Ln6j;

    const/4 v5, 0x0

    const/16 v6, 0x38

    const/4 v1, 0x1

    const v2, 0x7f1404db

    const v3, 0x7f0a09b5

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x2

    const v2, 0x7f140f92

    const v3, 0x7f0a09a9

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v1, 0x3

    const v2, 0x7f140f9f

    const v3, 0x7f0a09af

    invoke-static/range {v0 .. v6}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    iget-object p1, p0, Lbzg;->e:Lxk;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p1, p0, Lbzg;->f:Ly5g;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p1, p0, Lbzg;->g:Lxoj;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p1, p0, Lbzg;->h:Lq9;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p1, p0, Lbzg;->i:Lq9;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p1, p0, Lbzg;->j:Luj;

    iget-char p1, p1, Lv6j;->a:C

    invoke-virtual {v0, p1}, Ln6j;->a(I)V

    iget-object p0, p0, Lbzg;->k:Lxoj;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {v0, p0}, Ln6j;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_429
    check-cast p0, Long;

    check-cast p1, Lt15;

    const-string v0, "type"

    sget-object v1, Lxhk;->b:Lcyg;

    invoke-static {p1, v0, v1}, Lt15;->b(Lt15;Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    const-string v0, "value"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v3, "kotlinx.serialization.Polymorphic<"

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Long;->a:Litb;

    check-cast v3, Ls15;

    invoke-virtual {v3}, Ls15;->c()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x3e

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lf2j;->b:Lf2j;

    new-array v2, v2, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-static {v1, v3, v2}, Lxug;->g(Ljava/lang/String;Lxvg;[Lkotlinx/serialization/descriptors/SerialDescriptor;)Ld2j;

    move-result-object v1

    sget-object v2, Ll08;->a:Ll08;

    invoke-virtual {p1, v0, v1, v2}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    iget-object p0, p0, Long;->b:Ljava/util/List;

    iput-object p0, p1, Lt15;->b:Ljava/util/List;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_465
    check-cast p0, Lsmg;

    check-cast p1, Landroid/view/MotionEvent;

    iget-object p0, p0, Lsmg;->b:Ldc1;

    if-eqz p0, :cond_46e

    move-object v4, p0

    :cond_46e
    invoke-virtual {v4, p1}, Ldc1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_474
    .packed-switch 0x0
        :pswitch_465
        :pswitch_429
        :pswitch_3ce
        :pswitch_3c2
        :pswitch_3b8
        :pswitch_3ac
        :pswitch_397
        :pswitch_38b
        :pswitch_35d
        :pswitch_348
        :pswitch_33a
        :pswitch_31d
        :pswitch_30d
        :pswitch_2df
        :pswitch_2cf
        :pswitch_2c7
        :pswitch_288
        :pswitch_27e
        :pswitch_270
        :pswitch_25a
        :pswitch_227
        :pswitch_1b8
        :pswitch_1a0
        :pswitch_18a
        :pswitch_169
        :pswitch_73
        :pswitch_3b
        :pswitch_32
        :pswitch_29
    .end packed-switch
.end method
