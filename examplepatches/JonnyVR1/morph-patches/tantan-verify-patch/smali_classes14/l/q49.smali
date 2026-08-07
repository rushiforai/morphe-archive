.class public final synthetic Ll/q49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/l;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Envelope;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q49;->a:Lcom/p1/mobile/putong/core/api/l;

    iput-object p2, p0, Ll/q49;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/q49;->c:Ljava/util/Map;

    iput-object p4, p0, Ll/q49;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/q49;->e:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/q49;->a:Lcom/p1/mobile/putong/core/api/l;

    iget-object v1, p0, Ll/q49;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/q49;->c:Ljava/util/Map;

    iget-object v3, p0, Ll/q49;->d:Ljava/util/Map;

    iget-object p0, p0, Ll/q49;->e:Ljava/util/Map;

    invoke-static {v0, v1, v2, v3, p0}, Lcom/p1/mobile/putong/core/api/l;->h3(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
