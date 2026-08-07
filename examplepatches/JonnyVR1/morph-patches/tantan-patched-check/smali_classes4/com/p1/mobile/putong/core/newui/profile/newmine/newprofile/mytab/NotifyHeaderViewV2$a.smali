.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/FakeGuideData;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->changeAvatar:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "mainAvatar"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FakeGuideData;->type:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;->f(Ll/uxj0;)Z

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
    const-string p0, "fakeGuideStrategy"

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->b:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 14
    .line 15
    const-string p1, "\u8bf7\u7acb\u5373\u66f4\u6362\u771f\u5b9e\u5934\u50cf\uff0c\u4ee5\u514d\u5f71\u54cd\u4f60\u5728\u5212\u5361\u7684\u66dd\u5149"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2$a;->a:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/mytab/NotifyHeaderViewV2;->e:Lrx/subjects/a;

    .line 4
    .line 5
    new-instance v0, Ll/o250;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/o250;-><init>()V

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

.method public f(Ll/uxj0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
