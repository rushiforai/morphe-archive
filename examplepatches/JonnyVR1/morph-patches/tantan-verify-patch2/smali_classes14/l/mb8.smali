.class public final synthetic Ll/mb8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/mb8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p3, p0, Ll/mb8;->c:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mb8;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/mb8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean p0, p0, Ll/mb8;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/g;->wb(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Z)V

    return-void
.end method
