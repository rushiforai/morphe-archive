.class public Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;
.super Lcom/p1/mobile/putong/app/PutongFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$c;,
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;,
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;,
        Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$e;
    }
.end annotation


# instance fields
.field public A:Lv/VList;

.field public B:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;

.field public C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

.field public D:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

.field public E:Ll/x20;

.field public z:Lv/navigationbar/VNavigationBar;


# direct methods
.method public constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->E:Ll/x20;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic M4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->S4(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic N4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->B:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;

    return-object p0
.end method

.method public static bridge synthetic O4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;Lv/navigationbar/VNavigationBar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->z:Lv/navigationbar/VNavigationBar;

    return-void
.end method

.method public static bridge synthetic P4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;Lv/VList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->A:Lv/VList;

    return-void
.end method

.method private synthetic S4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->E:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->E:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$c;->a(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public R4(I)Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->a:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 10
    .line 11
    return-object p0
.end method

.method public T4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->D:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->A:Lv/VList;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getNextList()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public U4(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->B:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$b;

    .line 2
    .line 3
    return-void
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 9
    .line 10
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->A:Lv/VList;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->A:Lv/VList;

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$a;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->D:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 31
    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getShowText()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->C:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->D:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->getNextList()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag$d;->b(Ljava/util/List;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->z:Lv/navigationbar/VNavigationBar;

    .line 55
    .line 56
    new-instance v0, Ll/lyw;

    .line 57
    .line 58
    invoke-direct {v0, p0}, Ll/lyw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/address/MarryAddressSelectFrag;->Q4(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
