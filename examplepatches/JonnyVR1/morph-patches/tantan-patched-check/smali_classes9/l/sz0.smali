.class public Ll/sz0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rz0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/rz0;

.field public final b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/sz0;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/view/BottomView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public a(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 6
    .line 7
    const/high16 p1, 0x40400000    # 3.0f

    .line 8
    .line 9
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 14
    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 20
    .line 21
    const-string p1, "newUserTreasureBoxButton"

    .line 22
    .line 23
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    const/high16 p1, 0x40c00000    # 6.0f

    .line 30
    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/high16 p1, 0x41200000    # 10.0f

    .line 39
    .line 40
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput p1, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 45
    .line 46
    return-void
.end method

.method public b(Ll/rz0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sz0;->a:Ll/rz0;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rz0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/sz0;->b(Ll/rz0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
