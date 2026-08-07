.class public final synthetic Ll/xmn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/gnn;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Greeting;


# direct methods
.method public synthetic constructor <init>(Ll/gnn;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xmn;->a:Ll/gnn;

    iput-object p2, p0, Ll/xmn;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xmn;->a:Ll/gnn;

    iget-object p0, p0, Ll/xmn;->b:Lcom/p1/mobile/putong/core/data/Greeting;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/gnn;->E0(Ll/gnn;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/Throwable;)V

    return-void
.end method
