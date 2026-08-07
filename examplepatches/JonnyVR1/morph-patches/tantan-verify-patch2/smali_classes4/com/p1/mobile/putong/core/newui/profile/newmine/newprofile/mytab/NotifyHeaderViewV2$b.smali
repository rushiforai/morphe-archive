.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Ll/pf60;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 4
    .line 5
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 16
    .line 17
    const-string v2, "audit"

    .line 18
    .line 19
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 30
    .line 31
    const-string v1, "RISK_TAG_UNREAL"

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {p0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_0

    .line 48
    .line 49
    iget-boolean p0, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 50
    .line 51
    if-nez p0, :cond_0

    .line 52
    .line 53
    const/4 p0, 0x1

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_1
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 62
    .line 63
    return-object p0
.end method

.method public static synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->g(Ll/uxj0;)Z

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
    const-string p0, "auditStrategy"

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 4
    .line 5
    sget v0, Ll/dbc0;->lh:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1, v1, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v1, Lcom/p1/mobile/putong/core/R$string;->z8:I

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    new-instance p1, Ll/p250;

    .line 33
    .line 34
    invoke-direct {p1}, Ll/p250;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public d()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$b;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->g:Lrx/subjects/a;

    .line 4
    .line 5
    new-instance v0, Ll/q250;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/q250;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public g(Ll/uxj0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
