.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cp50;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;ZF)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->c(Lv/VRangeSlider;ZF)V

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
    .end param

    .line 1
    check-cast p1, Lv/VRangeSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->d(Lv/VRangeSlider;ZFF)V

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
    .end param

    .line 1
    return-void
.end method

.method public d(Lv/VRangeSlider;ZFF)V
    .locals 0
    .param p1    # Lv/VRangeSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    float-to-int p1, p3

    .line 2
    invoke-static {}, Ll/afm0;->e()I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    float-to-int p2, p4

    .line 11
    invoke-static {}, Ll/afm0;->d()I

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 20
    .line 21
    iput p1, p3, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 22
    .line 23
    iput p2, p3, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView$a;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemAgeView;->a:Lv/VText;

    .line 28
    .line 29
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/e;->a(II)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
