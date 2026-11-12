.class public final synthetic Ley3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgy3;


# direct methods
.method public synthetic constructor <init>(Lgy3;B)V
    .registers 3

    iput-byte p2, p0, Ley3;->a:B

    iput-object p1, p0, Ley3;->b:Lgy3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Ley3;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Ley3;->b:Lgy3;

    packed-switch p1, :pswitch_data_58

    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Loy3;->k:Lg0c;

    new-array p1, v0, [I

    invoke-virtual {p0, p1}, Lg0c;->a([I)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Loy3;->d:Lg8j;

    iget-object p1, p0, Lg8j;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqim;

    iget-object p1, p1, Lqim;->c:Lz77;

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f1410bb

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "tab_disposition"

    invoke-static {v0, p0}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_3c
    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Loy3;->d:Lg8j;

    new-instance p1, Laak;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_4d
    invoke-virtual {p0}, Lgy3;->I0()Loy3;

    move-result-object p0

    iget-object p0, p0, Loy3;->i:Lmm6;

    invoke-virtual {p0}, Lmm6;->i()V

    return-void

    nop

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_3c
        :pswitch_14
    .end packed-switch
.end method
