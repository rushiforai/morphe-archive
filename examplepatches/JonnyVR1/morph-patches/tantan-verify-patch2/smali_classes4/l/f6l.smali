.class public abstract Ll/f6l;
.super Ll/dmf;
.source "SourceFile"


# instance fields
.field public e:Ll/jm50;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/dmf;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_3

    .line 6
    .line 7
    sget-object p0, Ll/f6l$a;->a:[I

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    aget p0, p0, p1

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    if-eq p0, p1, :cond_2

    .line 19
    .line 20
    const/4 p1, 0x3

    .line 21
    if-eq p0, p1, :cond_1

    .line 22
    .line 23
    const/4 p1, 0x4

    .line 24
    if-eq p0, p1, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string p0, "p_confirm_new_profile"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_1
    const-string p0, "p_edit_profile_view"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_2
    const-string p0, "p_suggest_user_profile_info_view"

    .line 34
    .line 35
    return-object p0

    .line 36
    :cond_3
    :goto_0
    const-string p0, "p_suggest_users_home_view"

    .line 37
    .line 38
    return-object p0
.end method

.method public abstract B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
.end method

.method public C(Ll/jm50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f6l;->e:Ll/jm50;

    .line 2
    .line 3
    return-void
.end method

.method public w()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dmf;->m()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-object p0
.end method

.method public x(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f6l;->e:Ll/jm50;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/jm50;->J()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/f6l;->e:Ll/jm50;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/jm50;->J()Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    iget-object p0, p0, Ll/f6l;->e:Ll/jm50;

    .line 30
    .line 31
    invoke-interface {p0}, Ll/jm50;->J()Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p0, Ljava/lang/CharSequence;

    .line 38
    .line 39
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public y()V
    .locals 0

    .line 1
    return-void
.end method

.method public z(F)V
    .locals 0

    .line 1
    return-void
.end method
