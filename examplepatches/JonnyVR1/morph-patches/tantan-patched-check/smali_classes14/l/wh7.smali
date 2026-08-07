.class public final synthetic Ll/wh7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-object p2, p0, Ll/wh7;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iput-object p3, p0, Ll/wh7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wh7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-object v1, p0, Ll/wh7;->b:Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    iget-object p0, p0, Ll/wh7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/e;->r3(Lcom/p1/mobile/putong/core/api/e;Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;)V

    return-void
.end method
