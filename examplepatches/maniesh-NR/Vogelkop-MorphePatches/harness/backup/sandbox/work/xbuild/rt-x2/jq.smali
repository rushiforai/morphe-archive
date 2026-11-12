.class public final Ljq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltz;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldl;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Llhb;Lhl;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Ljq;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljq;->b:Ldl;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Ljq;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmq;Ldl;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ljq;->a:B

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljq;->b:Ldl;

    iput-object p1, p0, Ljq;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 5

    iget-byte v0, p0, Ljq;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ljq;->b:Ldl;

    iget-object p0, p0, Ljq;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p1}, Lyz;->t()Z

    move-result v0

    if-eqz v0, :cond_1a

    check-cast p0, Llhb;

    iget-object p0, p0, Llhb;->c:Lyl;

    check-cast v2, Lhl;

    invoke-virtual {p0, p1, v2}, Ln1;->a(Lyz;Ldl;)V

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    :goto_1b
    return v1

    :pswitch_1c
    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->g:Lkm;

    invoke-interface {p0, p1, v2}, Lkm;->a(Lyz;Ldl;)V

    return v1

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method

.method public final b(Lyz;)Z
    .registers 5

    iget-byte v0, p0, Ljq;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ljq;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    invoke-virtual {p1}, Lyz;->s()Z

    move-result v0

    if-eqz v0, :cond_1a

    check-cast v2, Llhb;

    iget-object v0, v2, Llhb;->c:Lyl;

    iget-object p0, p0, Ljq;->b:Ldl;

    check-cast p0, Lhl;

    invoke-virtual {v0, p1, p0}, Ln1;->k(Lyz;Ldl;)V

    goto :goto_1b

    :cond_1a
    const/4 v1, 0x0

    :goto_1b
    return v1

    :pswitch_1c
    invoke-virtual {p1}, Lyz;->s()Z

    move-result p0

    if-eqz p0, :cond_27

    check-cast v2, Lmq;

    invoke-virtual {v2}, Lmq;->k()V

    :cond_27
    return v1

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method

.method public final c(Lyz;)Z
    .registers 5

    iget-byte v0, p0, Ljq;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ljq;->b:Ldl;

    iget-object p0, p0, Ljq;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1c

    check-cast p0, Llhb;

    iget-object p0, p0, Llhb;->c:Lyl;

    check-cast v2, Lhl;

    invoke-virtual {p0, p1, v2}, Ln1;->b(Lyz;Ldl;)V

    return v1

    :pswitch_14
    check-cast p0, Lmq;

    iget-object p0, p0, Lmq;->g:Lkm;

    invoke-interface {p0, p1, v2}, Lkm;->b(Lyz;Ldl;)V

    return v1

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
