.class public final synthetic Lt5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lvr0;


# direct methods
.method public synthetic constructor <init>(Lvr0;B)V
    .registers 3

    iput-byte p2, p0, Lt5f;->a:B

    iput-object p1, p0, Lt5f;->b:Lvr0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lt5f;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, -0x1

    const/16 v4, 0x98b

    iget-object p0, p0, Lt5f;->b:Lvr0;

    check-cast p1, Ltd0;

    packed-switch v0, :pswitch_data_7c

    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lur0;

    invoke-direct {v0, v4, v3, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/16 v3, 0x3c

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_30

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_30

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_39

    :cond_30
    invoke-static {p1, v3, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_39
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-nez p0, :cond_3f

    move v2, v1

    :cond_3f
    invoke-virtual {v0, v1, v2, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_45
    iget-object v0, p1, Ltd0;->a:Lzpa;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ltr0;

    invoke-direct {v0, v4, v3, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Ltd0;->b:Lqd0;

    const/16 v3, 0x3d

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_67

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_67

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_70

    :cond_67
    invoke-static {p1, v3, v2}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v4

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_70
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-nez p0, :cond_76

    move v2, v1

    :cond_76
    invoke-virtual {v0, v1, v2, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_7c
    .packed-switch 0x0
        :pswitch_45
    .end packed-switch
.end method
