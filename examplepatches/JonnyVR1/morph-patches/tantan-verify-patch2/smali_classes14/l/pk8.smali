.class public final synthetic Ll/pk8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/il8;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/util/HashMap;

.field public final synthetic d:Ljava/util/HashMap;

.field public final synthetic e:Ljava/util/List;

.field public final synthetic f:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/il8;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pk8;->a:Ll/il8;

    iput-object p2, p0, Ll/pk8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/pk8;->c:Ljava/util/HashMap;

    iput-object p4, p0, Ll/pk8;->d:Ljava/util/HashMap;

    iput-object p5, p0, Ll/pk8;->e:Ljava/util/List;

    iput-object p6, p0, Ll/pk8;->f:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p7, p0, Ll/pk8;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/pk8;->a:Ll/il8;

    iget-object v1, p0, Ll/pk8;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/pk8;->c:Ljava/util/HashMap;

    iget-object v3, p0, Ll/pk8;->d:Ljava/util/HashMap;

    iget-object v4, p0, Ll/pk8;->e:Ljava/util/List;

    iget-object v5, p0, Ll/pk8;->f:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v6, p0, Ll/pk8;->g:Ljava/lang/String;

    move-object v7, p1

    check-cast v7, Lcom/p1/mobile/putong/core/data/Message;

    move-object v8, p2

    check-cast v8, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v8}, Ll/il8;->u(Ll/il8;Lcom/p1/mobile/putong/core/data/Message;Ljava/util/HashMap;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/Envelope;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
