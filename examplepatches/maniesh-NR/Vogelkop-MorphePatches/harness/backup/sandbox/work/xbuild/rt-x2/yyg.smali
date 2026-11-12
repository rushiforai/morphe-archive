.class public final synthetic Lyyg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lazg;


# direct methods
.method public synthetic constructor <init>(Lazg;B)V
    .registers 3

    iput-byte p2, p0, Lyyg;->a:B

    iput-object p1, p0, Lyyg;->b:Lazg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lyyg;->a:B

    const/4 v0, 0x2

    const/4 v1, 0x0

    iget-object p0, p0, Lyyg;->b:Lazg;

    packed-switch p1, :pswitch_data_ce

    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lhzg;->e:Lrj;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lrj;->a([I)V

    return-void

    :pswitch_15
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Le35;->H0(I)Le35;

    move-result-object p1

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_30
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    new-instance p1, Ln35;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_43
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lhzg;->d:Lben;

    new-array p1, v1, [I

    invoke-virtual {p0, p1}, Lben;->a([I)V

    return-void

    :pswitch_4f
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lxvi;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lxvi;-><init>(Loba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_6c
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    new-array p1, v1, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lpb6;

    new-instance v3, Loba;

    invoke-direct {v3, v0, v1, p1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v1, v3}, Lpb6;-><init>(ZLoba;)V

    iget-object p0, p0, Lg8j;->b:Lgjm;

    invoke-virtual {p0, v2, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_89
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lj93;->c:Ld8j;

    check-cast p0, Lg8j;

    iget-object p1, p0, Lg8j;->c:Ldu3;

    invoke-virtual {p1}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqim;

    iget-object p1, p1, Lqim;->c:Lz77;

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    const v0, 0x7f1404db

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "accept_cookies"

    invoke-static {v0, p0}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, v0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_b3
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lhzg;->g:Lqoj;

    iget-object p0, p0, Lqoj;->b:Lgjm;

    new-instance p1, Lmoj;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_c4
    invoke-virtual {p0}, Lazg;->I0()Lhzg;

    move-result-object p0

    iget-object p0, p0, Lhzg;->f:Lsyl;

    invoke-virtual {p0}, Lsyl;->a()V

    return-void

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_c4
        :pswitch_b3
        :pswitch_89
        :pswitch_6c
        :pswitch_4f
        :pswitch_43
        :pswitch_30
        :pswitch_15
    .end packed-switch
.end method
