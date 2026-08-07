.class public Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;
.super Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag<",
        "Ll/ktl0;",
        "Ll/eul0;",
        ">;"
    }
.end annotation


# instance fields
.field public C:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/VipBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static O4(ILjava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "vip_selected_page"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    const-string p0, "vip_selected_from"

    .line 23
    .line 24
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public static P4(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string v2, "vip_selected_purchase_type"

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const-string p0, "vip_selected_from"

    .line 29
    .line 30
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 34
    .line 35
    .line 36
    return-object v0
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->Q4()Ll/ktl0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->R4()Ll/eul0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public Q4()Ll/ktl0;
    .locals 1

    .line 1
    new-instance v0, Ll/ktl0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ktl0;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R4()Ll/eul0;
    .locals 1

    .line 1
    new-instance v0, Ll/eul0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eul0;-><init>(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->z:Ll/ar2;

    .line 2
    .line 3
    check-cast p0, Ll/ktl0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ktl0;->y0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T4()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/eul0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eul0;->D0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public U4(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 12
    .line 13
    check-cast p0, Ll/eul0;

    .line 14
    .line 15
    invoke-virtual {p0, p1, v0}, Ll/eul0;->H0(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d$a;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public disableAutoPV()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public g4(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->g4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/eul0;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/eul0;->h0(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getFrom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->C:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/eul0;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/eul0;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongMvpFrag;->A:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/eul0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/eul0;->Q0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v0, 0x0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v1, "vip_selected_from"

    .line 20
    .line 21
    invoke-virtual {p1, v1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->C:Ljava/lang/String;

    .line 26
    .line 27
    new-instance p1, Lorg/json/JSONObject;

    .line 28
    .line 29
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 30
    .line 31
    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->C:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const-string v0, "showfrom"

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->C:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    const-string v0, "privilege_showfrom"

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;->C:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    move-exception v0

    .line 56
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 60
    .line 61
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    iget-object p0, p0, Lcom/p1/mobile/putong/app/PutongFrag;->pageHelper:Ll/l4g0;

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_privileges_view"

    .line 2
    .line 3
    return-object p0
.end method
