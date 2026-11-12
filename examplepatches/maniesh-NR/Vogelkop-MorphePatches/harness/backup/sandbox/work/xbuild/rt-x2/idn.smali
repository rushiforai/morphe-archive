.class public final Lidn;
.super Lf73;
.source "SourceFile"


# instance fields
.field public final synthetic h:B

.field public final i:Landroid/content/res/Resources;

.field public j:Lfdn;

.field public k:Lac1;

.field public final l:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Landroid/view/View;Ltah;Lhdn;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lidn;->h:B

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lf73;-><init>(Lowc;Ltah;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lidn;->i:Landroid/content/res/Resources;

    iput-object p3, p0, Lidn;->l:Lcom/opera/api/Callback;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Ltah;Lhdn;B)V
    .registers 5

    const/4 p4, 0x1

    iput-byte p4, p0, Lidn;->h:B

    .line 19
    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p4

    invoke-direct {p0, p4, p2}, Lf73;-><init>(Lowc;Ltah;)V

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lidn;->i:Landroid/content/res/Resources;

    .line 21
    iput-object p3, p0, Lidn;->l:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 14

    iget-byte v0, p0, Lidn;->h:B

    const v1, 0x7f0402d7

    const v2, 0x7f0407da

    iget-object v3, p0, Lf73;->e:Ltah;

    iget-object v4, p0, Lidn;->i:Landroid/content/res/Resources;

    packed-switch v0, :pswitch_data_9a

    if-nez p2, :cond_56

    check-cast p1, Lnxc;

    iget-object p1, p1, Lnxc;->b:Lfdn;

    iput-object p1, p0, Lidn;->j:Lfdn;

    iget-object v6, p1, Lfdn;->c:Ljava/lang/String;

    const p1, 0x7f141381

    invoke-virtual {v4, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    iget-object p1, p0, Lidn;->j:Lfdn;

    iget-object p1, p1, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x1

    if-le p1, p2, :cond_4a

    iget-object p1, v3, Ltah;->d:Ljava/lang/Object;

    check-cast p1, Lydn;

    iget-object p1, p1, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_3c

    move v1, v2

    :cond_3c
    new-instance p1, Lpkm;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, Lpkm;-><init>(Ljava/lang/Object;B)V

    const p2, 0x7f08051f

    move v8, p2

    move v9, v1

    :goto_48
    move-object v10, p1

    goto :goto_4f

    :cond_4a
    const/4 v1, 0x0

    const/4 p1, 0x0

    move v8, v1

    move v9, v8

    goto :goto_48

    :goto_4f
    new-instance v5, Lac1;

    invoke-direct/range {v5 .. v10}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v5, p0, Lidn;->k:Lac1;

    :cond_56
    return-void

    :pswitch_57
    if-nez p2, :cond_99

    check-cast p1, Lixc;

    iget-object p1, p1, Lnxc;->b:Lfdn;

    iput-object p1, p0, Lidn;->j:Lfdn;

    iget-object p2, p1, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    iget-object v6, p1, Lfdn;->c:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v5, 0x7f12000d

    invoke-virtual {v4, v5, p2, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    iget-object p2, v3, Ltah;->d:Ljava/lang/Object;

    check-cast p2, Lydn;

    iget-object p2, p2, Lydn;->c:Lgfn;

    invoke-interface {p2}, Lgfn;->isEnabled()Z

    move-result p2

    if-eqz p2, :cond_88

    move v9, v2

    goto :goto_89

    :cond_88
    move v9, v1

    :goto_89
    new-instance v10, Lobn;

    const/4 p2, 0x3

    invoke-direct {v10, p0, p1, p2}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lac1;

    const v8, 0x7f08051f

    invoke-direct/range {v5 .. v10}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v5, p0, Lidn;->k:Lac1;

    :cond_99
    return-void

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_57
    .end packed-switch
.end method

.method public final b0()Lac1;
    .registers 2

    iget-byte v0, p0, Lidn;->h:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lidn;->k:Lac1;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lidn;->k:Lac1;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final c0()Lfdn;
    .registers 2

    iget-byte v0, p0, Lidn;->h:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lidn;->j:Lfdn;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lidn;->j:Lfdn;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
