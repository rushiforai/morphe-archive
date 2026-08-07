.class public final synthetic Ll/plh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/plh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;

    iput-object p2, p0, Ll/plh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    iput-object p3, p0, Ll/plh0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/plh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;

    iget-object v1, p0, Ll/plh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    iget-object p0, p0, Ll/plh0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;->v(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/b1;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ljava/lang/String;)V

    return-void
.end method
