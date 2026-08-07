.class public final synthetic Ll/edd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/edd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edd;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$t;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$t;->c(Lcom/p1/mobile/putong/core/util/DebugUtil$t;)V

    return-void
.end method
