.class public final Ltl3;
.super Lo93;
.source "SourceFile"


# instance fields
.field public final synthetic c:B

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Ltl3;->c:B

    iput-object p1, p0, Ltl3;->d:Ljava/lang/Object;

    iput-object p2, p0, Ltl3;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 11
    iput-byte p4, p0, Ltl3;->c:B

    iput-object p2, p0, Ltl3;->d:Ljava/lang/Object;

    iput-object p3, p0, Ltl3;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkuj;Landroid/net/Uri;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Ltl3;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ltl3;->d:Ljava/lang/Object;

    iput-object p1, p0, Ltl3;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final e(Landroid/view/View;)Lgtj;
    .registers 7

    iget-byte v0, p0, Ltl3;->c:B

    const v1, 0x7f141364

    const/16 v2, 0x1388

    iget-object v3, p0, Ltl3;->e:Ljava/lang/Object;

    iget-object v4, p0, Ltl3;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_d0

    check-cast v4, Landroid/content/res/Resources;

    check-cast v3, Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object p0

    const v0, 0x7f140f3e

    invoke-virtual {v4, v0, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_22
    const v0, 0x7f141153

    invoke-static {p1, v0, v2}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p1

    check-cast v4, Landroid/net/Uri;

    new-instance v0, Lj5g;

    const/16 v2, 0x12

    invoke-direct {v0, p0, v4, v2}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v0}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p1

    :pswitch_36
    check-cast v4, Ljava/lang/String;

    const/16 p0, 0x9c4

    invoke-static {p1, v4, p0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f1412e1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    check-cast v3, Lpjg;

    new-instance v0, Lgf;

    const/16 v1, 0x1d

    invoke-direct {v0, v3, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Lgtj;->g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_56
    check-cast v4, Ljava/lang/String;

    invoke-static {p1, v4, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    check-cast v3, Ljava/lang/Runnable;

    new-instance p1, Ls53;

    const/4 v0, 0x1

    invoke-direct {p1, v3, v0}, Ls53;-><init>(Ljava/lang/Runnable;B)V

    const v0, 0x7f1411d1

    invoke-virtual {p0, v0, p1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_6b
    const p0, 0x7f140b10

    invoke-static {p1, p0, v2}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    check-cast v4, Ln3l;

    check-cast v3, Lcom/opera/android/BrowserActivity;

    new-instance p1, Lnf;

    const/16 v0, 0x15

    invoke-direct {p1, v4, v3, v0}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, p1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object p0

    :pswitch_81
    check-cast v4, Lul3;

    check-cast v3, Lpl3;

    iget-object p0, v4, Lul3;->c:Li53;

    check-cast p0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {p0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object p0

    invoke-interface {v3, p0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p0

    if-eqz p0, :cond_aa

    invoke-interface {p0}, Lml3;->h()Z

    move-result v0

    if-nez v0, :cond_aa

    invoke-interface {p0}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    new-instance v0, Lsxh;

    const v1, 0x7f140375

    invoke-direct {v0, v1, p0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto :goto_b2

    :cond_aa
    new-instance v0, Lrxh;

    const p0, 0x7f140374

    invoke-direct {v0, p0}, Lrxh;-><init>(I)V

    :goto_b2
    const/4 p0, 0x0

    invoke-static {p1, v0, v2, p0}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p0

    new-instance p1, Lnf;

    const/16 v0, 0x10

    invoke-direct {p1, v4, v3, v0}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x7f140634

    invoke-virtual {p0, v0, p1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    new-instance p1, Lsl3;

    invoke-direct {p1, v4}, Lsl3;-><init>(Lul3;)V

    iget-object v0, p0, Lgtj;->a:Lasj;

    invoke-virtual {v0, p1}, Lna3;->a(Lzrj;)V

    return-object p0

    nop

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_81
        :pswitch_6b
        :pswitch_56
        :pswitch_36
        :pswitch_22
    .end packed-switch
.end method
