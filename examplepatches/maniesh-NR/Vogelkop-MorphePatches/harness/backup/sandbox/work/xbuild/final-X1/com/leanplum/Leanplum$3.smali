.class Lcom/leanplum/Leanplum$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->start(Landroid/content/Context;Ljava/lang/String;Ljava/util/Map;Lcom/leanplum/callbacks/StartCallback;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$actuallyInBackground:Z

.field final synthetic val$userId:Ljava/lang/String;

.field final synthetic val$validAttributes:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Z)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/Leanplum$3;->val$userId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/Leanplum$3;->val$validAttributes:Ljava/util/Map;

    iput-boolean p3, p0, Lcom/leanplum/Leanplum$3;->val$actuallyInBackground:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/Leanplum$3;->val$userId:Ljava/lang/String;

    iget-object v1, p0, Lcom/leanplum/Leanplum$3;->val$validAttributes:Ljava/util/Map;

    iget-boolean p0, p0, Lcom/leanplum/Leanplum$3;->val$actuallyInBackground:Z

    # invokes: Lcom/leanplum/Leanplum;->startHelper(Ljava/lang/String;Ljava/util/Map;Z)V
    invoke-static {v0, v1, p0}, Lcom/leanplum/Leanplum;->access$100(Ljava/lang/String;Ljava/util/Map;Z)V
    :try_end_9
    .catchall {:try_start_0 .. :try_end_9} :catchall_a

    return-void

    :catchall_a
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
