.class public final synthetic Ll/fjh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fjh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;

    iput-object p2, p0, Ll/fjh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fjh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;

    iget-object p0, p0, Ll/fjh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;->t(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/z;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V

    return-void
.end method
