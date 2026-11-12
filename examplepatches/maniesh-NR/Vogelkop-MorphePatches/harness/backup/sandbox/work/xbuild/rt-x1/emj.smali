.class public final Lemj;
.super La7f;
.source "SourceFile"


# instance fields
.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ltee;

.field public f:Ltee;

.field public g:Lor4;

.field public final h:Ltji;

.field public final i:Ltxi;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, La7f;-><init>()V

    new-instance v0, Ltji;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Ltji;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lemj;->h:Ltji;

    new-instance v0, Lnqi;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lnqi;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lytj;->a:Lbli;

    invoke-static {v1}, Lytj;->b(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    sget-object v1, Lytj;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1a
    sget-object v2, Lytj;->h:Ljava/util/List;

    check-cast v2, Ljava/util/Collection;

    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->W(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v2

    sput-object v2, Lytj;->h:Ljava/util/List;
    :try_end_24
    .catchall {:try_start_1a .. :try_end_24} :catchall_2f

    monitor-exit v1

    new-instance v1, Ltxi;

    const/16 v2, 0x8

    invoke-direct {v1, v0, v2}, Ltxi;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lemj;->i:Ltxi;

    return-void

    :catchall_2f
    move-exception p0

    monitor-exit v1

    throw p0
.end method


# virtual methods
.method public final b(Lor4;)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lemj;->d:Ljava/lang/Object;

    iput-object p1, p0, Lemj;->f:Ltee;

    return-void
.end method

.method public final c()V
    .registers 4

    iget-object v0, p0, La7f;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lemj;->d:Ljava/lang/Object;

    iput-object v1, p0, Lemj;->c:Ljava/lang/Object;

    iget-object v1, p0, Lemj;->f:Ltee;

    if-nez v1, :cond_f

    const/4 v1, 0x0

    iput-object v1, p0, Lemj;->e:Ltee;

    goto :goto_22

    :cond_f
    iget-object v1, p0, Lemj;->e:Ltee;

    if-nez v1, :cond_1c

    sget-object v1, Ljmi;->a:Ltee;

    new-instance v1, Ltee;

    invoke-direct {v1}, Ltee;-><init>()V

    iput-object v1, p0, Lemj;->e:Ltee;

    :cond_1c
    iget-object v2, p0, Lemj;->f:Ltee;

    iput-object v2, p0, Lemj;->e:Ltee;

    iput-object v1, p0, Lemj;->f:Ltee;
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_24

    :goto_22
    monitor-exit v0

    return-void

    :catchall_24
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lemj;->i:Ltxi;

    invoke-virtual {v0}, Ltxi;->d()V

    const/4 v0, 0x0

    iput-object v0, p0, Lemj;->d:Ljava/lang/Object;

    iput-object v0, p0, Lemj;->f:Ltee;

    iget-object v1, p0, La7f;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_d
    iput-object v0, p0, Lemj;->g:Lor4;

    iput-object v0, p0, Lemj;->c:Ljava/lang/Object;

    iput-object v0, p0, Lemj;->e:Ltee;
    :try_end_13
    .catchall {:try_start_d .. :try_end_13} :catchall_15

    monitor-exit v1

    return-void

    :catchall_15
    move-exception p0

    monitor-exit v1

    throw p0
.end method

.method public final e(Lor4;)Lkotlin/jvm/functions/Function1;
    .registers 3

    iget-object v0, p0, Lemj;->g:Lor4;

    if-eqz v0, :cond_f

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    const-string v0, "Requested a SingleSubscriptionSnapshotFlowManager to manage multiple subscriptions"

    invoke-static {v0}, Lbpg;->b(Ljava/lang/String;)V

    :cond_f
    iput-object p1, p0, Lemj;->g:Lor4;

    iget-object p0, p0, Lemj;->h:Ltji;

    return-object p0
.end method

.method public final f(Lor4;)V
    .registers 2

    const/4 p1, 0x0

    iput-object p1, p0, Lemj;->g:Lor4;

    iput-object p1, p0, Lemj;->d:Ljava/lang/Object;

    iput-object p1, p0, Lemj;->f:Ltee;

    invoke-virtual {p0}, Lemj;->c()V

    return-void
.end method
