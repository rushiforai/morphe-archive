.class public final synthetic Ll/qz20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

.field public final synthetic b:Ll/b030;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qz20;->a:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    iput-object p2, p0, Ll/qz20;->b:Ll/b030;

    iput-object p3, p0, Ll/qz20;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qz20;->a:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    iget-object v1, p0, Ll/qz20;->b:Ll/b030;

    iget-object p0, p0, Ll/qz20;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->h0(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;Landroid/view/View;)V

    return-void
.end method
