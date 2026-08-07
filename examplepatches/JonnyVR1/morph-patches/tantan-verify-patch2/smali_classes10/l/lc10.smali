.class public final synthetic Ll/lc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

.field public final synthetic b:Ll/ar10;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ll/ar10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iput-object p2, p0, Ll/lc10;->b:Ll/ar10;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lc10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;

    iget-object p0, p0, Ll/lc10;->b:Ll/ar10;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;->i0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallCellTopView;Ll/ar10;Landroid/view/View;)V

    return-void
.end method
