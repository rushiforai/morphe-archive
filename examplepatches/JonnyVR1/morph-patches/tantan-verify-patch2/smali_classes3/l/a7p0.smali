.class public final synthetic Ll/a7p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/c7p0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

.field public final synthetic c:Lv/VDraweeView;


# direct methods
.method public synthetic constructor <init>(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a7p0;->a:Ll/c7p0;

    iput-object p2, p0, Ll/a7p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    iput-object p3, p0, Ll/a7p0;->c:Lv/VDraweeView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a7p0;->a:Ll/c7p0;

    iget-object v1, p0, Ll/a7p0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    iget-object p0, p0, Ll/a7p0;->c:Lv/VDraweeView;

    invoke-static {v0, v1, p0, p1}, Ll/c7p0;->b(Ll/c7p0;Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;Lv/VDraweeView;Landroid/view/View;)V

    return-void
.end method
