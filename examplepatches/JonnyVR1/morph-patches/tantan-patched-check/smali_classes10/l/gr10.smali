.class public final synthetic Ll/gr10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gr10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    iput-object p2, p0, Ll/gr10;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gr10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    iget-object p0, p0, Ll/gr10;->b:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->c(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
