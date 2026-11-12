.class public final Lhx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lea2;


# instance fields
.field public final synthetic a:B

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lhx;->a:B

    packed-switch p1, :pswitch_data_14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void

    :pswitch_9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lhx;->b:Ljava/lang/Object;

    return-void

    :pswitch_data_14
    .packed-switch 0x7
        :pswitch_9
    .end packed-switch
.end method

.method public synthetic constructor <init>(Lkze;B)V
    .registers 3

    .line 20
    iput-byte p2, p0, Lhx;->a:B

    iput-object p1, p0, Lhx;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lea2;)V
    .registers 2

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 7

    iget-byte v0, p0, Lhx;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_ee

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_10
    if-ge v3, v0, :cond_21

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Lea2;

    invoke-interface {v1, p1, p2}, Lea2;->k(Landroid/view/ViewGroup;I)Lab2;

    move-result-object v1

    if-eqz v1, :cond_10

    move-object v2, v1

    :cond_21
    return-object v2

    :pswitch_22
    const v0, 0x7f0d0176

    if-eq p2, v0, :cond_31

    const v0, 0x7f0d0174

    if-eq p2, v0, :cond_31

    const v0, 0x7f0d0175

    if-ne p2, v0, :cond_3e

    :cond_31
    new-instance v2, Lmx;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-direct {v2, p1, p0, v1}, Lmx;-><init>(Landroid/view/View;Lkze;B)V

    :cond_3e
    return-object v2

    :pswitch_3f
    const v0, 0x7f0d0173

    if-ne p2, v0, :cond_52

    new-instance v2, Lix;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    const/4 p2, 0x2

    invoke-direct {v2, p1, p0, p2}, Lix;-><init>(Landroid/view/View;Lize;B)V

    :cond_52
    return-object v2

    :pswitch_53
    const v0, 0x7f0d016d

    if-eq p2, v0, :cond_62

    const v0, 0x7f0d016b

    if-eq p2, v0, :cond_62

    const v0, 0x7f0d016c

    if-ne p2, v0, :cond_6f

    :cond_62
    new-instance v2, Leu9;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-direct {v2, p1, p0}, Leu9;-><init>(Landroid/view/View;Lkze;)V

    :cond_6f
    return-object v2

    :pswitch_70
    const v0, 0x7f0d016a

    if-eq p2, v0, :cond_7f

    const v0, 0x7f0d0169

    if-eq p2, v0, :cond_7f

    const v0, 0x7f0d0168

    if-ne p2, v0, :cond_a9

    :cond_7f
    new-instance v2, Lso8;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    new-instance p2, Lto8;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-direct {v2, p1, p2, p0}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    new-instance p0, Lzo8;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p0, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    new-instance p2, Ld06;

    invoke-direct {p2, p1}, Ld06;-><init>(Ljava/lang/Object;)V

    const-string p1, "http://localhost:8082/image"

    iget-object v0, v2, Lxv8;->k:Lga6;

    invoke-static {p1, p0, v0, v3, p2}, Lgu8;->h0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;ZLd94;)V

    invoke-virtual {v2, p0}, Lxv8;->h0(Landroid/view/View;)V

    :cond_a9
    return-object v2

    :pswitch_aa
    const v0, 0x7f0d0167

    if-ne p2, v0, :cond_bc

    new-instance v2, Lix;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-direct {v2, p1, p0, v1}, Lix;-><init>(Landroid/view/View;Lize;B)V

    :cond_bc
    return-object v2

    :pswitch_bd
    const v0, 0x7f0d014d

    if-eq p2, v0, :cond_cc

    const v0, 0x7f0d014b

    if-eq p2, v0, :cond_cc

    const v0, 0x7f0d014c

    if-ne p2, v0, :cond_d9

    :cond_cc
    new-instance v2, Lmx;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-direct {v2, p1, p0, v3}, Lmx;-><init>(Landroid/view/View;Lkze;B)V

    :cond_d9
    return-object v2

    :pswitch_da
    const v0, 0x7f0d0148

    if-ne p2, v0, :cond_ec

    new-instance v2, Lix;

    invoke-static {p1, p2, v3}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-direct {v2, p1, p0, v3}, Lix;-><init>(Landroid/view/View;Lize;B)V

    :cond_ec
    return-object v2

    nop

    :pswitch_data_ee
    .packed-switch 0x0
        :pswitch_da
        :pswitch_bd
        :pswitch_aa
        :pswitch_70
        :pswitch_53
        :pswitch_3f
        :pswitch_22
    .end packed-switch
