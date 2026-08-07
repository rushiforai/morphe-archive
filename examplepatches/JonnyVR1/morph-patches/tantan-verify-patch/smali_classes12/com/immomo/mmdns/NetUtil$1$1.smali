.class Lcom/immomo/mmdns/NetUtil$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/mmdns/NetUtil$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/immomo/mmdns/NetUtil$1;


# direct methods
.method public constructor <init>(Lcom/immomo/mmdns/NetUtil$1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/mmdns/NetUtil$1$1;->this$0:Lcom/immomo/mmdns/NetUtil$1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/immomo/mmdns/NetUtil$1$1;->this$0:Lcom/immomo/mmdns/NetUtil$1;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/immomo/mmdns/NetUtil$1;->access$100(Lcom/immomo/mmdns/NetUtil$1;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    return-void
.end method
