.class public final synthetic Ll/mnt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/rnt;

.field public final synthetic b:Ll/jlt;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

.field public final synthetic d:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

.field public final synthetic e:I


# direct methods
.method public synthetic constructor <init>(Ll/rnt;Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mnt;->a:Ll/rnt;

    iput-object p2, p0, Ll/mnt;->b:Ll/jlt;

    iput-object p3, p0, Ll/mnt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iput-object p4, p0, Ll/mnt;->d:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

    iput p5, p0, Ll/mnt;->e:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mnt;->a:Ll/rnt;

    iget-object v1, p0, Ll/mnt;->b:Ll/jlt;

    iget-object v2, p0, Ll/mnt;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    iget-object v3, p0, Ll/mnt;->d:Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;

    iget v4, p0, Ll/mnt;->e:I

    move-object v5, p1

    invoke-static/range {v0 .. v5}, Ll/rnt;->j(Ll/rnt;Ll/jlt;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;Lcom/p1/mobile/putong/live/external/page/search/base/LiveAnchorsInfo;ILandroid/view/View;)V

    return-void
.end method
