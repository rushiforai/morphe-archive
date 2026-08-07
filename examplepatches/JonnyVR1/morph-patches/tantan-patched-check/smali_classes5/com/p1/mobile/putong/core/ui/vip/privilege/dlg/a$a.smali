.class public Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;
.super Landroidx/viewpager/widget/ViewPager$m;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->k()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$m;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager$m;->onPageSelected(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ge p1, v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->l:Ll/j49;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->e(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 29
    .line 30
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 39
    .line 40
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Bl(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a$a;->a:Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->d(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/core/data/Privilege;

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;->g(Lcom/p1/mobile/putong/core/ui/vip/privilege/dlg/a;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method
