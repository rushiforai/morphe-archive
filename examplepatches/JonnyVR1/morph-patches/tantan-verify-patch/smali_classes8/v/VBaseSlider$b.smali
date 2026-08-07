.class public Lv/VBaseSlider$b;
.super Ll/dpf;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/VBaseSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Lv/VBaseSlider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lv/VBaseSlider<",
            "***>;"
        }
    .end annotation
.end field

.field public b:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Lv/VBaseSlider;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lv/VBaseSlider<",
            "***>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/dpf;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lv/VBaseSlider$b;->b:Landroid/graphics/Rect;

    .line 10
    .line 11
    iput-object p1, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(I)Ljava/lang/String;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VBaseSlider;->getValues()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    add-int/lit8 p0, p0, -0x1

    .line 12
    .line 13
    if-ne p1, p0, :cond_0

    .line 14
    .line 15
    const-string p0, "Range end,"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    if-nez p1, :cond_1

    .line 19
    .line 20
    const-string p0, "Range start,"

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, ""

    .line 24
    .line 25
    return-object p0
.end method

.method public getVirtualViewAt(FF)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 3
    .line 4
    invoke-virtual {v1}, Lv/VBaseSlider;->getValues()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 15
    .line 16
    iget-object v2, p0, Lv/VBaseSlider$b;->b:Landroid/graphics/Rect;

    .line 17
    .line 18
    invoke-virtual {v1, v0, v2}, Lv/VBaseSlider;->X(ILandroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lv/VBaseSlider$b;->b:Landroid/graphics/Rect;

    .line 22
    .line 23
    float-to-int v2, p1

    .line 24
    float-to-int v3, p2

    .line 25
    invoke-virtual {v1, v2, v3}, Landroid/graphics/Rect;->contains(II)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    return v0

    .line 32
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 p0, -0x1

    .line 36
    return p0
.end method

.method public getVisibleVirtualViews(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 3
    .line 4
    invoke-virtual {v1}, Lv/VBaseSlider;->getValues()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    add-int/lit8 v0, v0, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-void
.end method

.method public onPerformActionForVirtualView(IILandroid/os/Bundle;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    const/16 v0, 0x1000

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    const/16 v3, 0x2000

    .line 15
    .line 16
    if-eq p2, v0, :cond_4

    .line 17
    .line 18
    if-eq p2, v3, :cond_4

    .line 19
    .line 20
    const v0, 0x102003d

    .line 21
    .line 22
    .line 23
    if-eq p2, v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    if-eqz p3, :cond_3

    .line 27
    .line 28
    const-string p2, "android.view.accessibility.action.ARGUMENT_PROGRESS_VALUE"

    .line 29
    .line 30
    invoke-virtual {p3, p2}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_2

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    iget-object p3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 42
    .line 43
    invoke-static {p3, p1, p2}, Lv/VBaseSlider;->e(Lv/VBaseSlider;IF)Z

    .line 44
    .line 45
    .line 46
    move-result p2

    .line 47
    if-eqz p2, :cond_3

    .line 48
    .line 49
    iget-object p2, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 50
    .line 51
    invoke-virtual {p2}, Landroid/view/View;->postInvalidate()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ll/dpf;->invalidateVirtualView(I)V

    .line 55
    .line 56
    .line 57
    return v2

    .line 58
    :cond_3
    :goto_0
    return v1

    .line 59
    :cond_4
    iget-object p3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 60
    .line 61
    const/16 v0, 0x14

    .line 62
    .line 63
    invoke-static {p3, v0}, Lv/VBaseSlider;->c(Lv/VBaseSlider;I)F

    .line 64
    .line 65
    .line 66
    move-result p3

    .line 67
    if-ne p2, v3, :cond_5

    .line 68
    .line 69
    neg-float p3, p3

    .line 70
    :cond_5
    iget-object p2, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 71
    .line 72
    invoke-virtual {p2}, Lv/VBaseSlider;->E()Z

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    if-eqz p2, :cond_6

    .line 77
    .line 78
    neg-float p3, p3

    .line 79
    :cond_6
    iget-object p2, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 80
    .line 81
    invoke-virtual {p2}, Lv/VBaseSlider;->getValues()Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    check-cast p2, Ljava/lang/Float;

    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    add-float/2addr p2, p3

    .line 96
    iget-object p3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 97
    .line 98
    invoke-virtual {p3}, Lv/VBaseSlider;->getValueFrom()F

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    iget-object v0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 103
    .line 104
    invoke-virtual {v0}, Lv/VBaseSlider;->getValueTo()F

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    invoke-static {p2, p3, v0}, Ll/jhx;->a(FFF)F

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    iget-object p3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 113
    .line 114
    invoke-static {p3, p1, p2}, Lv/VBaseSlider;->e(Lv/VBaseSlider;IF)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_7

    .line 119
    .line 120
    iget-object p2, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 121
    .line 122
    invoke-virtual {p2}, Landroid/view/View;->postInvalidate()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0, p1}, Ll/dpf;->invalidateVirtualView(I)V

    .line 126
    .line 127
    .line 128
    return v2

    .line 129
    :cond_7
    return v1
.end method

.method public onPopulateNodeForVirtualView(ILl/bc;)V
    .locals 5

    .line 1
    sget-object v0, Ll/bc$a;->L:Ll/bc$a;

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Ll/bc;->b(Ll/bc$a;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 7
    .line 8
    invoke-virtual {v0}, Lv/VBaseSlider;->getValues()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Float;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iget-object v2, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 23
    .line 24
    invoke-virtual {v2}, Lv/VBaseSlider;->getValueFrom()F

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    iget-object v3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 29
    .line 30
    invoke-virtual {v3}, Lv/VBaseSlider;->getValueTo()F

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget-object v4, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/view/View;->isEnabled()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_1

    .line 41
    .line 42
    cmpl-float v4, v1, v2

    .line 43
    .line 44
    if-lez v4, :cond_0

    .line 45
    .line 46
    const/16 v4, 0x2000

    .line 47
    .line 48
    invoke-virtual {p2, v4}, Ll/bc;->a(I)V

    .line 49
    .line 50
    .line 51
    :cond_0
    cmpg-float v4, v1, v3

    .line 52
    .line 53
    if-gez v4, :cond_1

    .line 54
    .line 55
    const/16 v4, 0x1000

    .line 56
    .line 57
    invoke-virtual {p2, v4}, Ll/bc;->a(I)V

    .line 58
    .line 59
    .line 60
    :cond_1
    const/4 v4, 0x1

    .line 61
    invoke-static {v4, v2, v3, v1}, Ll/bc$g;->a(IFFF)Ll/bc$g;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {p2, v2}, Ll/bc;->H0(Ll/bc$g;)V

    .line 66
    .line 67
    .line 68
    const-class v2, Landroid/widget/SeekBar;

    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {p2, v2}, Ll/bc;->o0(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 83
    .line 84
    invoke-virtual {v3}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    if-eqz v3, :cond_2

    .line 89
    .line 90
    iget-object v3, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 91
    .line 92
    invoke-virtual {v3}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v3, ","

    .line 100
    .line 101
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-le v0, v4, :cond_3

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Lv/VBaseSlider$b;->a(I)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 118
    .line 119
    invoke-static {v0, v1}, Lv/VBaseSlider;->d(Lv/VBaseSlider;F)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p2, v0}, Ll/bc;->s0(Ljava/lang/CharSequence;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lv/VBaseSlider$b;->a:Lv/VBaseSlider;

    .line 134
    .line 135
    iget-object v1, p0, Lv/VBaseSlider$b;->b:Landroid/graphics/Rect;

    .line 136
    .line 137
    invoke-virtual {v0, p1, v1}, Lv/VBaseSlider;->X(ILandroid/graphics/Rect;)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Lv/VBaseSlider$b;->b:Landroid/graphics/Rect;

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Ll/bc;->j0(Landroid/graphics/Rect;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method
