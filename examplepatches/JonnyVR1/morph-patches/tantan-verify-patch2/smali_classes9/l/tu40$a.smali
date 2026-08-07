.class public Ll/tu40$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tu40;->r(Ll/zq90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/zq90;

.field public final synthetic b:Ll/tu40;


# direct methods
.method public constructor <init>(Ll/tu40;Ll/zq90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tu40$a;->b:Ll/tu40;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tu40$a;->a:Ll/zq90;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/tu40$a;Ll/zq90;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/tu40$a;->c(Ll/zq90;[I)V

    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic c(Ll/zq90;[I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/high16 v2, 0x42700000    # 60.0f

    .line 8
    .line 9
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v1, v2

    .line 14
    invoke-static {}, Ll/fcp;->y()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/d79;->V()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    move v14, v1

    .line 28
    goto :goto_2

    .line 29
    :cond_1
    :goto_1
    const/4 v1, 0x2

    .line 30
    new-array v2, v1, [I

    .line 31
    .line 32
    iget-object v3, v0, Ll/tu40$a;->b:Ll/tu40;

    .line 33
    .line 34
    iget-object v3, v3, Ll/tu40;->l:Lv/VImage;

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 37
    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    aget v2, v2, v3

    .line 41
    .line 42
    const/high16 v3, 0x42180000    # 38.0f

    .line 43
    .line 44
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    add-int/2addr v2, v3

    .line 49
    mul-int/2addr v2, v1

    .line 50
    const/high16 v1, 0x41a00000    # 20.0f

    .line 51
    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sub-int v1, v2, v1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :goto_2
    invoke-virtual/range {p1 .. p1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Landroid/view/View;->getRootView()Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    move-object v2, v1

    .line 76
    check-cast v2, Landroid/view/ViewGroup;

    .line 77
    .line 78
    iget-object v0, v0, Ll/tu40$a;->b:Ll/tu40;

    .line 79
    .line 80
    iget-object v3, v0, Ll/tu40;->l:Lv/VImage;

    .line 81
    .line 82
    invoke-virtual/range {p1 .. p1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    sget v1, Ll/dbc0;->f:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v4

    .line 92
    invoke-virtual/range {p1 .. p1}, Ll/zq90;->a()Lcom/p1/mobile/android/app/Act;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Vk:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    new-instance v18, Ll/su40;

    .line 103
    .line 104
    invoke-direct/range {v18 .. v18}, Ll/su40;-><init>()V

    .line 105
    .line 106
    .line 107
    const/4 v6, -0x1

    .line 108
    const/16 v7, 0xe

    .line 109
    .line 110
    const/16 v8, 0x11

    .line 111
    .line 112
    const/16 v9, 0xbb8

    .line 113
    .line 114
    const/4 v10, 0x0

    .line 115
    const/4 v11, 0x0

    .line 116
    const/4 v12, 0x0

    .line 117
    const/4 v13, 0x0

    .line 118
    const/16 v15, 0x11

    .line 119
    .line 120
    const/16 v16, 0x0

    .line 121
    .line 122
    const/16 v17, 0x0

    .line 123
    .line 124
    invoke-static/range {v2 .. v18}, Ll/qnp0;->b1(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIIIIIIIIIZLl/x20;)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tu40$a;->b:Ll/tu40;

    .line 2
    .line 3
    iget-object v0, v0, Ll/tu40;->l:Lv/VImage;

    .line 4
    .line 5
    iget-object v1, p0, Ll/tu40$a;->a:Ll/zq90;

    .line 6
    .line 7
    new-instance v2, Ll/ru40;

    .line 8
    .line 9
    invoke-direct {v2, p0, v1}, Ll/ru40;-><init>(Ll/tu40$a;Ll/zq90;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
