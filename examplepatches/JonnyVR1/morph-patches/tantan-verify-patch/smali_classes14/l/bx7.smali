.class public final synthetic Ll/bx7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bx7;->a:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/g;->ub(Lcom/p1/mobile/putong/core/data/Message;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
