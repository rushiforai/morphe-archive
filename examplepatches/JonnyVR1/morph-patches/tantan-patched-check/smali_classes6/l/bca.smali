.class public final synthetic Ll/bca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jka;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/Map;

.field public final synthetic e:Ljava/util/Map;

.field public final synthetic f:Ljava/util/HashMap;

.field public final synthetic g:Lcom/p1/mobile/putong/data/Envelope;


# direct methods
.method public synthetic constructor <init>(Ll/jka;Ljava/util/Map;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bca;->a:Ll/jka;

    iput-object p2, p0, Ll/bca;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/bca;->c:Ljava/util/List;

    iput-object p4, p0, Ll/bca;->d:Ljava/util/Map;

    iput-object p5, p0, Ll/bca;->e:Ljava/util/Map;

    iput-object p6, p0, Ll/bca;->f:Ljava/util/HashMap;

    iput-object p7, p0, Ll/bca;->g:Lcom/p1/mobile/putong/data/Envelope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/bca;->a:Ll/jka;

    iget-object v1, p0, Ll/bca;->b:Ljava/util/Map;

    iget-object v2, p0, Ll/bca;->c:Ljava/util/List;

    iget-object v3, p0, Ll/bca;->d:Ljava/util/Map;

    iget-object v4, p0, Ll/bca;->e:Ljava/util/Map;

    iget-object v5, p0, Ll/bca;->f:Ljava/util/HashMap;

    iget-object v6, p0, Ll/bca;->g:Lcom/p1/mobile/putong/data/Envelope;

    move-object v7, p1

    check-cast v7, Lcom/p1/mobile/putong/feed/data/RawFeed;

    invoke-static/range {v0 .. v7}, Ll/jka;->t6(Ll/jka;Ljava/util/Map;Ljava/util/List;Ljava/util/Map;Ljava/util/Map;Ljava/util/HashMap;Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    return-void
.end method
