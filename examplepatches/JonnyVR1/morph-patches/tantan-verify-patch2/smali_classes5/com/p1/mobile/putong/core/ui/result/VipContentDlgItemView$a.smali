.class public Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->T0(Lcom/p1/mobile/putong/core/data/Privilege;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$a;->a:Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_vip_privilege_badge_optional_button"

    .line 2
    .line 3
    const-string v0, "p_privilege_intro"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView$a;->a:Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;

    .line 13
    .line 14
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;->m0(Lcom/p1/mobile/putong/core/ui/result/VipContentDlgItemView;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Fo(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    const p0, -0xb5b5b6

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
