.class public Ll/z03;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x03;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lcn/qqtheme/framework/wheelview/WheelView;

.field public d:Lcn/qqtheme/framework/wheelview/WheelView;

.field public e:Lcn/qqtheme/framework/wheelview/WheelView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

.field public h:Ll/x03;

.field public i:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/y03;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/y03;-><init>(Ll/z03;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/z03;->i:Ll/y20;

    .line 10
    .line 11
    iput-object p1, p0, Ll/z03;->g:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic a(Ll/z03;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z03;->d(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z03;->g:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z03;->g:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/a13;->b(Ll/z03;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Ll/x03;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/z03;->h:Ll/x03;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z03;->h:Ll/x03;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x03;->m0(Lcom/p1/mobile/putong/data/User;)V

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

.method public e()V
    .locals 3

    .line 1
    new-instance v0, Ll/ob0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/z03;->g:Lcom/p1/mobile/putong/core/ui/growth/agealert/birthdayverify/BirthdayVerifyAct;

    .line 4
    .line 5
    iget-object v2, p0, Ll/z03;->f:Landroid/widget/TextView;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/ob0;-><init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/z03;->b:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iget-object v2, p0, Ll/z03;->f:Landroid/widget/TextView;

    .line 13
    .line 14
    iget-object p0, p0, Ll/z03;->i:Ll/y20;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, p0}, Ll/ob0;->w(Landroid/view/View;Landroid/view/View;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x03;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z03;->c(Ll/x03;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z03;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
