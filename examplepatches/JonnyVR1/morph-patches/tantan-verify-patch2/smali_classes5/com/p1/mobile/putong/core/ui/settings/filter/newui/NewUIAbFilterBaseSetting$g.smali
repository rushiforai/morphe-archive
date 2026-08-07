.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cp50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Settings;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->c:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->b:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->c(Lv/VRangeSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;ZFF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->d(Lv/VRangeSlider;ZFF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VRangeSlider;ZF)V
    .locals 0
    .param p1    # Lv/VRangeSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public d(Lv/VRangeSlider;ZFF)V
    .locals 0
    .param p1    # Lv/VRangeSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    int-to-float p1, p1

    .line 12
    cmpl-float p1, p3, p1

    .line 13
    .line 14
    if-ltz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    int-to-float p1, p1

    .line 27
    cmpl-float p1, p4, p1

    .line 28
    .line 29
    if-ltz p1, :cond_0

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    int-to-float p1, p1

    .line 42
    cmpg-float p1, p3, p1

    .line 43
    .line 44
    if-gtz p1, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float p1, p1

    .line 57
    cmpg-float p1, p4, p1

    .line 58
    .line 59
    if-gtz p1, :cond_0

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 68
    .line 69
    float-to-int p2, p3

    .line 70
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 83
    .line 84
    float-to-int p2, p4

    .line 85
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iput-object p2, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$g;->b:Ljava/lang/Runnable;

    .line 92
    .line 93
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 94
    .line 95
    .line 96
    :cond_0
    return-void
.end method
