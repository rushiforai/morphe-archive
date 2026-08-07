.class public final synthetic Ll/dqj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fqj0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/SwipeDirection;


# direct methods
.method public synthetic constructor <init>(Ll/fqj0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqj0;->a:Ll/fqj0;

    iput-object p2, p0, Ll/dqj0;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dqj0;->a:Ll/fqj0;

    iget-object p0, p0, Ll/dqj0;->b:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    invoke-static {v0, p0}, Ll/fqj0;->b(Ll/fqj0;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    return-void
.end method
