.class public final Lnxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lbxk;

.field public final synthetic c:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public constructor <init>(ZLbxk;Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/util/List;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lnxk;->a:Z

    iput-object p2, p0, Lnxk;->b:Lbxk;

    iput-object p3, p0, Lnxk;->c:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    iput-object p4, p0, Lnxk;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .registers 6

    sget-object v0, Llcp;->n:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-boolean v1, p0, Lnxk;->a:Z

    sget-object v2, Llcp;->o:Lbxk;

    iget-object v3, p0, Lnxk;->b:Lbxk;

    const/4 v4, 0x0

    if-eqz v1, :cond_1c

    if-eq v2, v3, :cond_14

    iget-object p0, p0, Lnxk;->c:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    invoke-static {p0, v4}, Lrih;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/lang/String;)V

    goto :goto_3d

    :cond_14
    iget-object p0, v2, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ldxk;

    invoke-virtual {p0}, Ldxk;->R()V

    goto :goto_3d

    :cond_1c
    iget-object v1, p0, Lnxk;->d:Ljava/util/List;

    if-eq v2, v3, :cond_36

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_24
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lnxk;->c:Lcom/opera/android/firebase/OperaFirebaseMessagingService;

    invoke-static {v3, v2}, Lrih;->d(Lcom/opera/android/firebase/OperaFirebaseMessagingService;Ljava/lang/String;)V

    goto :goto_24

    :cond_36
    iget-object p0, v3, Lbxk;->b:Ljava/lang/Object;

    check-cast p0, Ldxk;

    invoke-virtual {p0, v1}, Ldxk;->S(Ljava/util/List;)V

    :cond_3d
    :goto_3d
    monitor-exit v0

    return-object v4

    :goto_3f
    monitor-exit v0
    :try_end_40
    .catchall {:try_start_3 .. :try_end_40} :catchall_41

    throw p0

    :catchall_41
    move-exception p0

    goto :goto_3f
.end method
