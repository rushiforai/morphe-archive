.class public final synthetic Ll/d9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/g9n;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

.field public final synthetic c:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d9n;->a:Ll/g9n;

    iput-object p2, p0, Ll/d9n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    iput-object p3, p0, Ll/d9n;->c:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/d9n;->a:Ll/g9n;

    iget-object v1, p0, Ll/d9n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    iget-object p0, p0, Ll/d9n;->c:Ljava/util/ArrayList;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    invoke-static {v0, v1, p0, p1}, Ll/g9n;->a(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    return-void
.end method
