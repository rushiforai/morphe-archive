.class public final synthetic Ll/t49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


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

    iput-object p1, p0, Ll/t49;->a:Lcom/p1/mobile/putong/core/api/l;

    iput-object p2, p0, Ll/t49;->b:Lcom/p1/mobile/putong/data/Envelope;

    iput-object p3, p0, Ll/t49;->c:Ljava/util/Map;

    iput-object p4, p0, Ll/t49;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/t49;->e:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/t49;->a:Lcom/p1/mobile/putong/core/api/l;

    iget-object v1, p0, Ll/t49;->b:Lcom/p1/mobile/putong/data/Envelope;

    iget-object v2, p0, Ll/t49;->c:Ljava/util/Map;

    iget-object v3, p0, Ll/t49;->d:Ljava/util/Map;

    iget-object v4, p0, Ll/t49;->e:Ljava/util/Map;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/l;->c3(Lcom/p1/mobile/putong/core/api/l;Lcom/p1/mobile/putong/data/Envelope;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Lcom/p1/mobile/putong/data/Envelope;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method
