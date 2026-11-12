.class public final synthetic Lul5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvl5;


# instance fields
.field public final synthetic a:Lvzk;

.field public final synthetic b:Lnod;


# direct methods
.method public synthetic constructor <init>(Lvzk;Lnod;Lcig;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lul5;->a:Lvzk;

    iput-object p2, p0, Lul5;->b:Lnod;

    return-void
.end method


# virtual methods
.method public final run()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 2

    iget-object v0, p0, Lul5;->a:Lvzk;

    iget-object v0, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnpd;

    if-eqz v0, :cond_13

    iget-object p0, p0, Lul5;->b:Lnod;

    invoke-virtual {v0, p0}, Lnpd;->o(Lnod;)V

    :cond_13
    sget-object p0, Lr0b;->b:Lr0b;

    return-object p0
.end method
