.class public Ll/uwb0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/uwb0;->e(Landroid/view/View;ILcom/p1/mobile/putong/core/data/VirtualCardType;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/widget/LinearLayout;

.field public final synthetic b:Ll/uwb0;


# direct methods
.method public constructor <init>(Ll/uwb0;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/uwb0$a;->b:Ll/uwb0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    .line 1
    sub-int/2addr p5, p3

    .line 2
    const/high16 p1, 0x43c80000    # 400.0f

    .line 3
    .line 4
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    const/4 p2, 0x0

    .line 9
    if-le p5, p1, :cond_0

    .line 10
    .line 11
    :goto_0
    iget-object p1, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-ge p2, p1, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Landroid/widget/LinearLayout$LayoutParams;

    .line 30
    .line 31
    const/high16 p4, 0x42900000    # 72.0f

    .line 32
    .line 33
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p4

    .line 37
    iput p4, p3, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 38
    .line 39
    const/4 p4, 0x0

    .line 40
    iput p4, p3, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 p2, p2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    move p1, p2

    .line 49
    :goto_1
    iget-object p3, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 50
    .line 51
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-ge p1, p3, :cond_1

    .line 56
    .line 57
    iget-object p3, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 64
    .line 65
    .line 66
    move-result-object p4

    .line 67
    check-cast p4, Landroid/widget/LinearLayout$LayoutParams;

    .line 68
    .line 69
    iput p2, p4, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 70
    .line 71
    const/high16 p5, 0x3f800000    # 1.0f

    .line 72
    .line 73
    iput p5, p4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 74
    .line 75
    invoke-virtual {p3, p4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 p1, p1, 0x1

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_1
    iget-object p1, p0, Ll/uwb0$a;->a:Landroid/widget/LinearLayout;

    .line 82
    .line 83
    invoke-virtual {p1, p0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
