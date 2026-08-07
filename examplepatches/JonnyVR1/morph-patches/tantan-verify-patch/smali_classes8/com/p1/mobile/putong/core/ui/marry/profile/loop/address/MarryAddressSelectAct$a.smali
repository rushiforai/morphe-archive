.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->a:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->R4(I)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 8
    .line 9
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->d2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 13
    .line 14
    const/4 v1, -0x1

    .line 15
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->e2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->showArrow()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->a2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)Lcom/p1/mobile/putong/core/newui/photoalbum/MomentDetailPager;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->b2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->T4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    new-instance p1, Landroid/content/Intent;

    .line 51
    .line 52
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 56
    .line 57
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;->g2(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;Landroid/content/Intent;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 61
    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, v1, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct$a;->b:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectAct;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 76
    .line 77
    .line 78
    return-void
.end method
