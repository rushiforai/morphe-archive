.class public final synthetic Ll/gz7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic e:Z

.field public final synthetic f:Z

.field public final synthetic g:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/gz7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/gz7;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/gz7;->d:Lcom/p1/mobile/putong/data/Envelope;

    iput-boolean p5, p0, Ll/gz7;->e:Z

    iput-boolean p6, p0, Ll/gz7;->f:Z

    iput-boolean p7, p0, Ll/gz7;->g:Z

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/gz7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/gz7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/gz7;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/gz7;->d:Lcom/p1/mobile/putong/data/Envelope;

    iget-boolean v4, p0, Ll/gz7;->e:Z

    iget-boolean v5, p0, Ll/gz7;->f:Z

    iget-boolean v6, p0, Ll/gz7;->g:Z

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->qb(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;ZZZ)V

    return-void
.end method
