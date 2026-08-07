.class public final synthetic Ll/sfd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$o1;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sfd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$o1;

    iput-object p2, p0, Ll/sfd;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sfd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$o1;

    iget-object p0, p0, Ll/sfd;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$o1;->C(Lcom/p1/mobile/putong/core/util/DebugUtil$o1;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
