.class public Ll/dhe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/dhe0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/ihe0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VList;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Ll/ihe0;

.field public d:Ll/dhe0$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dhe0;->b:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static bridge synthetic a(Ll/dhe0;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dhe0;->b:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dhe0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/ehe0;->b(Ll/dhe0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/ihe0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dhe0;->c:Ll/ihe0;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dhe0;->d:Ll/dhe0$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dhe0$a;->s(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ihe0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dhe0;->c(Ll/ihe0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/dhe0;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object v0, p0, Ll/dhe0;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dhe0;->b:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Pa:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ll/dhe0$a;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/dhe0$a;-><init>(Ll/dhe0;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/dhe0;->d:Ll/dhe0$a;

    .line 22
    .line 23
    iget-object v0, p0, Ll/dhe0;->a:Lv/VList;

    .line 24
    .line 25
    const-string v1, "GreetListActModel"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lv/VList;->setCrashLogFlag(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/dhe0;->a:Lv/VList;

    .line 31
    .line 32
    iget-object v1, p0, Ll/dhe0;->d:Ll/dhe0$a;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/dhe0;->a:Lv/VList;

    .line 38
    .line 39
    const/high16 v1, 0x3f800000    # 1.0f

    .line 40
    .line 41
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setDividerHeight(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/dhe0;->a:Lv/VList;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    sget v1, Ll/dbc0;->ru:I

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method
