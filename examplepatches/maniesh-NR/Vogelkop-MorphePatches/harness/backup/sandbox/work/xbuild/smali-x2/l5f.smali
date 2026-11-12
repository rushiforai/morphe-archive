.class public final synthetic Ll5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldd0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/util/ArrayList;

.field public final synthetic f:Lkm0;

.field public final synthetic g:Z

.field public final synthetic h:Lxc0;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/Long;

.field public final synthetic k:Ljava/lang/Long;


# direct methods
.method public synthetic constructor <init>(Ldd0;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Lkm0;ZLxc0;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;B)V
    .registers 12

    iput-byte p11, p0, Ll5f;->a:B

    iput-object p1, p0, Ll5f;->b:Ldd0;

    iput-object p2, p0, Ll5f;->c:Ljava/lang/String;

    iput-object p3, p0, Ll5f;->d:Ljava/lang/String;

    iput-object p4, p0, Ll5f;->e:Ljava/util/ArrayList;

    iput-object p5, p0, Ll5f;->f:Lkm0;

    iput-boolean p6, p0, Ll5f;->g:Z

    iput-object p7, p0, Ll5f;->h:Lxc0;

    iput-object p8, p0, Ll5f;->i:Ljava/lang/String;

    iput-object p9, p0, Ll5f;->j:Ljava/lang/Long;

    iput-object p10, p0, Ll5f;->k:Ljava/lang/Long;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Ll5f;->a:B

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_e0

    check-cast p1, Lcd0;

    iget-object p1, p1, Lcd0;->a:Lbd0;

    const/4 v0, 0x0

    iget-object v2, p0, Ll5f;->b:Ldd0;

    invoke-virtual {p1, v0, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v2, p0, Ll5f;->c:Ljava/lang/String;

    if-eqz v2, :cond_17

    invoke-virtual {p1, v1, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17
    iget-object v2, p0, Ll5f;->d:Ljava/lang/String;

    if-eqz v2, :cond_1f

    const/4 v3, 0x2

    invoke-virtual {p1, v3, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1f
    const/4 v2, 0x3

    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_34

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_34

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_41

    :cond_34
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v2, v1, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, p1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_41
    iget-object v2, p0, Ll5f;->e:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    iget-object v2, p0, Ll5f;->f:Lkm0;

    if-eqz v2, :cond_4e

    const/4 v3, 0x4

    invoke-virtual {p1, v3, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_4e
    const/4 v2, 0x5

    iget-boolean v3, p0, Ll5f;->g:Z

    invoke-virtual {p1, v2, v1, v3}, Ljf0;->r(IIZ)V

    iget-object v2, p0, Ll5f;->h:Lxc0;

    if-eqz v2, :cond_5c

    const/4 v3, 0x6

    invoke-virtual {p1, v3, v1, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5c
    iget-object v2, p0, Ll5f;->i:Ljava/lang/String;

    if-eqz v2, :cond_67

    if-eqz v2, :cond_63

    move v0, v1

    :cond_63
    const/4 v3, 0x7

    invoke-virtual {p1, v3, v0, v2}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_67
    iget-object v0, p0, Ll5f;->j:Ljava/lang/Long;

    if-eqz v0, :cond_74

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 v0, 0x8

    invoke-virtual {p1, v0, v1, v2, v3}, Ljf0;->p(IIJ)V

    :cond_74
    iget-object p0, p0, Ll5f;->k:Ljava/lang/Long;

    if-eqz p0, :cond_81

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const/16 p0, 0x9

    invoke-virtual {p1, p0, v1, v2, v3}, Ljf0;->p(IIJ)V

    :cond_81
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_84
    check-cast p1, Lnd0;

    new-instance v2, Ll5f;

    const/4 v13, 0x1

    iget-object v3, p0, Ll5f;->b:Ldd0;

    iget-object v4, p0, Ll5f;->c:Ljava/lang/String;

    iget-object v5, p0, Ll5f;->d:Ljava/lang/String;

    iget-object v6, p0, Ll5f;->e:Ljava/util/ArrayList;

    iget-object v7, p0, Ll5f;->f:Lkm0;

    iget-boolean v8, p0, Ll5f;->g:Z

    iget-object v9, p0, Ll5f;->h:Lxc0;

    iget-object v10, p0, Ll5f;->i:Ljava/lang/String;

    iget-object v11, p0, Ll5f;->j:Ljava/lang/Long;

    iget-object v12, p0, Ll5f;->k:Ljava/lang/Long;

    invoke-direct/range {v2 .. v13}, Ll5f;-><init>(Ldd0;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Lkm0;ZLxc0;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;B)V

    iget-object p0, p1, Lnd0;->a:Lzpa;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lbd0;

    const/4 v0, -0x1

    const/16 v3, 0xa

    const/16 v4, 0x98b

    invoke-direct {p0, v4, v0, v3}, Ljf0;-><init>(III)V

    iget-object p1, p1, Lnd0;->b:Lmd0;

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_c5

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_c5

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_d2

    :cond_c5
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1, v1, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v1, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_d2
    invoke-virtual {v3, p0}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lcd0;

    invoke-direct {p1, p0}, Lcd0;-><init>(Lbd0;)V

    invoke-virtual {v2, p1}, Ll5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_84
    .end packed-switch
.end method
