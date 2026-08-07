.class public final synthetic Ll/pu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/pu7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pu7;->c:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/pu7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/pu7;->c:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->ea(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
