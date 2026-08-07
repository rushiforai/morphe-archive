.class public final synthetic Ll/keq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/leq0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/leq0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/keq0;->a:Ll/leq0;

    iput-object p2, p0, Ll/keq0;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/keq0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/keq0;->a:Ll/leq0;

    iget-object v1, p0, Ll/keq0;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object p0, p0, Ll/keq0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/leq0;->a(Ll/leq0;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;)V

    return-void
.end method
