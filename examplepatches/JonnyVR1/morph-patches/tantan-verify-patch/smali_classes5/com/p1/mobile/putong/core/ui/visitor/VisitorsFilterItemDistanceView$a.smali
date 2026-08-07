.class public Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;
.super Lv/VSlider$a;
.source "SourceFile"


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

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 4
    .line 5
    invoke-direct {p0}, Lv/VSlider$a;-><init>()V

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
    check-cast p1, Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;->c(Lv/VSlider;ZF)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Lv/VSlider;ZF)V
    .locals 1
    .param p1    # Lv/VSlider;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Lv/VSlider$a;->c(Lv/VSlider;ZF)V

    .line 2
    .line 3
    .line 4
    float-to-int p1, p3

    .line 5
    invoke-static {}, Ll/afm0;->c()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {}, Ll/afm0;->b()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    invoke-static {}, Ll/afm0;->c()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sub-int/2addr p3, v0

    .line 18
    mul-int/lit16 p1, p1, 0x3e8

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    add-int/2addr p2, p1

    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;->a:Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 31
    .line 32
    iput p2, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView$a;->b:Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/VisitorsFilterItemDistanceView;->a:Lv/VText;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/p1/mobile/putong/core/ui/visitor/e;->b(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
