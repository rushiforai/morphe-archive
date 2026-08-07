.class public final synthetic Ll/jt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/jt7;->b:Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;

    iput-object p3, p0, Ll/jt7;->c:Ljava/util/List;

    iput-object p4, p0, Ll/jt7;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/jt7;->e:Ljava/lang/String;

    iput p6, p0, Ll/jt7;->f:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/jt7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/jt7;->b:Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;

    iget-object v2, p0, Ll/jt7;->c:Ljava/util/List;

    iget-object v3, p0, Ll/jt7;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/jt7;->e:Ljava/lang/String;

    iget v5, p0, Ll/jt7;->f:I

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/g;->q9(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/ChatNewMatchEnvelope;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method
