.class public final synthetic Ll/deu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;

.field public final synthetic b:Ll/ceu;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;Ll/ceu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/deu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;

    iput-object p2, p0, Ll/deu;->b:Ll/ceu;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/deu;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;

    iget-object p0, p0, Ll/deu;->b:Ll/ceu;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;->a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/titleline/LiveTitleLineCardView;Ll/ceu;Landroid/view/View;)V

    return-void
.end method