.end method

.method public final q(Lja2;ILca2;)I
    .registers 8

    iget-byte v0, p0, Lhx;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_a8

    iget-object p0, p0, Lhx;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v2

    :cond_10
    if-ge v1, v0, :cond_21

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lea2;

    invoke-interface {v3, p1, p2, p3}, Lea2;->q(Lja2;ILca2;)I

    move-result v3

    if-eqz v3, :cond_10

    move v2, v3

    :cond_21
    return v2

    :pswitch_22
    instance-of p0, p1, Linf;

    if-eqz p0, :cond_39

    iget-byte p0, p3, Lca2;->b:B

    if-le p0, v1, :cond_2e

    const v2, 0x7f0d0175

    goto :goto_39

    :cond_2e
    iget-boolean p0, p3, Lca2;->a:Z

    if-eqz p0, :cond_36

    const v2, 0x7f0d0176

    goto :goto_39

    :cond_36
    const v2, 0x7f0d0174

    :cond_39
    :goto_39
    return v2

    :pswitch_3a
    instance-of p0, p1, Lfjf;

    if-eqz p0, :cond_41

    const v2, 0x7f0d0173

    :cond_41
    return v2

    :pswitch_42
    instance-of p0, p1, Lvkf;

    if-eqz p0, :cond_59

    iget-byte p0, p3, Lca2;->b:B

    if-le p0, v1, :cond_4e

    const v2, 0x7f0d016c

    goto :goto_59

    :cond_4e
    iget-boolean p0, p3, Lca2;->a:Z

    if-eqz p0, :cond_56

    const v2, 0x7f0d016d

    goto :goto_59

    :cond_56
    const v2, 0x7f0d016b

    :cond_59
    :goto_59
    return v2

    :pswitch_5a
    instance-of p0, p1, Lro8;

    if-eqz p0, :cond_7e

    check-cast p1, Lro8;

    iget-object p0, p1, Lro8;->p:Lbp8;

    iget-object p0, p0, Lbp8;->u:Lap8;

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_7b

    if-eq p0, v1, :cond_77

    const/4 p1, 0x2

    if-ne p0, p1, :cond_73

    const v2, 0x7f0d0168

    goto :goto_7e

    :cond_73
    invoke-static {}, Lh9o;->p()V

    goto :goto_7e

    :cond_77
    const v2, 0x7f0d0169

    goto :goto_7e

    :cond_7b
    const v2, 0x7f0d016a

    :cond_7e
    :goto_7e
    return v2

    :pswitch_7f
    instance-of p0, p1, Lpo8;

    if-eqz p0, :cond_86

    const v2, 0x7f0d0167

    :cond_86
    return v2

    :pswitch_87
    instance-of p0, p1, Ljo;

    if-eqz p0, :cond_9e

    iget-byte p0, p3, Lca2;->b:B

    if-le p0, v1, :cond_93

    const v2, 0x7f0d014c

    goto :goto_9e

    :cond_93
    iget-boolean p0, p3, Lca2;->a:Z

    if-eqz p0, :cond_9b

    const v2, 0x7f0d014d

    goto :goto_9e

    :cond_9b
    const v2, 0x7f0d014b

    :cond_9e
    :goto_9e
    return v2

    :pswitch_9f
    instance-of p0, p1, Lco;

    if-eqz p0, :cond_a6

    const v2, 0x7f0d0148

    :cond_a6
    return v2

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_9f
        :pswitch_87
        :pswitch_7f
        :pswitch_5a
        :pswitch_42
        :pswitch_3a
        :pswitch_22
    .end packed-switch
.end method
