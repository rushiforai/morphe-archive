.class public final synthetic Ltt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ltt2;->a:B

    iput p1, p0, Ltt2;->b:I

    iput-object p2, p0, Ltt2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 10
    iput-byte p3, p0, Ltt2;->a:B

    iput-object p1, p0, Ltt2;->c:Ljava/lang/Object;

    iput p2, p0, Ltt2;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Ltt2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v3, p0, Ltt2;->b:I

    iget-object p0, p0, Ltt2;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e6

    check-cast p0, Lqln;

    check-cast p1, Laln;

    iget-object p0, p0, Lqln;->d:Lonn;

    sget-object v0, Liu0;->b:Liu0;

    invoke-virtual {p0, p1, v3, v0}, Lonn;->c(Laln;ILiu0;)V

    invoke-virtual {p0}, Lonn;->a()V

    return-void

    :pswitch_1a
    check-cast p0, Lagm;

    check-cast p1, Ldwh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljkn;->a:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    iget-object v0, p1, Ldwh;->b:Lgvh;

    invoke-virtual {v0, v3, v3}, Lgvh;->b(II)V

    invoke-virtual {p1}, Ldwh;->b()V

    invoke-virtual {p1}, Ldwh;->j()V

    iget-object p0, p0, Lagm;->c:Ljava/lang/Object;

    check-cast p0, Lnb9;

    invoke-virtual {v0, p0}, Lgvh;->c(Le2m;)V

    return-void

    :pswitch_39
    check-cast p0, Lbg7;

    check-cast p1, Landroid/view/View;

    sget-object p1, Lhjm;->a:Lhjm;

    invoke-virtual {p0, p1}, Ld63;->finish(Lhjm;)V

    iget-object p1, p0, Lbg7;->b:Ljava/lang/Object;

    check-cast p1, Lydn;

    invoke-virtual {p1, v2}, Lydn;->C(Z)V

    invoke-virtual {p0}, Lbg7;->d()V

    if-eqz v3, :cond_5e

    const-string p0, "https://support-vpn-pro.opera.com/"

    sget-object p1, Llqm;->v:Llqm;

    invoke-static {p0, p1, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    const/4 p1, 0x3

    iput p1, p0, Lvx3;->b:I

    const/4 p1, 0x1

    invoke-static {p0, p1, p0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    :cond_5e
    throw v1

    :pswitch_5f
    check-cast p0, Lvr3;

    iget v0, p0, Lvr3;->a:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lvr3;->a:I

    iget-object v0, p0, Lvr3;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v3, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-boolean p1, p0, Lvr3;->b:Z

    if-eqz p1, :cond_81

    iget p1, p0, Lvr3;->a:I

    if-nez p1, :cond_81

    iget-object p0, p0, Lvr3;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :cond_81
    return-void

    :pswitch_82
    check-cast p0, Lg77;

    iget-object v0, p0, Lg77;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v3, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lg77;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_ab

    :cond_a2
    iget-object p0, p0, Lg77;->a:Ljava/lang/Object;

    check-cast p0, Lwx;

    if-eqz p0, :cond_ab

    invoke-virtual {p0, v0}, Lwx;->run(Ljava/lang/Object;)V

    :cond_ab
    return-void

    :pswitch_ac
    check-cast p0, Lcom/opera/api/Callback;

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_ba

    invoke-static {p1, v2, v3}, Lyni;->a(Landroid/graphics/Bitmap;II)Lyni;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_bd

    :cond_ba
    invoke-interface {p0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    :goto_bd
    return-void

    :pswitch_be
    check-cast p0, Lhu2;

    check-cast p1, La4g;

    invoke-virtual {p1, v3}, La4g;->b(I)Lw3g;

    move-result-object v0

    if-eqz v0, :cond_d1

    iget-object p0, p0, Lhu2;->d:Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {p1, v0}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->G(Lw3g;Ljava/lang/String;)V

    :cond_d1
    return-void

    :pswitch_d2
    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    check-cast p1, La4g;

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p1, v3}, La4g;->b(I)Lw3g;

    move-result-object v0

    if-eqz v0, :cond_e5

    invoke-virtual {p1, v0}, La4g;->c(Lw3g;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->G(Lw3g;Ljava/lang/String;)V

    :cond_e5
    return-void

    :pswitch_data_e6
    .packed-switch 0x0
        :pswitch_d2
        :pswitch_be
        :pswitch_ac
        :pswitch_82
        :pswitch_5f
        :pswitch_39
        :pswitch_1a
    .end packed-switch
.end method
