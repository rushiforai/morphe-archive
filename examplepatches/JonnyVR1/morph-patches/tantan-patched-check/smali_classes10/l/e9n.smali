.class public final synthetic Ll/e9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/g9n;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

.field public final synthetic c:Ljava/util/ArrayList;

.field public final synthetic d:Ll/y8n;


# direct methods
.method public synthetic constructor <init>(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e9n;->a:Ll/g9n;

    iput-object p2, p0, Ll/e9n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    iput-object p3, p0, Ll/e9n;->c:Ljava/util/ArrayList;

    iput-object p4, p0, Ll/e9n;->d:Ll/y8n;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e9n;->a:Ll/g9n;

    iget-object v1, p0, Ll/e9n;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    iget-object v2, p0, Ll/e9n;->c:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/e9n;->d:Ll/y8n;

    invoke-static {v0, v1, v2, p0, p1}, Ll/g9n;->c(Ll/g9n;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/util/ArrayList;Ll/y8n;Landroid/view/View;)V

    return-void
.end method
