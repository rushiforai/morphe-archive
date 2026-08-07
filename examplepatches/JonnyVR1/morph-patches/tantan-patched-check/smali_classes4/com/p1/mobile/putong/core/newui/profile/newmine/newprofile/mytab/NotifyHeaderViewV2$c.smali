.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/l0w$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/l0w$a<",
        "Ll/uxj0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->g(Ll/uxj0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string p0, "fakeStrategy"

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 4
    .line 5
    sget v0, Ll/dbc0;->yh:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget v0, Lcom/p1/mobile/putong/core/R$string;->x4:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {}, Ll/k3g;->a()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->sj()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/u820;->o1()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/u820;->v()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v0, "e_picture_fake_button"

    .line 67
    .line 68
    invoke-static {v0, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a:Landroid/widget/FrameLayout;

    .line 74
    .line 75
    new-instance v0, Ll/r250;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/r250;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public d()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->i:Lrx/subjects/a;

    .line 4
    .line 5
    return-object p0
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$c;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/u820;->J1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public g(Ll/uxj0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
