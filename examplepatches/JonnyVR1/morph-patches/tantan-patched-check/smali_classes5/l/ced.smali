.class public final synthetic Ll/ced;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$q0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$q0;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ced;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$q0;

    iput-object p2, p0, Ll/ced;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ced;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$q0;

    iget-object p0, p0, Ll/ced;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$q0;->b(Lcom/p1/mobile/putong/core/util/DebugUtil$q0;Lcom/p1/mobile/putong/core/newui/home/b;)V

    return-void
.end method
