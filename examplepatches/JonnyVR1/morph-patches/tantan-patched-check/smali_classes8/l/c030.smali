.class public final synthetic Ll/c030;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/f030;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/f030;Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c030;->a:Ll/f030;

    iput-object p2, p0, Ll/c030;->b:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    iput-object p3, p0, Ll/c030;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iput p4, p0, Ll/c030;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/c030;->a:Ll/f030;

    iget-object v1, p0, Ll/c030;->b:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    iget-object v2, p0, Ll/c030;->c:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    iget p0, p0, Ll/c030;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/f030;->G(Ll/f030;Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V

    return-void
.end method
