.class public Ll/fci;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fci$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object p0, p0, Ll/fci;->a:Lcom/p1/mobile/putong/data/User;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    check-cast p0, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 60
    .line 61
    iget p0, p0, Lcom/p1/mobile/putong/data/MomentLevel;->level:I

    .line 62
    .line 63
    return p0

    .line 64
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 65
    return p0
.end method
