.class Lcom/tantanapp/common/data/orm/DatabaseStore$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/common/data/orm/DatabaseStore;->transaction(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

.field public trans:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;


# direct methods
.method public constructor <init>(Lcom/tantanapp/common/data/orm/DatabaseStore;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/data/orm/DatabaseStore;->access$000(Lcom/tantanapp/common/data/orm/DatabaseStore;)Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->trans:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->deleted()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->trans:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v1, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->this$0:Lcom/tantanapp/common/data/orm/DatabaseStore;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Lcom/tantanapp/common/data/orm/DatabaseStore;->syncUiCache(Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/tantanapp/common/data/orm/DatabaseStore$1;->trans:Lcom/tantanapp/common/data/orm/DatabaseStore$Transaction;

    .line 20
    .line 21
    return-void
.end method
