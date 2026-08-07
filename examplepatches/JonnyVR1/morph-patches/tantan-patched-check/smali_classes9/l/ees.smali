.class public Ll/ees;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lv/VText;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lv/VText;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->backgroundColor:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->backgroundColor:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {v0, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget v2, Ll/qa00;->l:I

    .line 31
    .line 32
    int-to-float v2, v2

    .line 33
    const/16 v3, 0x8

    .line 34
    .line 35
    new-array v3, v3, [F

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    aput v4, v3, v1

    .line 39
    .line 40
    const/4 v5, 0x1

    .line 41
    aput v4, v3, v5

    .line 42
    .line 43
    const/4 v5, 0x2

    .line 44
    aput v4, v3, v5

    .line 45
    .line 46
    const/4 v5, 0x3

    .line 47
    aput v4, v3, v5

    .line 48
    .line 49
    const/4 v4, 0x4

    .line 50
    aput v2, v3, v4

    .line 51
    .line 52
    const/4 v4, 0x5

    .line 53
    aput v2, v3, v4

    .line 54
    .line 55
    const/4 v4, 0x6

    .line 56
    aput v2, v3, v4

    .line 57
    .line 58
    const/4 v4, 0x7

    .line 59
    aput v2, v3, v4

    .line 60
    .line 61
    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    iget-object v0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->fields:Ljava/util/List;

    .line 70
    .line 71
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;->fields:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    check-cast p0, Ljava/lang/CharSequence;

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 88
    .line 89
    .line 90
    :cond_2
    :goto_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    check-cast p1, Ll/ees;

    .line 19
    .line 20
    iget-object p0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 21
    .line 22
    iget-object p1, p1, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ees;->a:Lcom/p1/mobile/putong/live/base/data/BLiveTaskSummary;

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->z3:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ees;->H(Lv/VText;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
