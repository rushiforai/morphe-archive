.class public final Ll/eix$a;
.super Landroidx/recyclerview/widget/RecyclerView$y;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/eix;->a(Landroidx/recyclerview/widget/RecyclerView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u001f\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "l/eix$a",
        "Landroidx/recyclerview/widget/RecyclerView$y;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "rv",
        "Landroid/view/MotionEvent;",
        "e",
        "",
        "c",
        "(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lkotlin/jvm/internal/Ref$FloatRef;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$FloatRef;

.field public final synthetic c:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic d:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic e:F

.field public final synthetic f:I


# direct methods
.method public constructor <init>(Lkotlin/jvm/internal/Ref$FloatRef;Lkotlin/jvm/internal/Ref$FloatRef;Lkotlin/jvm/internal/Ref$BooleanRef;Lkotlin/jvm/internal/Ref$BooleanRef;FI)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eix$a;->a:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 2
    .line 3
    iput-object p2, p0, Ll/eix$a;->b:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 4
    .line 5
    iput-object p3, p0, Ll/eix$a;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 6
    .line 7
    iput-object p4, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 8
    .line 9
    iput p5, p0, Ll/eix$a;->e:F

    .line 10
    .line 11
    iput p6, p0, Ll/eix$a;->f:I

    .line 12
    .line 13
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$y;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public c(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x1

    .line 12
    const/4 v2, 0x0

    .line 13
    if-eqz v0, :cond_6

    .line 14
    .line 15
    if-eq v0, v1, :cond_4

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    if-eq v0, v3, :cond_0

    .line 19
    .line 20
    const/4 p2, 0x3

    .line 21
    if-eq v0, p2, :cond_4

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Ll/eix$a;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 26
    .line 27
    iget-boolean v0, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 28
    .line 29
    if-nez v0, :cond_3

    .line 30
    .line 31
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v3, p0, Ll/eix$a;->a:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 36
    .line 37
    iget v3, v3, Lkotlin/jvm/internal/Ref$FloatRef;->element:F

    .line 38
    .line 39
    sub-float/2addr v0, v3

    .line 40
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iget-object v3, p0, Ll/eix$a;->b:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 49
    .line 50
    iget v3, v3, Lkotlin/jvm/internal/Ref$FloatRef;->element:F

    .line 51
    .line 52
    sub-float/2addr p2, v3

    .line 53
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iget v3, p0, Ll/eix$a;->e:F

    .line 58
    .line 59
    cmpl-float v3, v0, v3

    .line 60
    .line 61
    if-gtz v3, :cond_1

    .line 62
    .line 63
    iget v3, p0, Ll/eix$a;->f:I

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    cmpl-float v3, p2, v3

    .line 67
    .line 68
    if-lez v3, :cond_7

    .line 69
    .line 70
    :cond_1
    iget-object v3, p0, Ll/eix$a;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 71
    .line 72
    iput-boolean v1, v3, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 73
    .line 74
    iget-object v3, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 75
    .line 76
    const v4, 0x3f266666    # 0.65f

    .line 77
    .line 78
    .line 79
    mul-float/2addr p2, v4

    .line 80
    cmpl-float p2, v0, p2

    .line 81
    .line 82
    if-ltz p2, :cond_2

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_2
    move v1, v2

    .line 86
    :goto_0
    iput-boolean v1, v3, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    if-eqz p1, :cond_7

    .line 93
    .line 94
    iget-object p0, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 95
    .line 96
    iget-boolean p0, p0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 97
    .line 98
    invoke-interface {p1, p0}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 99
    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    iget-object p0, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 103
    .line 104
    iget-boolean p0, p0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 105
    .line 106
    if-eqz p0, :cond_7

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    if-eqz p0, :cond_7

    .line 113
    .line 114
    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    if-eqz p1, :cond_5

    .line 123
    .line 124
    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 125
    .line 126
    .line 127
    :cond_5
    iget-object p1, p0, Ll/eix$a;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 128
    .line 129
    iput-boolean v2, p1, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 130
    .line 131
    iget-object p0, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 132
    .line 133
    iput-boolean v2, p0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_6
    iget-object v0, p0, Ll/eix$a;->a:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 137
    .line 138
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    iput v3, v0, Lkotlin/jvm/internal/Ref$FloatRef;->element:F

    .line 143
    .line 144
    iget-object v0, p0, Ll/eix$a;->b:Lkotlin/jvm/internal/Ref$FloatRef;

    .line 145
    .line 146
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iput p2, v0, Lkotlin/jvm/internal/Ref$FloatRef;->element:F

    .line 151
    .line 152
    iget-object p2, p0, Ll/eix$a;->c:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 153
    .line 154
    iput-boolean v2, p2, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 155
    .line 156
    iget-object p0, p0, Ll/eix$a;->d:Lkotlin/jvm/internal/Ref$BooleanRef;

    .line 157
    .line 158
    iput-boolean v2, p0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    .line 159
    .line 160
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    if-eqz p0, :cond_7

    .line 165
    .line 166
    invoke-interface {p0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 167
    .line 168
    .line 169
    :cond_7
    :goto_1
    return v2
.end method
