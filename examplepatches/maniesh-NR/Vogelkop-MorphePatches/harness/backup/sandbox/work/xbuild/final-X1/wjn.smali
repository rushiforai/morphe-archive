.class public final Lwjn;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final synthetic c:B


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;B)V
    .registers 3

    iput-byte p2, p0, Lwjn;->c:B

    const/16 p2, 0x1a

    invoke-direct {p0, p1, p2}, Ln1;-><init>(Ljava/lang/Object;B)V

    return-void
.end method


# virtual methods
.method public final P(Ljava/util/List;)Ljava/util/List;
    .registers 4

    iget-byte p0, p0, Lwjn;->c:B

    packed-switch p0, :pswitch_data_26

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :pswitch_8
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1c

    new-instance p1, Lckb;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_1c
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Ln1;->r0(Ljava/util/List;ZZ)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :goto_25
    return-object p0

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final Q(Ljava/util/ArrayList;)Ljava/util/List;
    .registers 8

    iget-byte v0, p0, Lwjn;->c:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0, p1}, Ln1;->Q(Ljava/util/ArrayList;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_19
    if-ge v2, v1, :cond_30

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lbkn;

    new-instance v4, Lkkb;

    iget-object v5, v3, Lbkn;->a:Laln;

    iget v3, v3, Lbkn;->b:I

    invoke-direct {v4, v5, v3}, Lkkb;-><init>(Laln;I)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_30
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object p0

    :pswitch_data_34
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
