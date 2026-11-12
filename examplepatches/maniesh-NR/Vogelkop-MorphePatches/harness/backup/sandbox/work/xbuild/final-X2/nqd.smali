.class public final synthetic Lnqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldd2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnpd;

.field public final synthetic c:Lnod;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lnpd;Lnod;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Lnqd;->a:B

    iput-object p1, p0, Lnqd;->b:Lnpd;

    iput-object p2, p0, Lnqd;->c:Lnod;

    iput-object p3, p0, Lnqd;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 12

    iget-byte v0, p0, Lnqd;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lnqd;->d:Ljava/lang/Object;

    const/4 v3, 0x4

    packed-switch v0, :pswitch_data_60

    move-object v6, v2

    check-cast v6, Luqd;

    move-object v8, p1

    check-cast v8, Ljava/util/List;

    iget-object v5, p0, Lnqd;->b:Lnpd;

    iget-object p1, v5, Lnpd;->l:Landroid/os/Handler;

    new-instance v4, Lqn;

    const/16 v9, 0xf

    iget-object v7, p0, Lnqd;->c:Lnod;

    invoke-direct/range {v4 .. v9}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lzr9;

    invoke-direct {p0, v5, v7, v4}, Lzr9;-><init>(Lnpd;Lnod;Ljava/lang/Runnable;)V

    new-instance v0, Le4j;

    invoke-direct {v0, v1}, Le4j;-><init>(I)V

    sget-object v1, Ltym;->a:Ljava/lang/String;

    new-instance v1, Lc5j;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    new-instance v2, Lh4m;

    invoke-direct {v2, v1, p0, v0, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v2}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-object v1

    :pswitch_36
    check-cast v2, Lkpd;

    check-cast p1, Lood;

    iget-object v0, p0, Lnqd;->b:Lnpd;

    iget-object v4, v0, Lnpd;->l:Landroid/os/Handler;

    new-instance v5, Ljbd;

    invoke-direct {v5, v0, v2, p1, v3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lzr9;

    iget-object p0, p0, Lnqd;->c:Lnod;

    invoke-direct {p1, v0, p0, v5}, Lzr9;-><init>(Lnpd;Lnod;Ljava/lang/Runnable;)V

    new-instance p0, Le4j;

    invoke-direct {p0, v1}, Le4j;-><init>(I)V

    sget-object v0, Ltym;->a:Ljava/lang/String;

    new-instance v0, Lc5j;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lh4m;

    invoke-direct {v1, v0, p1, p0, v3}, Lh4m;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4, v1}, Ltym;->S(Landroid/os/Handler;Ljava/lang/Runnable;)V

    return-object v0

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method
