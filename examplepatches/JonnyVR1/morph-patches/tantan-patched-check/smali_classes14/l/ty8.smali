.class public final synthetic Ll/ty8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/Message;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Message;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ty8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/ty8;->b:Ljava/util/Map;

    iput-object p3, p0, Ll/ty8;->c:Lcom/p1/mobile/putong/core/data/Message;

    iput-boolean p4, p0, Ll/ty8;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ty8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/ty8;->b:Ljava/util/Map;

    iget-object v2, p0, Ll/ty8;->c:Lcom/p1/mobile/putong/core/data/Message;

    iget-boolean v3, p0, Ll/ty8;->d:Z

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/core/data/Message;

    move-object v5, p2

    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->m3(Lcom/p1/mobile/putong/core/api/j;Ljava/util/Map;Lcom/p1/mobile/putong/core/data/Message;ZLcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
