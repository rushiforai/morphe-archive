.class Lcom/idv/identity/platform/CardGuideActivity$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/CardGuideActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/CardGuideActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/CardGuideActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/CardGuideActivity$h;->a:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity$h;->a:Lcom/idv/identity/platform/CardGuideActivity;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/idv/identity/platform/CardGuideActivity;->d:Lcom/idv/identity/platform/widget/IndicatorView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/idv/identity/platform/widget/IndicatorView;->setCurrentSelectedPosition(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
