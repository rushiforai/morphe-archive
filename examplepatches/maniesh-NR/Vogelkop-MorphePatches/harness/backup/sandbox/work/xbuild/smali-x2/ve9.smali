.class public final synthetic Lve9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;Lt3g;Ls3g;Z)V
    .registers 6

    const/4 v0, 0x2

    iput-byte v0, p0, Lve9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lve9;->c:Ljava/lang/Object;

    iput-object p2, p0, Lve9;->d:Ljava/lang/Object;

    iput-object p3, p0, Lve9;->e:Ljava/lang/Object;

    iput-boolean p4, p0, Lve9;->b:Z

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lve9;->a:B

    iput-object p1, p0, Lve9;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lve9;->b:Z

    iput-object p3, p0, Lve9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lve9;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function2;)V
    .registers 6

    .line 16
    const/4 v0, 0x1

    iput-byte v0, p0, Lve9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lve9;->b:Z

    iput-object p2, p0, Lve9;->c:Ljava/lang/Object;

    iput-object p3, p0, Lve9;->d:Ljava/lang/Object;

    iput-object p4, p0, Lve9;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 16

    iget-byte v0, p0, Lve9;->a:B

    const/16 v1, 0x191

    const/4 v2, 0x1

    iget-boolean v3, p0, Lve9;->b:Z

    iget-object v4, p0, Lve9;->e:Ljava/lang/Object;

    iget-object v5, p0, Lve9;->d:Ljava/lang/Object;

    iget-object v6, p0, Lve9;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1be

    check-cast v6, Lbf9;

    check-cast v5, Lvz;

    check-cast v4, Lzzh;

    check-cast p1, Lq43;

    iget-object p0, v6, Lbf9;->p:Lmgh;

    const/4 v11, 0x0

    iput-object v11, v6, Lbf9;->p:Lmgh;

    iget v0, p1, Lq43;->a:I

    iget-object v9, p1, Lq43;->b:Ljava/lang/String;

    const/16 p1, 0x190

    if-ne v0, v1, :cond_2d

    if-eqz v3, :cond_29

    if-nez p0, :cond_59

    :cond_29
    invoke-virtual {v6}, Lbf9;->N()V

    goto :goto_70

    :cond_2d
    invoke-virtual {v6}, Lbf9;->r()I

    move-result v1

    const/4 v7, 0x2

    if-lt v1, v7, :cond_53

    const/4 p0, -0x3

    if-ne v0, p0, :cond_70

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_70

    iget-object v8, v6, Lbf9;->e:Lle9;

    new-instance v10, Lrl;

    const/4 p0, 0x4

    invoke-direct {v10, p0}, Lrl;-><init>(B)V

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lws1;

    const/16 v12, 0x10

    invoke-direct/range {v7 .. v12}, Lws1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v7, v11}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    goto :goto_70

    :cond_53
    if-eqz v3, :cond_70

    if-eqz p0, :cond_70

    if-ne v0, p1, :cond_70

    :cond_59
    new-instance p1, Lexl;

    new-instance v0, Lzwl;

    invoke-direct {v0, v6, v5, v4, v2}, Lzwl;-><init>(Lbf9;Lvz;Lzzh;B)V

    invoke-direct {p1, v0, v4}, Lexl;-><init>(Ldxl;Lcom/opera/api/Callback;)V

    iput-object p1, p0, Lmgh;->b:Ljava/lang/Object;

    iget-object v0, v6, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Lbf9;->N()V

    iput-object p0, v6, Lbf9;->p:Lmgh;

    goto :goto_82

    :cond_70
    :goto_70
    if-ne v0, p1, :cond_7d

    const-string p0, "Invalid group"

    invoke-virtual {v9, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7d

    sget-object p0, Lixl;->c:Lixl;

    goto :goto_7f

    :cond_7d
    sget-object p0, Lixl;->b:Lixl;

    :goto_7f
    invoke-virtual {v4, p0}, Lzzh;->run(Ljava/lang/Object;)V

    :goto_82
    return-void

    :pswitch_83
    check-cast v6, Lvqi;

    move-object v8, v5

    check-cast v8, Liqi;

    move-object v9, v4

    check-cast v9, Ls4f;

    check-cast p1, Ljava/util/List;

    iget-object v0, v6, Lvqi;->b:Lsqi;

    new-instance v5, Lha1;

    const/4 v10, 0x3

    iget-boolean v7, p0, Lve9;->b:Z

    invoke-direct/range {v5 .. v10}, Lha1;-><init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lzg;

    iget-object v1, v0, Lsqi;->a:Llld;

    iget-object v2, v0, Lsqi;->h:Ltvk;

    iget-object v3, v0, Lsqi;->m:Llv1;

    new-instance v4, Lf23;

    const/16 v6, 0xd

    invoke-direct {v4, v5, v0, p1, v6}, Lf23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v1, v2, v3, v4}, Lzg;-><init>(Llld;Ltvk;Llv1;Lf23;)V

    return-void

    :pswitch_aa
    move-object v8, v6

    check-cast v8, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    check-cast v5, Lt3g;

    move-object v10, v4

    check-cast v10, Ls3g;

    iget-object p0, v10, Ls3g;->a:Ljava/lang/String;

    check-cast p1, Ltw7;

    sget v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    instance-of v0, p1, Lrw7;

    if-eqz v0, :cond_c6

    check-cast p1, Lrw7;

    iget-object p0, p1, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Lcd6;

    invoke-virtual {v8}, Landroid/app/Activity;->finish()V

    goto :goto_12e

    :cond_c6
    instance-of v0, p1, Lsw7;

    if-eqz v0, :cond_12b

    check-cast p1, Lsw7;

    iget-object p1, p1, Lsw7;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, v10, Ls3g;->d:Ljava/lang/String;

    if-eqz p0, :cond_ee

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ee

    if-eqz p1, :cond_ee

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_ee

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_ee

    invoke-interface {v5, v10}, Lt3g;->remove(Ljava/lang/Object;)V

    :cond_ee
    invoke-virtual {v8}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->u()Lxu2;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    iget-object p0, p0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object p0, p0, Lxv1;->m:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltv1;

    if-eqz v3, :cond_109

    const p1, 0x7f1402c8

    invoke-virtual {v8, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_107
    move-object v9, p1

    goto :goto_111

    :cond_109
    const p1, 0x7f1402c7

    invoke-virtual {v8, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_107

    :goto_111
    new-instance v11, Lrxh;

    const p1, 0x7f140bbb

    invoke-direct {v11, p1}, Lrxh;-><init>(I)V

    new-instance v13, Lvif;

    invoke-direct {v13, v8, v2}, Lvif;-><init>(Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lev2;

    const/4 v12, 0x0

    invoke-direct/range {v7 .. v13}, Lev2;-><init>(Landroid/content/Context;Ljava/lang/String;Ls3g;Lrxh;Lrxh;Lav2;)V

    invoke-virtual {v7}, Landroid/app/Dialog;->show()V

    goto :goto_12e

    :cond_12b
    invoke-static {}, Lh9o;->p()V

    :goto_12e
    return-void

    :pswitch_12f
    check-cast v6, Lkotlin/jvm/functions/Function1;

    check-cast v5, Lkotlin/jvm/functions/Function0;

    check-cast v4, Lkotlin/jvm/functions/Function2;

    check-cast p1, Lakc;

    sget-object p0, Lxjc;->a:Lxjc;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    const-string v0, ""

    if-eqz p0, :cond_150

    if-eqz v3, :cond_14c

    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18a

    :cond_14c
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_18a

    :cond_150
    instance-of p0, p1, Lzjc;

    if-eqz p0, :cond_163

    if-eqz v3, :cond_15a

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_18a

    :cond_15a
    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18a

    :cond_163
    instance-of p0, p1, Lyjc;

    if-eqz p0, :cond_176

    if-eqz v3, :cond_172

    new-instance p0, Ljava/lang/IllegalStateException;

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18a

    :cond_172
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_18a

    :cond_176
    instance-of p0, p1, Lwjc;

    if-eqz p0, :cond_187

    check-cast p1, Lwjc;

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    iget-object p1, p1, Lwjc;->b:Ljava/lang/String;

    invoke-interface {v4, p0, p1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_18a

    :cond_187
    invoke-static {}, Lh9o;->p()V

    :goto_18a
    return-void

    :pswitch_18b
    check-cast v6, Lbf9;

    check-cast v5, Ljava/lang/String;

    check-cast v4, Laz4;

    check-cast p1, Lq43;

    iget-object p0, v6, Lbf9;->y:Lmgh;

    const/4 v0, 0x0

    iput-object v0, v6, Lbf9;->y:Lmgh;

    iget p1, p1, Lq43;->a:I

    if-ne p1, v1, :cond_1ba

    if-eqz v3, :cond_1b7

    if-eqz p0, :cond_1b7

    new-instance p1, Lexl;

    new-instance v0, Lte9;

    invoke-direct {v0, v6, v5, v4, v2}, Lte9;-><init>(Lbf9;Ljava/lang/String;Laz4;B)V

    invoke-direct {p1, v0, v4}, Lexl;-><init>(Ldxl;Lcom/opera/api/Callback;)V

    iput-object p1, p0, Lmgh;->b:Ljava/lang/Object;

    iget-object v0, v6, Lbf9;->g:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Lbf9;->N()V

    iput-object p0, v6, Lbf9;->y:Lmgh;

    goto :goto_1bd

    :cond_1b7
    invoke-virtual {v6}, Lbf9;->N()V

    :cond_1ba
    invoke-virtual {v4, v0}, Laz4;->run(Ljava/lang/Object;)V

    :goto_1bd
    return-void

    :pswitch_data_1be
    .packed-switch 0x0
        :pswitch_18b
        :pswitch_12f
        :pswitch_aa
        :pswitch_83
    .end packed-switch
.end method
