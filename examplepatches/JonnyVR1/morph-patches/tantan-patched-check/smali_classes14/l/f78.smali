.class public final synthetic Ll/f78;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f78;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/f78;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/f78;->c:Ll/x20;

    iput-boolean p4, p0, Ll/f78;->d:Z

    iput-object p5, p0, Ll/f78;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/f78;->f:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/f78;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/f78;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/f78;->c:Ll/x20;

    iget-boolean v3, p0, Ll/f78;->d:Z

    iget-object v4, p0, Ll/f78;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/f78;->f:Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->k5(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/data/Envelope;Ll/x20;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
