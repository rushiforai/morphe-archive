.class public final Lnzb;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ltah;


# direct methods
.method public constructor <init>(Ltah;B)V
    .registers 3

    iput-byte p2, p0, Lnzb;->b:B

    packed-switch p2, :pswitch_data_1e

    const-class p2, Lkzb;

    invoke-direct {p0, p2}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lnzb;->c:Ltah;

    return-void

    :pswitch_d
    const-class p2, Lxxc;

    invoke-direct {p0, p2}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lnzb;->c:Ltah;

    return-void

    :pswitch_15
    const-class p2, Lqmf;

    invoke-direct {p0, p2}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lnzb;->c:Ltah;

    return-void

    nop

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_15
        :pswitch_d
    .end packed-switch
.end method

.method private final t(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method

.method private final u(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method

.method private final w(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method

.method public static y(Ljava/lang/String;Lrcd;)Ljava/lang/CharSequence;
    .registers 5

    if-nez p1, :cond_3

    return-object p0

    :cond_3
    iget-object p1, p1, Lrcd;->a:Landroid/util/Pair;

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    new-instance p0, Landroid/text/style/StyleSpan;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/16 v2, 0x21

    invoke-virtual {v0, p0, v1, p1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    iget-byte p0, p0, Lnzb;->b:B

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 6

    iget-byte v0, p0, Lnzb;->b:B

    const/4 v1, 0x0

    iget-object p0, p0, Lnzb;->c:Ltah;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_54

    const v0, 0x7f0d0458

    if-ne p2, v0, :cond_1d

    new-instance v1, Lkpf;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p1

    const/4 p2, 0x3

    invoke-direct {v1, p1, p0, p2}, Lkpf;-><init>(Lowc;Ltah;B)V

    goto :goto_30

    :cond_1d
    const v0, 0x7f0d0456

    if-ne p2, v0, :cond_30

    new-instance v1, Lkpf;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p1

    const/4 p2, 0x2

    invoke-direct {v1, p1, p0, p2}, Lkpf;-><init>(Lowc;Ltah;B)V

    :cond_30
    :goto_30
    return-object v1

    :pswitch_31
    const v0, 0x7f0d0465

    if-ne p2, v0, :cond_43

    new-instance v1, Lkpf;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p1

    invoke-direct {v1, p1, p0, v2}, Lkpf;-><init>(Lowc;Ltah;B)V

    :cond_43
    return-object v1

    :pswitch_44
    const v0, 0x7f0d0466

    if-ne p2, v0, :cond_52

    new-instance v1, Lmzb;

    invoke-static {p1, p2, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {v1, p1, p0}, Lmzb;-><init>(Landroid/view/View;Ltah;)V

    :cond_52
    return-object v1

    nop

    :pswitch_data_54
    .packed-switch 0x0
        :pswitch_44
        :pswitch_31
    .end packed-switch
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget-byte p0, p0, Lnzb;->b:B

    const/4 p2, 0x0

    packed-switch p0, :pswitch_data_26

    instance-of p0, p1, Lwxc;

    if-eqz p0, :cond_e

    const p2, 0x7f0d0458

    goto :goto_15

    :cond_e
    instance-of p0, p1, Lvxc;

    if-eqz p0, :cond_15

    const p2, 0x7f0d0456

    :cond_15
    :goto_15
    return p2

    :pswitch_16
    instance-of p0, p1, Lqmf;

    if-eqz p0, :cond_1d

    const p2, 0x7f0d0465

    :cond_1d
    return p2

    :pswitch_1e
    instance-of p0, p1, Lkzb;

    if-eqz p0, :cond_25

    const p2, 0x7f0d0466

    :cond_25
    return p2

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_1e
        :pswitch_16
    .end packed-switch
.end method
