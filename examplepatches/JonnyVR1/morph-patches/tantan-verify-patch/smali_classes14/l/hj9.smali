.class public final synthetic Ll/hj9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/CoreLikers;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Links;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/Links;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iput-object p2, p0, Ll/hj9;->b:Lcom/p1/mobile/putong/data/Links;

    iput-object p3, p0, Ll/hj9;->c:Ljava/util/List;

    iput-object p4, p0, Ll/hj9;->d:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hj9;->a:Lcom/p1/mobile/putong/core/api/CoreLikers;

    iget-object v1, p0, Ll/hj9;->b:Lcom/p1/mobile/putong/data/Links;

    iget-object v2, p0, Ll/hj9;->c:Ljava/util/List;

    iget-object p0, p0, Ll/hj9;->d:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/api/CoreLikers;->e5(Lcom/p1/mobile/putong/core/api/CoreLikers;Lcom/p1/mobile/putong/data/Links;Ljava/util/List;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
