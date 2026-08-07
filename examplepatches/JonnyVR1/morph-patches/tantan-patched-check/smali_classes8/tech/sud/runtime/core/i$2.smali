.class Ltech/sud/runtime/core/i$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/core/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final a:Landroid/graphics/Rect;

.field final synthetic b:Ltech/sud/runtime/core/i;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ltech/sud/runtime/core/i$2;->a:Landroid/graphics/Rect;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 2
    .line 3
    invoke-static {v0}, Ltech/sud/runtime/core/i;->g(Ltech/sud/runtime/core/i;)Landroid/view/Window;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 12
    .line 13
    and-int/lit16 v0, v0, 0x200

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->a:Landroid/graphics/Rect;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 24
    .line 25
    invoke-static {v0}, Ltech/sud/runtime/core/i;->h(Ltech/sud/runtime/core/i;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object v1, p0, Ltech/sud/runtime/core/i$2;->a:Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->a:Landroid/graphics/Rect;

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 41
    .line 42
    invoke-static {v1}, Ltech/sud/runtime/core/i;->i(Ltech/sud/runtime/core/i;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-object v2, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 47
    .line 48
    if-nez v1, :cond_1

    .line 49
    .line 50
    invoke-static {v2, v0}, Ltech/sud/runtime/core/i;->c(Ltech/sud/runtime/core/i;I)I

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 54
    .line 55
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ltech/sud/runtime/component/c/h;->b(Landroid/content/Context;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {p0, v0}, Ltech/sud/runtime/core/i;->a(Ltech/sud/runtime/core/i;Z)Z

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    invoke-static {v2}, Ltech/sud/runtime/core/i;->i(Ltech/sud/runtime/core/i;)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-ne v1, v0, :cond_2

    .line 72
    .line 73
    :goto_0
    return-void

    .line 74
    :cond_2
    iget-object v1, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 75
    .line 76
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-static {v1}, Ltech/sud/runtime/component/c/h;->b(Landroid/content/Context;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    iget-object v2, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 85
    .line 86
    invoke-static {v2}, Ltech/sud/runtime/core/i;->j(Ltech/sud/runtime/core/i;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    iget-object v3, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    if-eq v1, v2, :cond_4

    .line 94
    .line 95
    invoke-static {v3, v0}, Ltech/sud/runtime/core/i;->c(Ltech/sud/runtime/core/i;I)I

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 99
    .line 100
    invoke-static {v0, v1}, Ltech/sud/runtime/core/i;->a(Ltech/sud/runtime/core/i;Z)Z

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 104
    .line 105
    invoke-static {v0}, Ltech/sud/runtime/core/i;->k(Ltech/sud/runtime/core/i;)Ltech/sud/runtime/component/e/d;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    if-eqz v0, :cond_3

    .line 110
    .line 111
    iget-object v0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 112
    .line 113
    invoke-static {v0}, Ltech/sud/runtime/core/i;->k(Ltech/sud/runtime/core/i;)Ltech/sud/runtime/component/e/d;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Ltech/sud/runtime/component/e/d;->b()V

    .line 118
    .line 119
    .line 120
    :cond_3
    iget-object p0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 121
    .line 122
    invoke-static {p0, v4}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;Z)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_4
    invoke-static {v3}, Ltech/sud/runtime/core/i;->i(Ltech/sud/runtime/core/i;)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    sub-int/2addr v1, v0

    .line 131
    iget-object v2, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 132
    .line 133
    const/16 v3, 0xc8

    .line 134
    .line 135
    if-le v1, v3, :cond_5

    .line 136
    .line 137
    const/4 v1, 0x1

    .line 138
    invoke-static {v2, v1}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;Z)V

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_5
    invoke-static {v2}, Ltech/sud/runtime/core/i;->i(Ltech/sud/runtime/core/i;)I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    sub-int v1, v0, v1

    .line 147
    .line 148
    if-le v1, v3, :cond_6

    .line 149
    .line 150
    iget-object v1, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 151
    .line 152
    invoke-static {v1, v4}, Ltech/sud/runtime/core/i;->b(Ltech/sud/runtime/core/i;Z)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 156
    .line 157
    invoke-static {v1}, Ltech/sud/runtime/core/i;->l(Ltech/sud/runtime/core/i;)Ltech/sud/runtime/core/i$a;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-interface {v1}, Ltech/sud/runtime/core/i$a;->a()V

    .line 162
    .line 163
    .line 164
    :cond_6
    :goto_1
    iget-object p0, p0, Ltech/sud/runtime/core/i$2;->b:Ltech/sud/runtime/core/i;

    .line 165
    .line 166
    invoke-static {p0, v0}, Ltech/sud/runtime/core/i;->c(Ltech/sud/runtime/core/i;I)I

    .line 167
    .line 168
    .line 169
    return-void
.end method
