.class public final synthetic Lxsf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(BZ)V
    .registers 3

    iput-byte p1, p0, Lxsf;->a:B

    iput-boolean p2, p0, Lxsf;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lxsf;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-boolean p0, p0, Lxsf;->b:Z

    packed-switch v0, :pswitch_data_60

    check-cast p1, Laq0;

    const-wide/16 v3, 0x1

    if-eqz p0, :cond_15

    iget-object p0, p1, Laq0;->a:Lzp0;

    invoke-virtual {p0, v1, v2, v3, v4}, Ljf0;->p(IIJ)V

    goto :goto_1a

    :cond_15
    iget-object p0, p1, Laq0;->a:Lzp0;

    invoke-virtual {p0, v2, v2, v3, v4}, Ljf0;->p(IIJ)V

    :goto_1a
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d
    check-cast p1, Lcq0;

    iget-object v0, p1, Lcq0;->a:Ln9a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lus0;

    const/16 v3, 0x97f

    const/4 v4, -0x1

    invoke-direct {v0, v3, v4, v2}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lcq0;->b:Lbq0;

    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    if-eqz v4, :cond_43

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_43

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_50

    :cond_43
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v3, v2, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v5, Lhf0;

    invoke-direct {v5, p1, v3, v4}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_50
    invoke-virtual {v5, v0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-eqz p0, :cond_58

    sget-object p0, Lts0;->c:Lts0;

    goto :goto_5a

    :cond_58
    sget-object p0, Lts0;->b:Lts0;

    :goto_5a
    invoke-virtual {v0, v1, v2, p0}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
