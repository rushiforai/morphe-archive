.class public final synthetic Lwv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lb6h;


# direct methods
.method public synthetic constructor <init>(Lb6h;B)V
    .registers 3

    iput-byte p2, p0, Lwv1;->a:B

    iput-object p1, p0, Lwv1;->b:Lb6h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 2

    iget-byte v0, p0, Lwv1;->a:B

    iget-object p0, p0, Lwv1;->b:Lb6h;

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lwv1;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_7a

    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lesk;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    nop

    :pswitch_data_7a
    .packed-switch 0x0
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final get()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lwv1;->a:B

    iget-object p0, p0, Lwv1;->b:Lb6h;

    packed-switch v0, :pswitch_data_20

    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_11
    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_1b
    invoke-interface {p0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_20
    .packed-switch 0x0
        :pswitch_1b
        :pswitch_16
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lwv1;->a:B

    packed-switch v0, :pswitch_data_32

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
