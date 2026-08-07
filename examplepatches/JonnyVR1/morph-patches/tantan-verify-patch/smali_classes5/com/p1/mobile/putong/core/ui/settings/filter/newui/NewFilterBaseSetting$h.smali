.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VRangeSlider$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Settings;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->b:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;)V
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->c(Lv/VRangeSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ljava/lang/Object;)V
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->d(Lv/VRangeSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VRangeSlider;)V
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

.method public d(Lv/VRangeSlider;)V
    .locals 1
    .param p1    # Lv/VRangeSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "suggest_see_user_search_max_age"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewFilterBaseSetting$h;->a:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "suggest_see_user_search_min_age"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_advanced_filter_age"

    .line 30
    .line 31
    const-string v0, "p_advanced_filter_page"

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
