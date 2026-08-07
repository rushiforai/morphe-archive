.class public final synthetic Ll/b4s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;

.field public final synthetic b:Ll/o3s$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;Ll/o3s$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b4s;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;

    iput-object p2, p0, Ll/b4s;->b:Ll/o3s$a;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b4s;->a:Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;

    iget-object p0, p0, Ll/b4s;->b:Ll/o3s$a;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;->r(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/campaignBanner/a;Ll/o3s$a;Landroid/view/View;)V

    return-void
.end method
