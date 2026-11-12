.class public final Lzxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzy;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lbz;Lzy;B)V
    .registers 4

    .line 14
    iput-byte p3, p0, Lzxe;->a:B

    iput-object p1, p0, Lzxe;->c:Ljava/lang/Object;

    iput-object p2, p0, Lzxe;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Li5k;Leof;)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Lzxe;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lzxe;->b:Ljava/lang/Object;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lzxe;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lyz;)Z
    .registers 6

    iget-byte v0, p0, Lzxe;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, Lzxe;->b:Ljava/lang/Object;

    iget-object p0, p0, Lzxe;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_5c

    check-cast p0, Li5k;

    iget-object v0, p0, Li5k;->c:Lmq;

    iget-object p0, p0, Li5k;->d:Lj5k;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    invoke-virtual {p0, p1, v0, v1}, Lj5k;->a(Lyz;Lmq;Ltxi;)Z

    move-result p0

    goto :goto_28

    :cond_19
    iget-object v0, p0, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmq;

    if-eqz v0, :cond_27

    invoke-virtual {p0, p1, v0, v1}, Lj5k;->a(Lyz;Lmq;Ltxi;)Z

    move-result v2

    :cond_27
    move p0, v2

    :goto_28
    check-cast v3, Leof;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v3, p1}, Leof;->run(Ljava/lang/Object;)V

    return p0

    :pswitch_32
    check-cast p0, Lp7h;

    invoke-virtual {p0, p1}, Lp7h;->l(Lyz;)V

    check-cast v3, Lzy;

    invoke-interface {v3, p1}, Lzy;->a(Lyz;)Z

    move-result p0

    if-nez p0, :cond_42

    invoke-virtual {p1}, Lyz;->b()V

    :cond_42
    return v1

    :pswitch_43
    check-cast v3, Lzy;

    invoke-virtual {p1}, Lyz;->q()Z

    move-result v0

    check-cast p0, Laye;

    if-eqz v0, :cond_55

    iput-boolean v1, p0, Laye;->b:Z

    const-string p0, "Expired"

    invoke-interface {v3, p0}, Lzy;->onFailed(Ljava/lang/String;)V

    goto :goto_5b

    :cond_55
    iput-boolean v2, p0, Laye;->b:Z

    invoke-interface {v3, p1}, Lzy;->a(Lyz;)Z

    move-result v1

    :goto_5b
    return v1

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_43
        :pswitch_32
    .end packed-switch
.end method

.method public final onFailed(Ljava/lang/String;)V
    .registers 4

    iget-byte v0, p0, Lzxe;->a:B

    iget-object v1, p0, Lzxe;->c:Ljava/lang/Object;

    iget-object p0, p0, Lzxe;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    check-cast v1, Li5k;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Leof;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Leof;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_16
    check-cast p0, Lzy;

    invoke-interface {p0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    :pswitch_1c
    check-cast v1, Laye;

    const/4 v0, 0x0

    iput-boolean v0, v1, Laye;->b:Z

    check-cast p0, Lzy;

    invoke-interface {p0, p1}, Lzy;->onFailed(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_16
    .end packed-switch
.end method
