.class public final synthetic Ll/br10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/br10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    iput p2, p0, Ll/br10;->b:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/br10;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;

    iget p0, p0, Ll/br10;->b:I

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;->b(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/view/MultiCallTopView;ILandroid/view/View;)V

    return-void
.end method
