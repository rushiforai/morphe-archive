.class Lcom/leanplum/Leanplum$13;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->setTrafficSourceInfo(Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$params:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Ljava/util/HashMap;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/Leanplum$13;->val$params:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    :try_start_0
    iget-object p0, p0, Lcom/leanplum/Leanplum$13;->val$params:Ljava/util/HashMap;

    # invokes: Lcom/leanplum/Leanplum;->setTrafficSourceInfoInternal(Ljava/util/HashMap;)V
    invoke-static {p0}, Lcom/leanplum/Leanplum;->access$900(Ljava/util/HashMap;)V
    :try_end_5
    .catchall {:try_start_0 .. :try_end_5} :catchall_6

    return-void

    :catchall_6
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
