.class public final Lsz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltz;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lg10;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lsz;->a:B

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsz;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>([Ltz;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lsz;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lsz;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 6

    iget-byte v0, p0, Lsz;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_22

    return v1

    :pswitch_7
    iget-object p0, p0, Lsz;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_10
    if-ge v2, v0, :cond_21

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ltz;

    invoke-interface {v3, p1}, Ltz;->a(Lyz;)Z

    move-result v3

    if-eqz v3, :cond_10

    const/4 v1, 0x1

    :cond_21
    return v1

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method

.method public final b(Lyz;)Z
    .registers 6

    iget-byte v0, p0, Lsz;->a:B

    iget-object p0, p0, Lsz;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast p0, Lg10;

    iget-object p0, p0, Lg10;->G:Lw00;

    iget-boolean p0, p0, Lw00;->m:Z

    return p0

    :pswitch_e
    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_16
    if-ge v2, v0, :cond_27

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ltz;

    invoke-interface {v3, p1}, Ltz;->b(Lyz;)Z

    move-result v3

    if-eqz v3, :cond_16

    const/4 v1, 0x1

    :cond_27
    return v1

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final c(Lyz;)Z
    .registers 6

    iget-byte v0, p0, Lsz;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_22

    return v1

    :pswitch_7
    iget-object p0, p0, Lsz;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_10
    if-ge v2, v0, :cond_21

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ltz;

    invoke-interface {v3, p1}, Ltz;->c(Lyz;)Z

    move-result v3

    if-eqz v3, :cond_10

    const/4 v1, 0x1

    :cond_21
    return v1

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_7
    .end packed-switch
.end method
