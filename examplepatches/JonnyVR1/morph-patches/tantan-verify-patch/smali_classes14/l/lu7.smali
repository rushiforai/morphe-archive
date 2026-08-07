.class public final synthetic Ll/lu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/lu7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/lu7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/lu7;->d:Z

    iput-boolean p5, p0, Ll/lu7;->e:Z

    iput-boolean p6, p0, Ll/lu7;->f:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/lu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/lu7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/lu7;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/lu7;->d:Z

    iget-boolean v4, p0, Ll/lu7;->e:Z

    iget-boolean v5, p0, Ll/lu7;->f:Z

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->xa(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;ZZZLcom/p1/mobile/putong/data/Envelope;)Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method
