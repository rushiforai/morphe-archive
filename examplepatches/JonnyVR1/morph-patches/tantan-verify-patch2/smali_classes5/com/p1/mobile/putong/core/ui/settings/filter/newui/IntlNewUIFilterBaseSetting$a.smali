.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->d0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->r:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->V(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)Lcom/p1/mobile/putong/data/Settings;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->V(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)Lcom/p1/mobile/putong/data/Settings;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->V(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;)Lcom/p1/mobile/putong/data/Settings;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;->W(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting;I)Lcom/p1/mobile/putong/data/LookingFor;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/IntlNewUIFilterBaseSetting$a;->a(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterTagItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
