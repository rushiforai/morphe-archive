.class public final Levc;
.super Lk1g;
.source "SourceFile"


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ljava/util/List;

.field public final synthetic k:Ljava/util/List;


# direct methods
.method public constructor <init>(Lgvc;Ljava/util/List;Ljava/util/List;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Levc;->i:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Levc;->j:Ljava/util/List;

    iput-object p3, p0, Levc;->k:Ljava/util/List;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Ljava/util/List;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Levc;->i:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Levc;->j:Ljava/util/List;

    iput-object p2, p0, Levc;->k:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Lqmj;Ljava/util/List;Ljava/util/List;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Levc;->i:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p2, p0, Levc;->j:Ljava/util/List;

    iput-object p3, p0, Levc;->k:Ljava/util/List;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final C()I
    .registers 2

    iget-byte v0, p0, Levc;->i:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_c
    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_13
    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_c
    .end packed-switch
.end method

.method public final D()I
    .registers 2

    iget-byte v0, p0, Levc;->i:B

    packed-switch v0, :pswitch_data_1a

    iget-object p0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_c
    iget-object p0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_13
    iget-object p0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_13
        :pswitch_c
    .end packed-switch
.end method

.method public final h(II)Z
    .registers 3

    iget-byte p0, p0, Levc;->i:B

    const/4 p0, 0x1

    return p0
.end method

.method public final i(II)Z
    .registers 4

    iget-byte v0, p0, Levc;->i:B

    packed-switch v0, :pswitch_data_3e

    iget-object v0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_18
    iget-object v0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    if-ne p1, p0, :cond_28

    const/4 p0, 0x1

    goto :goto_29

    :cond_28
    const/4 p0, 0x0

    :goto_29
    return p0

    :pswitch_2a
    iget-object v0, p0, Levc;->j:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbre;

    iget-object p0, p0, Levc;->k:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p1, p0}, Lbre;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    nop

    :pswitch_data_3e
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_18
    .end packed-switch
.end method
