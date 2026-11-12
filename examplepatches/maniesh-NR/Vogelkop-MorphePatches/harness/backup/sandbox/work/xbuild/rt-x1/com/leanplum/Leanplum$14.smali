.class Lcom/leanplum/Leanplum$14;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->advanceTo(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$requestParams:Ljava/util/Map;

.field final synthetic val$state:Ljava/lang/String;

.field final synthetic val$validatedParams:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/Leanplum$14;->val$state:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/Leanplum$14;->val$validatedParams:Ljava/util/Map;

    iput-object p3, p0, Lcom/leanplum/Leanplum$14;->val$requestParams:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/Leanplum$14;->val$state:Ljava/lang/String;

    iget-object v1, p0, Lcom/leanplum/Leanplum$14;->val$validatedParams:Ljava/util/Map;

    iget-object p0, p0, Lcom/leanplum/Leanplum$14;->val$requestParams:Ljava/util/Map;

    # invokes: Lcom/leanplum/Leanplum;->advanceToInternal(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    invoke-static {v0, v1, p0}, Lcom/leanplum/Leanplum;->access$1000(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
