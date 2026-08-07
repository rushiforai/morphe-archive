.class public Ll/ww80$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ww80;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ww80;


# direct methods
.method public constructor <init>(Ll/ww80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ww80$b;->a:Ll/ww80;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/ww80$b;->a:Ll/ww80;

    .line 2
    .line 3
    invoke-static {p1}, Ll/ww80;->u(Ll/ww80;)Ll/hw80;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/hw80;->l1()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/ww80$b;->a:Ll/ww80;

    .line 11
    .line 12
    invoke-static {p0}, Ll/ww80;->s(Ll/ww80;)Lcom/p1/mobile/putong/data/Settings;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->onlineReminder:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    const-string p0, "off2on"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const-string p0, "on2off"

    .line 34
    .line 35
    :goto_0
    new-instance p1, Ll/pf60;

    .line 36
    .line 37
    const-string v0, "push_switch_change"

    .line 38
    .line 39
    invoke-direct {p1, v0, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    filled-new-array {p1}, [Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    const-string p1, "e_friend_active_remind"

    .line 47
    .line 48
    const-string v0, "p_privacy_and_permission_settings_view"

    .line 49
    .line 50
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method
