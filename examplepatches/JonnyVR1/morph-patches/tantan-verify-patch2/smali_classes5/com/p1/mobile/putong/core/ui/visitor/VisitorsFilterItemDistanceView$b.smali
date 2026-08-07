.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lv/VSlider$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->d(Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

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
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;->c(Lv/VSlider;)V

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
    .end param

    .line 1
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;->d(Lv/VSlider;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;)V
    .locals 0
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public d(Lv/VSlider;)V
    .locals 1
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$b;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "suggest_see_user_search_radius"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {p0}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string p1, "e_advanced_filter_distance"

    .line 20
    .line 21
    const-string v0, "p_my_visitor"

    .line 22
    .line 23
    invoke-static {p1, v0, p0}, Ll/i4g0;->v(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
