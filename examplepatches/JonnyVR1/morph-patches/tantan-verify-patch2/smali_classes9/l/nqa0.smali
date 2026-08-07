.class public Ll/nqa0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/nqa0$b;,
        Ll/nqa0$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/lqa0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationBar;

.field public b:Lv/VList;

.field public c:Landroid/content/Context;

.field public d:Ll/nqa0$b;

.field public e:Ll/lqa0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nqa0;->c:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/nqa0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nqa0;->e(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Ll/nqa0;)Ll/lqa0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqa0;->e:Ll/lqa0;

    return-object p0
.end method

.method private synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqa0;->e:Ll/lqa0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/lqa0;->g0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nqa0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/mqa0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/mqa0;-><init>(Ll/nqa0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/nqa0$b;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/nqa0$b;-><init>(Ll/nqa0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/nqa0;->d:Ll/nqa0$b;

    .line 17
    .line 18
    iget-object v1, p0, Ll/nqa0;->b:Lv/VList;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/nqa0;->b:Lv/VList;

    .line 24
    .line 25
    new-instance v1, Ll/nqa0$a;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/nqa0$a;-><init>(Ll/nqa0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nqa0;->c:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/oqa0;->b(Ll/nqa0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/lqa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nqa0;->e:Ll/lqa0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/ui/profile/loop/base/LoopSelectFillData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/nqa0;->d:Ll/nqa0$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nqa0$b;->b(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nqa0;->a:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/lqa0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nqa0;->d(Ll/lqa0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/nqa0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Ll/nqa0;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method
