.class public final synthetic Lpqd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvl5;


# instance fields
.field public final synthetic a:Lvqd;

.field public final synthetic b:Lnpd;

.field public final synthetic c:Lnod;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Lvqd;Lnpd;Lnod;I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpqd;->a:Lvqd;

    iput-object p2, p0, Lpqd;->b:Lnpd;

    iput-object p3, p0, Lpqd;->c:Lnod;

    iput p4, p0, Lpqd;->d:I

    return-void
.end method


# virtual methods
.method public final run()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 4

    iget-object v0, p0, Lpqd;->c:Lnod;

    iget v1, p0, Lpqd;->d:I

    iget-object v2, p0, Lpqd;->a:Lvqd;

    iget-object p0, p0, Lpqd;->b:Lnpd;

    invoke-interface {v2, p0, v0, v1}, Lvqd;->l(Lnpd;Lnod;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/util/concurrent/ListenableFuture;

    return-object p0
.end method
