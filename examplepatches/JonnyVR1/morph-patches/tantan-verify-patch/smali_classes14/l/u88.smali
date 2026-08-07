.class public final synthetic Ll/u88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u88;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/u88;->b:Lcom/p1/mobile/putong/core/data/Message;

    iput-object p3, p0, Ll/u88;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/u88;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/u88;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/u88;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/u88;->b:Lcom/p1/mobile/putong/core/data/Message;

    iget-object v2, p0, Ll/u88;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/u88;->d:Ljava/lang/String;

    iget-object p0, p0, Ll/u88;->e:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/g;->Fb(Lcom/p1/mobile/putong/core/api/g;Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
