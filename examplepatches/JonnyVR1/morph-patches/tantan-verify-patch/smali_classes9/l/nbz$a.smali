.class public Ll/nbz$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nbz;->u2(Ll/clz;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public constructor <init>(Ll/clz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nbz$a;->a:Ll/clz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 2
    .line 3
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 4
    .line 5
    iget-object p0, p0, Ll/clz;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/wzh0;->query(Ljava/lang/String;)Lcom/tantanapp/common/data/DbObject;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->guideFakeToGood:Z

    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 21
    .line 22
    iget-object v0, v0, Ll/il8;->m:Ll/mm6;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic b(Ll/clz;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->U:Ll/fy6;

    .line 4
    .line 5
    new-instance v1, Ll/mbz;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/mbz;-><init>(Ll/clz;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/fy6;->a(Ll/x20;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/nbz$a;->a:Ll/clz;

    .line 2
    .line 3
    new-instance v0, Ll/lbz;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/lbz;-><init>(Ll/clz;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
