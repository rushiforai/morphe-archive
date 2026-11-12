.class public final Ltg7;
.super Lo93;
.source "SourceFile"

# interfaces
.implements Lddn;


# instance fields
.field public final synthetic c:B

.field public d:I

.field public e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .registers 2

    .line 17
    const/4 v0, 0x0

    iput-byte v0, p0, Ltg7;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILtvk;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Ltg7;->c:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Ltg7;->d:I

    .line 16
    iput-object p2, p0, Ltg7;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwrl;I)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ltg7;->c:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Ltg7;->d:I

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ltg7;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget p0, p0, Ltg7;->d:I

    return p0
.end method

.method public final cancel()V
    .registers 3

    sget-object v0, Lhjm;->b:Lhjm;

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lo93;->b(Lhjm;I)V

    return-void
.end method

.method public final e(Landroid/view/View;)Lgtj;
    .registers 6

    iget-byte v0, p0, Ltg7;->c:B

    packed-switch v0, :pswitch_data_80

    const p0, 0x7f1413ed

    const v0, 0x7fffffff

    invoke-static {p1, p0, v0}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p0

    return-object p0

    :pswitch_10
    iget-object v0, p0, Ltg7;->e:Ljava/lang/Object;

    check-cast v0, Lwrl;

    iget v1, p0, Ltg7;->d:I

    iget-object v2, v0, Lwrl;->a:Landroid/content/res/Resources;

    iget-object v0, v0, Lwrl;->g:Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-eqz v1, :cond_40

    const/4 v3, 0x1

    if-eq v1, v3, :cond_38

    const/4 v3, 0x2

    if-eq v1, v3, :cond_30

    const/4 v3, 0x3

    if-eq v1, v3, :cond_28

    const-string v2, ""

    goto :goto_47

    :cond_28
    const v3, 0x7f14103a    # 1.9681E38f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_47

    :cond_30
    const v3, 0x7f140f50

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_47

    :cond_38
    const v3, 0x7f140fb9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_47

    :cond_40
    const v3, 0x7f141408

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    :goto_47
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v3, 0x7f1409c9

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/16 v2, 0x1388

    invoke-static {v0, p1, v2}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p1

    new-instance v2, Lg63;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v1, v3}, Lg63;-><init>(Ljava/lang/Object;IB)V

    const p0, 0x7f1410cd

    invoke-virtual {p1, p0, v2}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    invoke-virtual {p1, v0}, Lgtj;->b(Landroid/view/View;)V

    return-object p1

    :pswitch_6c
    const v0, 0x7f14060e

    const/4 v1, -0x2

    invoke-static {p1, v0, v1}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object p1

    invoke-virtual {p1}, Lgtj;->i()V

    iget v0, p0, Ltg7;->d:I

    invoke-virtual {p1, v0}, Lgtj;->h(I)V

    iput-object p1, p0, Ltg7;->e:Ljava/lang/Object;

    return-object p1

    nop

    :pswitch_data_80
    .packed-switch 0x0
        :pswitch_6c
        :pswitch_10
    .end packed-switch
.end method

.method public final f(I)V
    .registers 3

    iget-byte p1, p0, Ltg7;->c:B

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_16

    :pswitch_6
    return-void

    :pswitch_7
    iget-object p0, p0, Ltg7;->e:Ljava/lang/Object;

    check-cast p0, Ltvk;

    iget-object p0, p0, Ltvk;->a:Ljava/lang/Object;

    check-cast p0, Lcdn;

    iput-object v0, p0, Lcdn;->o:Lddn;

    return-void

    :pswitch_12
    iput-object v0, p0, Ltg7;->e:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_12
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method
