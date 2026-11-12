.class Lcom/leanplum/Leanplum$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/Leanplum;->setUserAttributes(Ljava/lang/String;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$params:Ljava/util/HashMap;

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/HashMap;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/Leanplum$11;->val$userId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/Leanplum$11;->val$params:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lcom/leanplum/Leanplum$11;->val$userId:Ljava/lang/String;

    iget-object p0, p0, Lcom/leanplum/Leanplum$11;->val$params:Ljava/util/HashMap;

    # invokes: Lcom/leanplum/Leanplum;->setUserAttributesInternal(Ljava/lang/String;Ljava/util/HashMap;)V
    invoke-static {v0, p0}, Lcom/leanplum/Leanplum;->access$800(Ljava/lang/String;Ljava/util/HashMap;)V
    :try_end_7
    .catchall {:try_start_0 .. :try_end_7} :catchall_8

    return-void

    :catchall_8
    move-exception p0

    invoke-static {p0}, Lcom/leanplum/internal/Log;->exception(Ljava/lang/Throwable;)V

    return-void
.end method
