.class public final Leve;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltah;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Leve;->b:B

    .line 24
    const-class v0, Lnxc;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    .line 25
    iput-object p1, p0, Leve;->c:Ljava/lang/Object;

    .line 26
    iput-object p2, p0, Leve;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Luqe;Lvue;Lvue;Ldmg;)V
    .registers 12

    const/4 v0, 0x0

    iput-byte v0, p0, Leve;->b:B

    new-instance v1, Lr9i;

    const/16 v6, 0x16

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v1 .. v6}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class p1, Lj82;

    invoke-direct {p0, p1}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object v1, p0, Leve;->c:Ljava/lang/Object;

    iput-object v2, p0, Leve;->d:Ljava/lang/Object;

    return-void
.end method

.method private final t(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method

.method private final u(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    iget-byte p0, p0, Leve;->b:B

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 10

    iget-byte v0, p0, Leve;->b:B

    const/4 v1, 0x2

    iget-object v2, p0, Leve;->d:Ljava/lang/Object;

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_110

    check-cast v2, Ltah;

    const v0, 0x7f0d0457

    if-ne p2, v0, :cond_1f

    new-instance p0, Lkpf;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p1

    invoke-direct {p0, p1, v2, v3}, Lkpf;-><init>(Lowc;Ltah;B)V

    goto :goto_5d

    :cond_1f
    const v0, 0x7f0d0455

    if-ne p2, v0, :cond_34

    new-instance v0, Ljdn;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lhdn;

    invoke-direct {p2, p0, v4}, Lhdn;-><init>(Leve;B)V

    invoke-direct {v0, p1, v2, p2}, Ljdn;-><init>(Landroid/view/View;Ltah;Lhdn;)V

    :goto_32
    move-object p0, v0

    goto :goto_5d

    :cond_34
    const v0, 0x7f0d0454

    if-ne p2, v0, :cond_48

    new-instance v0, Lidn;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lhdn;

    invoke-direct {p2, p0, v3}, Lhdn;-><init>(Leve;B)V

    invoke-direct {v0, p1, v2, p2}, Lidn;-><init>(Landroid/view/View;Ltah;Lhdn;)V

    goto :goto_32

    :cond_48
    const v0, 0x7f0d0459

    if-ne p2, v0, :cond_5c

    new-instance v0, Lidn;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lhdn;

    invoke-direct {p2, p0, v1}, Lhdn;-><init>(Leve;B)V

    invoke-direct {v0, p1, v2, p2, v4}, Lidn;-><init>(Landroid/view/View;Ltah;Lhdn;B)V

    goto :goto_32

    :cond_5c
    const/4 p0, 0x0

    :goto_5d
    return-object p0

    :pswitch_5e
    check-cast v2, Luqe;

    const v0, 0x7f0d019a

    if-ne p2, v0, :cond_88

    new-instance v6, Lou8;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lmve;

    move p2, v1

    move-object v1, v2

    new-instance v2, Ldve;

    invoke-direct {v2, p0, v3}, Ldve;-><init>(Leve;B)V

    new-instance v3, Ldve;

    invoke-direct {v3, p0, p2}, Ldve;-><init>(Leve;B)V

    new-instance v4, Ldve;

    const/4 p2, 0x3

    invoke-direct {v4, p0, p2}, Ldve;-><init>(Leve;B)V

    const/4 v5, 0x0

    invoke-direct/range {v0 .. v5}, Lmve;-><init>(Luqe;Lfu8;Lylg;Ldmg;B)V

    invoke-direct {v6, v0, p1}, Lou8;-><init>(Lr9i;Landroid/view/View;)V

    goto/16 :goto_10f

    :cond_88
    move-object v1, v2

    const v0, 0x7f0d0199

    if-ne p2, v0, :cond_b3

    new-instance v6, Lov8;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p2, v1, Luqe;->w:Lyhe;

    new-instance v0, Lr9i;

    new-instance v2, Ldve;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v3}, Ldve;-><init>(Leve;B)V

    new-instance v3, Ldve;

    const/4 v4, 0x5

    invoke-direct {v3, p0, v4}, Ldve;-><init>(Leve;B)V

    new-instance v4, Ldve;

    const/4 v5, 0x6

    invoke-direct {v4, p0, v5}, Ldve;-><init>(Leve;B)V

    const/16 v5, 0x16

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, p1, p2, v0}, Lov8;-><init>(Landroid/view/View;Lyhe;Lr9i;)V

    goto :goto_10f

    :cond_b3
    const v0, 0x7f0d019d

    const/4 v3, 0x0

    if-ne p2, v0, :cond_d7

    new-instance v6, Ldx8;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lr9i;

    new-instance v2, Ldve;

    const/4 p2, 0x7

    invoke-direct {v2, p0, p2}, Ldve;-><init>(Leve;B)V

    new-instance v4, Ldve;

    const/16 p2, 0x8

    invoke-direct {v4, p0, p2}, Ldve;-><init>(Leve;B)V

    const/16 v5, 0x16

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v0, p1}, Ldx8;-><init>(Lr9i;Landroid/view/View;)V

    goto :goto_10f

    :cond_d7
    const v0, 0x7f0d0197

    if-ne p2, v0, :cond_fa

    new-instance v6, Lju8;

    invoke-static {p1, p2, v4}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lr9i;

    new-instance v2, Ldve;

    const/16 p2, 0x9

    invoke-direct {v2, p0, p2}, Ldve;-><init>(Leve;B)V

    move v5, v4

    new-instance v4, Ldve;

    invoke-direct {v4, p0, v5}, Ldve;-><init>(Leve;B)V

    const/16 v5, 0x16

    invoke-direct/range {v0 .. v5}, Lr9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v6, v0, p1}, Lou8;-><init>(Lr9i;Landroid/view/View;)V

    goto :goto_10f

    :cond_fa
    move v5, v4

    const v0, 0x7f0d0193

    if-eq v0, p2, :cond_102

    move-object v6, v3

    goto :goto_10f

    :cond_102
    new-instance v6, Lou8;

    invoke-static {p1, p2, v5}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Leve;->c:Ljava/lang/Object;

    check-cast p0, Lr9i;

    invoke-direct {v6, p0, p1}, Lou8;-><init>(Lr9i;Landroid/view/View;)V

    :goto_10f
    return-object v6

    :pswitch_data_110
    .packed-switch 0x0
        :pswitch_5e
    .end packed-switch
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget-byte p0, p0, Leve;->b:B

    packed-switch p0, :pswitch_data_60

    instance-of p0, p1, Lkxc;

    if-nez p0, :cond_25

    instance-of p0, p1, Ljxc;

    if-eqz p0, :cond_11

    const p0, 0x7f0d0455

    goto :goto_2a

    :cond_11
    instance-of p0, p1, Lixc;

    if-eqz p0, :cond_19

    const p0, 0x7f0d0454

    goto :goto_2a

    :cond_19
    instance-of p0, p1, Llxc;

    if-eqz p0, :cond_21

    const p0, 0x7f0d0459

    goto :goto_2a

    :cond_21
    instance-of p0, p1, Lmxc;

    if-eqz p0, :cond_29

    :cond_25
    const p0, 0x7f0d0457

    goto :goto_2a

    :cond_29
    const/4 p0, 0x0

    :goto_2a
    return p0

    :pswitch_2b
    check-cast p1, Lpue;

    iget-object p0, p1, Lj82;->c:Loqe;

    instance-of p1, p0, Ldre;

    if-eqz p1, :cond_37

    const p0, 0x7f0d019a

    goto :goto_5f

    :cond_37
    instance-of p1, p0, Lrre;

    if-eqz p1, :cond_46

    move-object p1, p0

    check-cast p1, Lrre;

    iget-boolean p1, p1, Lrre;->E:Z

    if-eqz p1, :cond_46

    const p0, 0x7f0d0199

    goto :goto_5f

    :cond_46
    instance-of p1, p0, Ld9i;

    if-eqz p1, :cond_4e

    const p0, 0x7f0d019d

    goto :goto_5f

    :cond_4e
    const-string p1, "podcast"

    iget-object p0, p0, Loqe;->c:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5c

    const p0, 0x7f0d0197

    goto :goto_5f

    :cond_5c
    const p0, 0x7f0d0193

    :goto_5f
    return p0

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method
