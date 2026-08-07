.class public final synthetic Ll/y38;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Lcom/p1/mobile/putong/core/data/Message;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ll/x20;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y38;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/y38;->b:Ll/x20;

    iput-boolean p3, p0, Ll/y38;->c:Z

    iput-object p4, p0, Ll/y38;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/y38;->e:Lcom/p1/mobile/putong/core/data/Message;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/y38;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/y38;->b:Ll/x20;

    iget-boolean v2, p0, Ll/y38;->c:Z

    iget-object v3, p0, Ll/y38;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/y38;->e:Lcom/p1/mobile/putong/core/data/Message;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->m5(Lcom/p1/mobile/putong/core/api/g;Ll/x20;ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
