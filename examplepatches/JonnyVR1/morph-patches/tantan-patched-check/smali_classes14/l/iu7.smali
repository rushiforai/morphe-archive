.class public final synthetic Ll/iu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/iu7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/iu7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p4, p0, Ll/iu7;->d:Ljava/lang/String;

    iput-wide p5, p0, Ll/iu7;->e:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/iu7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/iu7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/iu7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v3, p0, Ll/iu7;->d:Ljava/lang/String;

    iget-wide v4, p0, Ll/iu7;->e:J

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->M5(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;JLcom/p1/mobile/putong/core/data/Message;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
