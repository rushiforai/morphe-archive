.class public final synthetic Ll/qs7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Z

.field public final synthetic e:Z

.field public final synthetic f:Lcom/p1/mobile/putong/core/data/Sticker;

.field public final synthetic g:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qs7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/qs7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/qs7;->c:Ljava/lang/String;

    iput-boolean p4, p0, Ll/qs7;->d:Z

    iput-boolean p5, p0, Ll/qs7;->e:Z

    iput-object p6, p0, Ll/qs7;->f:Lcom/p1/mobile/putong/core/data/Sticker;

    iput-object p7, p0, Ll/qs7;->g:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qs7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/qs7;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/qs7;->c:Ljava/lang/String;

    iget-boolean v3, p0, Ll/qs7;->d:Z

    iget-boolean v4, p0, Ll/qs7;->e:Z

    iget-object v5, p0, Ll/qs7;->f:Lcom/p1/mobile/putong/core/data/Sticker;

    iget-object v6, p0, Ll/qs7;->g:Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    invoke-static/range {v0 .. v6}, Lcom/p1/mobile/putong/core/api/g;->yc(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;ZZLcom/p1/mobile/putong/core/data/Sticker;Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
