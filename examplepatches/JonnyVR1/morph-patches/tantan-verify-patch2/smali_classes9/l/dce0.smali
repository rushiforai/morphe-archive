.class public final synthetic Ll/dce0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/ece0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;


# direct methods
.method public synthetic constructor <init>(Ll/ece0;Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dce0;->a:Ll/ece0;

    iput-object p2, p0, Ll/dce0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dce0;->a:Ll/ece0;

    iget-object p0, p0, Ll/dce0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;

    invoke-static {v0, p0, p1}, Ll/ece0;->K(Ll/ece0;Lcom/p1/mobile/putong/live/base/data/BLiveScrapBrief;Landroid/view/View;)V

    return-void
.end method
