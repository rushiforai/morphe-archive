.class Lcom/flipboard/bottomsheet/BottomSheetLayout$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flipboard/bottomsheet/BottomSheetLayout;->D(Landroid/view/View;Ll/nml0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/flipboard/bottomsheet/BottomSheetLayout;


# direct methods
.method public constructor <init>(Lcom/flipboard/bottomsheet/BottomSheetLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 6
    .line 7
    invoke-static {p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget-object p3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->HIDDEN:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 12
    .line 13
    if-eq p2, p3, :cond_3

    .line 14
    .line 15
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 16
    .line 17
    invoke-static {p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h(Lcom/flipboard/bottomsheet/BottomSheetLayout;)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iget-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 22
    .line 23
    if-ge p1, p2, :cond_1

    .line 24
    .line 25
    invoke-static {p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    sget-object p3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 30
    .line 31
    if-ne p2, p3, :cond_0

    .line 32
    .line 33
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 34
    .line 35
    sget-object p3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 36
    .line 37
    invoke-static {p2, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->j(Lcom/flipboard/bottomsheet/BottomSheetLayout;Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 41
    .line 42
    int-to-float p3, p1

    .line 43
    invoke-static {p2, p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b(Lcom/flipboard/bottomsheet/BottomSheetLayout;F)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    invoke-static {p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h(Lcom/flipboard/bottomsheet/BottomSheetLayout;)I

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-lez p2, :cond_3

    .line 52
    .line 53
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 54
    .line 55
    invoke-static {p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->h(Lcom/flipboard/bottomsheet/BottomSheetLayout;)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-le p1, p2, :cond_3

    .line 60
    .line 61
    iget-object p2, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 62
    .line 63
    invoke-static {p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->g(Lcom/flipboard/bottomsheet/BottomSheetLayout;)Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    sget-object p3, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->PEEKED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 68
    .line 69
    if-ne p2, p3, :cond_3

    .line 70
    .line 71
    int-to-float p2, p1

    .line 72
    iget-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 73
    .line 74
    invoke-virtual {p3}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->getMaxSheetTranslation()F

    .line 75
    .line 76
    .line 77
    move-result p3

    .line 78
    cmpl-float p3, p2, p3

    .line 79
    .line 80
    if-nez p3, :cond_2

    .line 81
    .line 82
    iget-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 83
    .line 84
    sget-object p4, Lcom/flipboard/bottomsheet/BottomSheetLayout$State;->EXPANDED:Lcom/flipboard/bottomsheet/BottomSheetLayout$State;

    .line 85
    .line 86
    invoke-static {p3, p4}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->j(Lcom/flipboard/bottomsheet/BottomSheetLayout;Lcom/flipboard/bottomsheet/BottomSheetLayout$State;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    iget-object p3, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 90
    .line 91
    invoke-static {p3, p2}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->b(Lcom/flipboard/bottomsheet/BottomSheetLayout;F)V

    .line 92
    .line 93
    .line 94
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/flipboard/bottomsheet/BottomSheetLayout$f;->a:Lcom/flipboard/bottomsheet/BottomSheetLayout;

    .line 95
    .line 96
    invoke-static {p0, p1}, Lcom/flipboard/bottomsheet/BottomSheetLayout;->i(Lcom/flipboard/bottomsheet/BottomSheetLayout;I)I

    .line 97
    .line 98
    .line 99
    return-void
.end method
