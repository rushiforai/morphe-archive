.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ll/u820;->I1()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->g(Ll/uxj0;)Z

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
    const-string p0, "appealStrategy"

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 14
    .line 15
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/yc2;->b()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "under_review"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 30
    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/core/R$string;->m0:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/R$string;->n0:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-virtual {p1}, Ll/u820;->o1()Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 70
    .line 71
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;)Ll/u820;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/u820;->pageId()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {v0}, Ll/yc2;->b()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    const-string v1, "ban_user_appeal_state"

    .line 88
    .line 89
    invoke-static {v1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const-string v1, "e_my_profile_navigation_appeal_guide"

    .line 98
    .line 99
    invoke-static {v1, p1, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 103
    .line 104
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->a:Landroid/widget/FrameLayout;

    .line 105
    .line 106
    new-instance v0, Ll/s250;

    .line 107
    .line 108
    invoke-direct {v0, p0}, Ll/s250;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;)V

    .line 109
    .line 110
    .line 111
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 112
    .line 113
    .line 114
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$d;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->k:Lrx/subjects/a;

    .line 4
    .line 5
    return-object p0
.end method

.method public g(Ll/uxj0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
