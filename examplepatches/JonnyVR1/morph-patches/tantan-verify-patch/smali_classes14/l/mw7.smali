.class public final synthetic Ll/mw7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;JLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mw7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/mw7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-wide p3, p0, Ll/mw7;->c:J

    iput-object p5, p0, Ll/mw7;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mw7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/mw7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-wide v2, p0, Ll/mw7;->c:J

    iget-object v4, p0, Ll/mw7;->d:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->f3(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;JLjava/lang/String;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
