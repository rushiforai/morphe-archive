.class public final synthetic Ll/pr7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Z

.field public final synthetic g:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;ZZZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pr7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/pr7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/pr7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p4, p0, Ll/pr7;->d:Z

    iput-boolean p5, p0, Ll/pr7;->e:Z

    iput-boolean p6, p0, Ll/pr7;->f:Z

    iput-object p7, p0, Ll/pr7;->g:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pr7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/pr7;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/pr7;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean v3, p0, Ll/pr7;->d:Z

    iget-boolean v4, p0, Ll/pr7;->e:Z

    iget-boolean v5, p0, Ll/pr7;->f:Z

    iget-object v6, p0, Ll/pr7;->g:Ll/y20;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->w3(Lcom/p1/mobile/putong/core/api/g;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Message;ZZZLl/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
