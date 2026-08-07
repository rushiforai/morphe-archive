.class public final synthetic Ll/fy8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fy8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/fy8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/fy8;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/fy8;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fy8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/fy8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/fy8;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/fy8;->d:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/j;->f3(Lcom/p1/mobile/putong/core/api/j;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
