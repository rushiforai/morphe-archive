.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VRangeSlider$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->b(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->c(Lv/VRangeSlider;)V

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->d(Lv/VRangeSlider;)V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    iget p1, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "suggest_see_user_search_max_age"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$b;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "suggest_see_user_search_min_age"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    filled-new-array {p1, p0}, [Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "e_advanced_filter_age"

    .line 34
    .line 35
    const-string v0, "p_my_visitor"

    .line 36
    .line 37
    invoke-static {p1, v0, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
