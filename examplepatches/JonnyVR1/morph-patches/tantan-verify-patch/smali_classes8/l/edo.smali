.class public Ll/edo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/bdo;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

.field public e:Ll/bdo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/edo;->d:Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/edo;Ll/y20;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edo;->i(Ll/y20;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/edo;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/edo;->f(Ll/y20;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/edo;->d:Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/edo;->d()Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fdo;->b(Ll/edo;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/edo;->d:Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/bdo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/edo;->e:Ll/bdo;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Ll/y20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/edo;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic i(Ll/y20;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/edo;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->p0(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/edo;->d()Lcom/p1/mobile/putong/core/ui/map/intl/IntlMapPreviewBaseAct;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/ddo;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/ddo;-><init>(Ll/edo;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->post(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/bdo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/edo;->e(Ll/bdo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/edo;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/edo;->c:Lv/VText;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/edo;->c:Lv/VText;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/edo;->c:Lv/VText;

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->buildDrawingCache()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/edo;->b:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    new-instance v0, Ll/cdo;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Ll/cdo;-><init>(Ll/edo;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
