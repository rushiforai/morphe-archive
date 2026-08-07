.class public final synthetic Ll/nkh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nkh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;

    iput-object p2, p0, Ll/nkh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nkh0;->a:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;

    iget-object p0, p0, Ll/nkh0;->b:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;->p(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/q0;Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;Ll/uxj0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
