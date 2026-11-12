.class public final Lik;
.super Lk1g;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final j:Ljava/util/ArrayList;

.field public final k:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lik;->i:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lik;->k:Ljava/util/List;

    iput-object p1, p0, Lik;->j:Ljava/util/ArrayList;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/util/List;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lik;->i:B

    iput-object p1, p0, Lik;->j:Ljava/util/ArrayList;

    iput-object p2, p0, Lik;->k:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final C()I
    .registers 3

    iget-byte v0, p0, Lik;->i:B

    iget-object v1, p0, Lik;->k:Ljava/util/List;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lik;->j:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_13
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method

.method public final D()I
    .registers 3

    iget-byte v0, p0, Lik;->i:B

    iget-object v1, p0, Lik;->j:Ljava/util/ArrayList;

    packed-switch v0, :pswitch_data_18

    iget-object p0, p0, Lik;->k:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_e
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_13
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_13
        :pswitch_e
    .end packed-switch
.end method

.method public final h(II)Z
    .registers 5

    iget-byte v0, p0, Lik;->i:B

    iget-object v1, p0, Lik;->j:Ljava/util/ArrayList;

    iget-object p0, p0, Lik;->k:Ljava/util/List;

    packed-switch v0, :pswitch_data_34

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lllc;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lllc;

    invoke-virtual {p0, p1}, Lllc;->b(Lllc;)Z

    move-result p0

    return p0

    :pswitch_1a
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_27
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_27
        :pswitch_1a
    .end packed-switch
.end method

.method public final i(II)Z
    .registers 5

    iget-byte v0, p0, Lik;->i:B

    iget-object v1, p0, Lik;->j:Ljava/util/ArrayList;

    iget-object p0, p0, Lik;->k:Ljava/util/List;

    packed-switch v0, :pswitch_data_48

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lllc;

    invoke-virtual {p0}, Lllc;->a()J

    move-result-wide p0

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lllc;

    invoke-virtual {p2}, Lllc;->a()J

    move-result-wide v0

    cmp-long p0, p0, v0

    if-nez p0, :cond_23

    const/4 p0, 0x1

    goto :goto_24

    :cond_23
    const/4 p0, 0x0

    :goto_24
    return p0

    :pswitch_25
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_32
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_32
        :pswitch_25
    .end packed-switch
.end method
