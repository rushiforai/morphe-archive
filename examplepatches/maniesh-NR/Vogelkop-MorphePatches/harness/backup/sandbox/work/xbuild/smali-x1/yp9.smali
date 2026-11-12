.class public final Lyp9;
.super Ljava/util/LinkedHashMap;
.source "SourceFile"


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(IFZB)V
    .registers 5

    .line 9
    iput-byte p4, p0, Lyp9;->a:B

    invoke-direct {p0, p1, p2, p3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    iput-byte p3, p0, Lyp9;->a:B

    const/high16 p1, 0x3f400000    # 0.75f

    const/4 p3, 0x1

    invoke-direct {p0, p2, p1, p3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method public final bridge containsKey(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_a
    instance-of v0, p1, Lckn;

    if-nez v0, :cond_10

    const/4 p0, 0x0

    goto :goto_16

    :cond_10
    check-cast p1, Lckn;

    invoke-super {p0, p1}, Ljava/util/AbstractMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    :goto_16
    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge containsValue(Ljava/lang/Object;)Z
    .registers 3

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_a
    instance-of v0, p1, Lgkn;

    if-nez v0, :cond_10

    const/4 p0, 0x0

    goto :goto_16

    :cond_10
    check-cast p1, Lgkn;

    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    :goto_16
    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    instance-of v0, p1, Lckn;

    if-nez v0, :cond_10

    const/4 p0, 0x0

    goto :goto_18

    :cond_10
    check-cast p1, Lckn;

    invoke-super {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgkn;

    :goto_18
    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1, p2}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a
    instance-of v0, p1, Lckn;

    if-eqz v0, :cond_19

    check-cast p1, Lckn;

    check-cast p2, Lgkn;

    invoke-super {p0, p1, p2}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    move-object p2, p0

    check-cast p2, Lgkn;

    :cond_19
    return-object p2

    :pswitch_data_1a
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_1a

    invoke-super {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 28
    :pswitch_a
    instance-of v0, p1, Lckn;

    if-nez v0, :cond_10

    const/4 p0, 0x0

    goto :goto_18

    :cond_10
    check-cast p1, Lckn;

    .line 29
    invoke-super {p0, p1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgkn;

    :goto_18
    return-object p0

    nop

    :pswitch_data_1a
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final bridge remove(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 5

    iget-byte v0, p0, Lyp9;->a:B

    packed-switch v0, :pswitch_data_1c

    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_a
    instance-of v0, p1, Lckn;

    const/4 v1, 0x0

    if-eqz v0, :cond_1b

    instance-of v0, p2, Lgkn;

    if-eqz v0, :cond_1b

    check-cast p1, Lckn;

    check-cast p2, Lgkn;

    invoke-super {p0, p1, p2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1b
    return v1

    :pswitch_data_1c
    .packed-switch 0x3
        :pswitch_a
    .end packed-switch
.end method

.method public final removeEldestEntry(Ljava/util/Map$Entry;)Z
    .registers 2

    iget-byte p1, p0, Lyp9;->a:B

    packed-switch p1, :pswitch_data_34

    invoke-super {p0}, Ljava/util/AbstractMap;->size()I

    move-result p0

    const/4 p1, 0x4

    if-le p0, p1, :cond_e

    const/4 p0, 0x1

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    return p0

    :pswitch_10
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    move-result p0

    const/16 p1, 0x64

    if-le p0, p1, :cond_1a

    const/4 p0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    return p0

    :pswitch_1c
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    move-result p0

    const/16 p1, 0x64

    if-le p0, p1, :cond_26

    const/4 p0, 0x1

    goto :goto_27

    :cond_26
    const/4 p0, 0x0

    :goto_27
    return p0

    :pswitch_28
    invoke-virtual {p0}, Ljava/util/AbstractMap;->size()I

    move-result p0

    const/4 p1, 0x4

    if-le p0, p1, :cond_31

    const/4 p0, 0x1

    goto :goto_32

    :cond_31
    const/4 p0, 0x0

    :goto_32
    return p0

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_28
        :pswitch_1c
        :pswitch_10
    .end packed-switch
.end method
