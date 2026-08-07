.class public Ll/qjo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qjo$a;,
        Ll/qjo$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ojo;",
        ">;"
    }
.end annotation


# static fields
.field public static final f:I


# instance fields
.field public a:Lv/smart_refresh/SmartRefreshLayout;

.field public b:Lv/VRecyclerView;

.field public final c:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

.field public d:Ll/ojo;

.field public e:Ll/qjo$a;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42200000    # 40.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    div-int/lit8 v0, v0, 0x3

    .line 13
    .line 14
    sput v0, Ll/qjo;->f:I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qjo;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/qjo;Ll/mvc0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qjo;->f(Ll/mvc0;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/qjo;)Ll/ojo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo;->d:Ll/ojo;

    return-object p0
.end method

.method public static bridge synthetic c()I
    .locals 1

    .line 1
    sget v0, Ll/qjo;->f:I

    return v0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qjo;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qjo;->c:Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tjo;->b(Ll/qjo;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/ojo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qjo;->d:Ll/ojo;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Ll/mvc0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qjo;->d:Ll/ojo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ojo;->G0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TribeSubset;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qjo;->e:Ll/qjo$a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/qjo$a;->G(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/qjo;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/smart_refresh/SmartRefreshLayout;->t()Ll/mvc0;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ojo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qjo;->e(Ll/ojo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qjo;->d(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 2

    .line 1
    new-instance v0, Ll/qjo$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/qjo$a;-><init>(Ll/qjo;Ll/sjo;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/qjo;->e:Ll/qjo$a;

    .line 8
    .line 9
    iget-object v1, p0, Ll/qjo;->b:Lv/VRecyclerView;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/qjo;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 15
    .line 16
    new-instance v1, Ll/pjo;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/pjo;-><init>(Ll/qjo;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->O(Ll/jn50;)Ll/mvc0;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/qjo;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->a(Z)Ll/mvc0;

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/qjo;->a:Lv/smart_refresh/SmartRefreshLayout;

    .line 31
    .line 32
    new-instance v1, Lv/smart_refresh/header/TTRefreshHeader;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/qjo;->C0()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-direct {v1, p0}, Lv/smart_refresh/header/TTRefreshHeader;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lv/smart_refresh/SmartRefreshLayout;->S(Ll/kvc0;)Ll/mvc0;

    .line 42
    .line 43
    .line 44
    return-void
.end method
