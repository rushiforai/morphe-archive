.class public final synthetic Ll/el8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/il8;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/CoreData;

.field public final synthetic d:I

.field public final synthetic e:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic f:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Ll/il8;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/el8;->a:Ll/il8;

    iput-object p2, p0, Ll/el8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iput-object p3, p0, Ll/el8;->c:Lcom/p1/mobile/putong/core/data/CoreData;

    iput p4, p0, Ll/el8;->d:I

    iput-object p5, p0, Ll/el8;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p6, p0, Ll/el8;->f:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/el8;->a:Ll/il8;

    iget-object v1, p0, Ll/el8;->b:Lcom/p1/mobile/putong/core/data/Conversation;

    iget-object v2, p0, Ll/el8;->c:Lcom/p1/mobile/putong/core/data/CoreData;

    iget v3, p0, Ll/el8;->d:I

    iget-object v4, p0, Ll/el8;->e:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v5, p0, Ll/el8;->f:Lcom/p1/mobile/putong/data/Envelope;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/core/data/Conversation;

    move-object v7, p2

    check-cast v7, Lcom/p1/mobile/putong/core/data/Conversation;

    invoke-static/range {v0 .. v7}, Ll/il8;->z(Ll/il8;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/CoreData;ILjava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method
