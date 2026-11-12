.class public final Lavc;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Class;)V
    .registers 3

    .line 11
    const/4 v0, 0x0

    iput-byte v0, p0, Lavc;->b:B

    invoke-direct {p0, p1}, Lba2;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(Lwse;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lavc;->b:B

    const-class v0, Lewc;

    invoke-direct {p0, v0}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lavc;->c:Ljava/lang/Object;

    return-void
.end method

.method private final t(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 4

    iget-byte v0, p0, Lavc;->b:B

    packed-switch v0, :pswitch_data_1a

    return-void

    :pswitch_6
    if-nez p1, :cond_19

    iget-object p1, p0, Lavc;->c:Ljava/lang/Object;

    check-cast p1, Lxuc;

    const/4 v0, 0x0

    if-nez p1, :cond_16

    new-instance p1, Lxuc;

    invoke-direct {p1, v0}, Lia2;-><init>(B)V

    iput-object p1, p0, Lavc;->c:Ljava/lang/Object;

    :cond_16
    invoke-virtual {p2, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_19
    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 5

    iget-byte p0, p0, Lavc;->b:B

    const/4 v0, 0x0

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_56

    const p0, 0x7f0d0249

    if-ne p2, p0, :cond_17

    new-instance v0, Lhwc;

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x1

    invoke-direct {v0, p0, p1}, Lhwc;-><init>(Landroid/view/View;B)V

    goto :goto_45

    :cond_17
    const p0, 0x7f0d024d

    if-ne p2, p0, :cond_27

    new-instance v0, Lhwc;

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x3

    invoke-direct {v0, p0, p1}, Lhwc;-><init>(Landroid/view/View;B)V

    goto :goto_45

    :cond_27
    const p0, 0x7f0d024c

    if-ne p2, p0, :cond_37

    new-instance v0, Lhwc;

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x2

    invoke-direct {v0, p0, p1}, Lhwc;-><init>(Landroid/view/View;B)V

    goto :goto_45

    :cond_37
    const p0, 0x7f0d0248

    if-ne p2, p0, :cond_45

    new-instance v0, Lhwc;

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v0, p0, v1}, Lhwc;-><init>(Landroid/view/View;B)V

    :cond_45
    :goto_45
    return-object v0

    :pswitch_46
    const p0, 0x7f0d01a8

    if-ne p2, p0, :cond_54

    new-instance v0, Lzuc;

    invoke-static {p1, p2, v1}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p0

    invoke-direct {v0, p0}, Lzuc;-><init>(Landroid/view/View;)V

    :cond_54
    return-object v0

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_46
    .end packed-switch
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    iget-byte p0, p0, Lavc;->b:B

    packed-switch p0, :pswitch_data_2c

    instance-of p0, p1, Liwc;

    if-eqz p0, :cond_d

    const p0, 0x7f0d0249

    goto :goto_26

    :cond_d
    instance-of p0, p1, Lkwc;

    if-eqz p0, :cond_15

    const p0, 0x7f0d024d

    goto :goto_26

    :cond_15
    instance-of p0, p1, Ljwc;

    if-eqz p0, :cond_1d

    const p0, 0x7f0d024c

    goto :goto_26

    :cond_1d
    instance-of p0, p1, Lfwc;

    if-eqz p0, :cond_25

    const p0, 0x7f0d0248

    goto :goto_26

    :cond_25
    const/4 p0, 0x0

    :goto_26
    return p0

    :pswitch_27
    const p0, 0x7f0d01a8

    return p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_27
    .end packed-switch
.end method
