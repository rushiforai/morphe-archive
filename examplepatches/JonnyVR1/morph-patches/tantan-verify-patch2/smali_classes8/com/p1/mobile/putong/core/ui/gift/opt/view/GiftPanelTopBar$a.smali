.class public Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->C(Lv/VPager;Ll/y20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->b:Ll/y20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->a:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->z(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget v0, Ll/cgc0;->o:I

    .line 19
    .line 20
    invoke-static {p1, v0}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->a:Z

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->b:Ll/y20;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {p1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    const/4 p1, 0x1

    .line 45
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->a:Z

    .line 46
    .line 47
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar$a;->c:Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;->z(Lcom/p1/mobile/putong/core/ui/gift/opt/view/GiftPanelTopBar;Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    sget p1, Ll/cgc0;->p:I

    .line 19
    .line 20
    invoke-static {p0, p1}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
