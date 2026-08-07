.class public final synthetic Ll/dv8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/j;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/util/Map;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/util/Map;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iput-object p2, p0, Ll/dv8;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/dv8;->c:Ljava/util/Map;

    iput-boolean p4, p0, Ll/dv8;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dv8;->a:Lcom/p1/mobile/putong/core/api/j;

    iget-object v1, p0, Ll/dv8;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/dv8;->c:Ljava/util/Map;

    iget-boolean v3, p0, Ll/dv8;->d:Z

    move-object v4, p1

    check-cast v4, Lcom/p1/mobile/putong/core/data/Message;

    move-object v5, p2

    check-cast v5, Lcom/p1/mobile/putong/core/data/Message;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/j;->R4(Lcom/p1/mobile/putong/core/api/j;Ljava/lang/String;Ljava/util/Map;ZLcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method
