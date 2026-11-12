.class public final synthetic Ln9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lp9;


# direct methods
.method public synthetic constructor <init>(Lp9;B)V
    .registers 3

    iput-byte p2, p0, Ln9;->a:B

    iput-object p1, p0, Ln9;->b:Lp9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Ln9;->a:B

    iget-object p0, p0, Ln9;->b:Lp9;

    packed-switch p1, :pswitch_data_66

    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    iget-object p1, p0, Lg8j;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqim;

    iget-object p1, p1, Lqim;->c:Lz77;

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f140fc3

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "user_agent"

    invoke-static {v0, p0}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_31
    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    iget-object p0, p0, Lg8j;->b:Lgjm;

    new-instance p1, Lido;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_45
    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    iget-object p0, p0, Lt9;->d:Lbxk;

    invoke-virtual {p0}, Lbxk;->g()I

    move-result p1

    add-int/lit8 p1, p1, 0x5

    invoke-virtual {p0, p1}, Lbxk;->h(I)V

    return-void

    :pswitch_55
    invoke-virtual {p0}, Lp9;->I0()Lt9;

    move-result-object p0

    iget-object p0, p0, Lt9;->d:Lbxk;

    invoke-virtual {p0}, Lbxk;->g()I

    move-result p1

    add-int/lit8 p1, p1, -0x5

    invoke-virtual {p0, p1}, Lbxk;->h(I)V

    return-void

    nop

    :pswitch_data_66
    .packed-switch 0x0
        :pswitch_55
        :pswitch_45
        :pswitch_31
    .end packed-switch
.end method
