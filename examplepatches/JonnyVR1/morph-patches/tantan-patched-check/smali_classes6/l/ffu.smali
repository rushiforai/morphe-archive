.class public final synthetic Ll/ffu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

.field public final synthetic b:Ll/byu;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;Ll/byu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ffu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    iput-object p2, p0, Ll/ffu;->b:Ll/byu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ffu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;

    iget-object p0, p0, Ll/ffu;->b:Ll/byu;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;->a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/tvline/LiveTvLineCardExtItemView;Ll/byu;Landroid/view/View;)V

    return-void
.end method
