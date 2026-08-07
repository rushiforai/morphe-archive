.class public final synthetic Ll/ty7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ty7;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-object p2, p0, Ll/ty7;->b:Ljava/util/List;

    iput-object p3, p0, Ll/ty7;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/ty7;->d:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ty7;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-object v1, p0, Ll/ty7;->b:Ljava/util/List;

    iget-object v2, p0, Ll/ty7;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/ty7;->d:Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/core/api/g;->hd(Lcom/p1/mobile/putong/core/api/g;Ljava/util/List;Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
