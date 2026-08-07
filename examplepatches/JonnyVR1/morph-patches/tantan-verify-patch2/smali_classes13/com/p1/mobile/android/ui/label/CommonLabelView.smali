.class public Lcom/p1/mobile/android/ui/label/CommonLabelView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/ui/label/CommonLabelView$b;,
        Lcom/p1/mobile/android/ui/label/CommonLabelView$a;
    }
.end annotation


# static fields
.field public static j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ll/bkj0<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/android/ui/label/CommonLabelView$a;",
            ">;"
        }
    .end annotation
.end field

.field public static l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public static m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/android/ui/label/CommonLabelView$b;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public a:I

.field public b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

.field public c:Ll/r8r;

.field public d:Landroid/text/TextPaint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Path;

.field public g:Landroid/graphics/PorterDuffXfermode;

.field public h:Landroid/graphics/Rect;

.field public i:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->k:Ljava/util/HashMap;

    .line 14
    .line 15
    new-instance v0, Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->l:Ljava/util/HashMap;

    .line 21
    .line 22
    new-instance v0, Ljava/util/HashMap;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 35
    .line 36
    sget v3, Ll/qa00;->k:I

    .line 37
    .line 38
    const/high16 v4, 0x41100000    # 9.0f

    .line 39
    .line 40
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    sget v5, Ll/qa00;->i:I

    .line 45
    .line 46
    sget v6, Ll/qa00;->a:I

    .line 47
    .line 48
    sget v7, Ll/qa00;->d:I

    .line 49
    .line 50
    sget v8, Ll/qa00;->e:I

    .line 51
    .line 52
    move v9, v8

    .line 53
    move v10, v3

    .line 54
    invoke-direct/range {v2 .. v10}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;-><init>(IIIIIIII)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 61
    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    move v7, v5

    .line 68
    new-instance v5, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 69
    .line 70
    sget v6, Ll/qa00;->o:I

    .line 71
    .line 72
    sget v8, Ll/qa00;->j:I

    .line 73
    .line 74
    sget v9, Ll/qa00;->c:I

    .line 75
    .line 76
    sget v10, Ll/qa00;->f:I

    .line 77
    .line 78
    sget v11, Ll/qa00;->g:I

    .line 79
    .line 80
    sget v13, Ll/qa00;->m:I

    .line 81
    .line 82
    move v12, v10

    .line 83
    invoke-direct/range {v5 .. v13}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;-><init>(IIIIIIII)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 90
    .line 91
    const/4 v1, 0x2

    .line 92
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    move v10, v8

    .line 97
    new-instance v8, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 98
    .line 99
    move v12, v9

    .line 100
    sget v9, Ll/qa00;->q:I

    .line 101
    .line 102
    sget v14, Ll/qa00;->h:I

    .line 103
    .line 104
    sget v16, Ll/qa00;->n:I

    .line 105
    .line 106
    move v15, v11

    .line 107
    move/from16 v17, v13

    .line 108
    .line 109
    move v13, v11

    .line 110
    move/from16 v11, v17

    .line 111
    .line 112
    invoke-direct/range {v8 .. v16}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;-><init>(IIIIIIII)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 104
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 103
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 13
    .line 14
    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    .line 15
    .line 16
    sget-object v3, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 17
    .line 18
    invoke-direct {v2, v3}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g:Landroid/graphics/PorterDuffXfermode;

    .line 22
    .line 23
    if-eqz p2, :cond_2

    .line 24
    .line 25
    sget-object v2, Ll/hhc0;->y:[I

    .line 26
    .line 27
    const/4 v3, 0x0

    .line 28
    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    sget p3, Ll/hhc0;->A:I

    .line 33
    .line 34
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 35
    .line 36
    .line 37
    move-result p3

    .line 38
    if-ltz p3, :cond_1

    .line 39
    .line 40
    iput p3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 41
    .line 42
    sget-object v1, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object p3

    .line 48
    invoke-virtual {v1, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p3

    .line 52
    check-cast p3, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 53
    .line 54
    iput-object p3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 55
    .line 56
    iget p3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 57
    .line 58
    invoke-static {p1, p3}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i(Landroid/content/Context;I)V

    .line 59
    .line 60
    .line 61
    sget p1, Ll/hhc0;->B:I

    .line 62
    .line 63
    invoke-virtual {p2, p1, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    sget p3, Ll/hhc0;->z:I

    .line 68
    .line 69
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-ltz p3, :cond_0

    .line 74
    .line 75
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/LabelModule;->getLabel(I)Lcom/p1/mobile/android/ui/label/LabelModule;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {v0, p1, p3}, Ll/t8r;->b(Lcom/p1/mobile/android/ui/label/LabelModule;I)Ll/r8r;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 88
    .line 89
    :cond_0
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    const-string p0, "\u521b\u5efa\u6807\u7b7e\u5fc5\u987b\u8981\u643a\u5e26\u6807\u7b7e\u5c3a\u5bf8"

    .line 94
    .line 95
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    throw v1

    .line 99
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b()V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/p1/mobile/android/ui/label/LabelStyle;)Lcom/p1/mobile/android/ui/label/CommonLabelView;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->setSizeStyle(Lcom/p1/mobile/android/ui/label/LabelStyle;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/label/LabelStyle;->getSize()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i(Landroid/content/Context;I)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static i(Landroid/content/Context;I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget v0, Ll/abc0;->m:I

    .line 20
    .line 21
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 26
    .line 27
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {p0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    const/4 v0, 0x1

    .line 56
    if-ne p1, v0, :cond_1

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    sget v0, Ll/abc0;->m:I

    .line 63
    .line 64
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 69
    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {p0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    const/4 v0, 0x2

    .line 99
    if-ne p1, v0, :cond_2

    .line 100
    .line 101
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget v0, Ll/abc0;->m:I

    .line 106
    .line 107
    invoke-static {p0, v0}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 112
    .line 113
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {p0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    :cond_2
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 3

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Landroid/graphics/Path;

    .line 20
    .line 21
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 25
    .line 26
    new-instance v0, Landroid/graphics/Rect;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 33
    .line 34
    new-instance v0, Landroid/graphics/RectF;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-direct {v0, v2, v2, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 41
    .line 42
    new-instance v0, Landroid/text/TextPaint;

    .line 43
    .line 44
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 53
    .line 54
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-direct {v0, p0, v1, v2}, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;-><init>(Landroid/graphics/Bitmap;II)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->k:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    :cond_0
    return-object v0
.end method

.method public final d(Ljava/lang/String;Z)Ll/pf60;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->b(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget p2, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->b:I

    .line 23
    .line 24
    :goto_0
    sget-object v1, Lcom/p1/mobile/android/ui/label/CommonLabelView;->l:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/util/HashMap;

    .line 35
    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    new-instance v1, Ljava/util/HashMap;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    sget-object v2, Lcom/p1/mobile/android/ui/label/CommonLabelView;->l:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, Ll/pf60;

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 66
    .line 67
    if-nez v2, :cond_3

    .line 68
    .line 69
    new-instance v2, Landroid/text/TextPaint;

    .line 70
    .line 71
    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 75
    .line 76
    const/4 v3, 0x1

    .line 77
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 78
    .line 79
    .line 80
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 81
    .line 82
    int-to-float p2, p2

    .line 83
    invoke-virtual {v2, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 87
    .line 88
    sget-object v2, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 89
    .line 90
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 94
    .line 95
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    float-to-int p2, p2

    .line 100
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 107
    .line 108
    iget-object v3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 109
    .line 110
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 115
    .line 116
    sub-float/2addr v2, v3

    .line 117
    iget v0, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 118
    .line 119
    int-to-float v3, v0

    .line 120
    int-to-float v0, v0

    .line 121
    sub-float/2addr v0, v2

    .line 122
    const/high16 v2, 0x40000000    # 2.0f

    .line 123
    .line 124
    div-float/2addr v0, v2

    .line 125
    sub-float/2addr v3, v0

    .line 126
    iget-object p0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iget p0, p0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 133
    .line 134
    sub-float/2addr v3, p0

    .line 135
    float-to-int p0, v3

    .line 136
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    check-cast p0, Ll/pf60;

    .line 156
    .line 157
    return-object p0
.end method

.method public final e(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 2
    .line 3
    iget v0, v0, Ll/r8r;->e:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->b:I

    .line 12
    .line 13
    iget v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->c:I

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    int-to-float v2, v2

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    int-to-float v3, v3

    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 33
    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->a:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final f(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 2
    .line 3
    iget v0, v0, Ll/r8r;->b:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 10
    .line 11
    iget v2, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->b:I

    .line 12
    .line 13
    iget v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->c:I

    .line 14
    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 20
    .line 21
    invoke-static {v1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 26
    .line 27
    iget v3, v2, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c:I

    .line 28
    .line 29
    div-int/lit8 v4, v3, 0x2

    .line 30
    .line 31
    add-int/2addr v1, v4

    .line 32
    iget v2, v2, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 33
    .line 34
    div-int/lit8 v2, v2, 0x2

    .line 35
    .line 36
    iget v4, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->b:I

    .line 37
    .line 38
    iget v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->c:I

    .line 39
    .line 40
    iget-object v6, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 41
    .line 42
    const/high16 v7, 0x40000000    # 2.0f

    .line 43
    .line 44
    if-le v4, v5, :cond_0

    .line 45
    .line 46
    int-to-float v3, v3

    .line 47
    int-to-float v8, v4

    .line 48
    div-float/2addr v3, v8

    .line 49
    int-to-float v1, v1

    .line 50
    int-to-float v8, v4

    .line 51
    mul-float/2addr v8, v3

    .line 52
    div-float/2addr v8, v7

    .line 53
    sub-float v8, v1, v8

    .line 54
    .line 55
    int-to-float v2, v2

    .line 56
    int-to-float v9, v5

    .line 57
    mul-float/2addr v9, v3

    .line 58
    div-float/2addr v9, v7

    .line 59
    sub-float v9, v2, v9

    .line 60
    .line 61
    int-to-float v4, v4

    .line 62
    mul-float/2addr v4, v3

    .line 63
    div-float/2addr v4, v7

    .line 64
    add-float/2addr v1, v4

    .line 65
    int-to-float v4, v5

    .line 66
    mul-float/2addr v4, v3

    .line 67
    div-float/2addr v4, v7

    .line 68
    add-float/2addr v2, v4

    .line 69
    invoke-virtual {v6, v8, v9, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_0
    int-to-float v3, v3

    .line 74
    int-to-float v8, v5

    .line 75
    div-float/2addr v3, v8

    .line 76
    int-to-float v1, v1

    .line 77
    int-to-float v8, v4

    .line 78
    mul-float/2addr v8, v3

    .line 79
    div-float/2addr v8, v7

    .line 80
    sub-float v8, v1, v8

    .line 81
    .line 82
    int-to-float v2, v2

    .line 83
    int-to-float v9, v5

    .line 84
    mul-float/2addr v9, v3

    .line 85
    div-float/2addr v9, v7

    .line 86
    sub-float v9, v2, v9

    .line 87
    .line 88
    int-to-float v4, v4

    .line 89
    mul-float/2addr v4, v3

    .line 90
    div-float/2addr v4, v7

    .line 91
    add-float/2addr v1, v4

    .line 92
    int-to-float v4, v5

    .line 93
    mul-float/2addr v4, v3

    .line 94
    div-float/2addr v4, v7

    .line 95
    add-float/2addr v2, v4

    .line 96
    invoke-virtual {v6, v8, v9, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->a:Landroid/graphics/Bitmap;

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 102
    .line 103
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public g(Ll/r8r;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h(Landroid/graphics/Canvas;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 2
    .line 3
    iget-object v1, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/r8r;->f()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d(Ljava/lang/String;Z)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 16
    .line 17
    invoke-virtual {v2}, Ll/r8r;->f()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget-object v3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-static {v3}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->b(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    :goto_0
    int-to-float v2, v2

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    iget v2, v3, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->b:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 38
    .line 39
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 40
    .line 41
    iget v2, v2, Ll/r8r;->d:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/r8r;->b()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 55
    .line 56
    iget v1, v1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c:I

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_1
    const/4 v1, 0x0

    .line 60
    :goto_2
    iget-object v2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 61
    .line 62
    iget-object v2, v2, Ll/r8r;->a:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v3, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 65
    .line 66
    invoke-static {v3}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    add-int/2addr v3, v1

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 72
    .line 73
    iget v1, v1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->d:I

    .line 74
    .line 75
    add-int/2addr v3, v1

    .line 76
    int-to-float v1, v3

    .line 77
    iget-object v0, v0, Ll/pf60;->b:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast v0, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    int-to-float v0, v0

    .line 86
    iget-object p0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d:Landroid/text/TextPaint;

    .line 87
    .line 88
    invoke-virtual {p1, v2, v1, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object p1, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 19
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {v1}, Ll/r8r;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v4, v1

    .line 26
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v5, v1

    .line 31
    const/4 v6, 0x0

    .line 32
    const/16 v7, 0x1f

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    const/4 v3, 0x0

    .line 36
    move-object/from16 v1, p1

    .line 37
    .line 38
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 43
    .line 44
    const/4 v4, 0x0

    .line 45
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 46
    .line 47
    .line 48
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 49
    .line 50
    iget v3, v3, Ll/r8r;->c:I

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 53
    .line 54
    .line 55
    sget-object v3, Lcom/p1/mobile/android/ui/label/CommonLabelView;->j:Ljava/util/HashMap;

    .line 56
    .line 57
    iget v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 58
    .line 59
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    invoke-virtual {v3, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ll/bkj0;

    .line 68
    .line 69
    if-nez v3, :cond_2

    .line 70
    .line 71
    :goto_0
    return-void

    .line 72
    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v5

    .line 76
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 77
    .line 78
    .line 79
    move-result v6

    .line 80
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 81
    .line 82
    iget v7, v7, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 83
    .line 84
    int-to-float v8, v5

    .line 85
    iget-object v9, v3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 86
    .line 87
    check-cast v9, Ljava/lang/Integer;

    .line 88
    .line 89
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v9

    .line 93
    int-to-float v9, v9

    .line 94
    mul-float/2addr v8, v9

    .line 95
    int-to-float v6, v6

    .line 96
    div-float/2addr v8, v6

    .line 97
    float-to-int v8, v8

    .line 98
    iget-object v9, v3, Ll/bkj0;->b:Ljava/lang/Object;

    .line 99
    .line 100
    check-cast v9, Ljava/lang/Integer;

    .line 101
    .line 102
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    .line 103
    .line 104
    .line 105
    move-result v9

    .line 106
    invoke-static {v8, v9}, Ljava/lang/Math;->min(II)I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    iget-object v9, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 111
    .line 112
    iget-object v10, v3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast v10, Ljava/lang/Integer;

    .line 115
    .line 116
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 117
    .line 118
    .line 119
    move-result v10

    .line 120
    const/4 v11, 0x0

    .line 121
    invoke-virtual {v9, v11, v11, v8, v10}, Landroid/graphics/Rect;->set(IIII)V

    .line 122
    .line 123
    .line 124
    int-to-float v8, v8

    .line 125
    mul-float/2addr v8, v6

    .line 126
    iget-object v6, v3, Ll/bkj0;->c:Ljava/lang/Object;

    .line 127
    .line 128
    check-cast v6, Ljava/lang/Integer;

    .line 129
    .line 130
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    int-to-float v6, v6

    .line 135
    div-float/2addr v8, v6

    .line 136
    float-to-int v6, v8

    .line 137
    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 142
    .line 143
    int-to-float v5, v5

    .line 144
    int-to-float v7, v7

    .line 145
    const/4 v8, 0x0

    .line 146
    invoke-virtual {v6, v8, v8, v5, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 147
    .line 148
    .line 149
    iget-object v3, v3, Ll/bkj0;->a:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast v3, Landroid/graphics/Bitmap;

    .line 152
    .line 153
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h:Landroid/graphics/Rect;

    .line 154
    .line 155
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->i:Landroid/graphics/RectF;

    .line 156
    .line 157
    iget-object v7, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {v1, v3, v5, v6, v7}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 163
    .line 164
    invoke-virtual {v3}, Ll/r8r;->b()Z

    .line 165
    .line 166
    .line 167
    move-result v3

    .line 168
    if-eqz v3, :cond_3

    .line 169
    .line 170
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f(Landroid/graphics/Canvas;)V

    .line 171
    .line 172
    .line 173
    :cond_3
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 174
    .line 175
    invoke-virtual {v3}, Ll/r8r;->c()Z

    .line 176
    .line 177
    .line 178
    move-result v3

    .line 179
    if-eqz v3, :cond_4

    .line 180
    .line 181
    invoke-virtual/range {p0 .. p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->h(Landroid/graphics/Canvas;)V

    .line 182
    .line 183
    .line 184
    :cond_4
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 185
    .line 186
    const/4 v5, -0x1

    .line 187
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 188
    .line 189
    .line 190
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 191
    .line 192
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 193
    .line 194
    .line 195
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 196
    .line 197
    sget-object v5, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 198
    .line 199
    invoke-virtual {v3, v5}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 200
    .line 201
    .line 202
    iget-object v6, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 203
    .line 204
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    add-int/lit8 v3, v3, 0x1

    .line 209
    .line 210
    int-to-float v9, v3

    .line 211
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    add-int/lit8 v3, v3, 0x1

    .line 216
    .line 217
    int-to-float v10, v3

    .line 218
    sget-object v18, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 219
    .line 220
    const/high16 v7, -0x40800000    # -1.0f

    .line 221
    .line 222
    const/high16 v8, -0x40800000    # -1.0f

    .line 223
    .line 224
    move-object/from16 v11, v18

    .line 225
    .line 226
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 227
    .line 228
    .line 229
    iget-object v11, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 230
    .line 231
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 232
    .line 233
    .line 234
    move-result v3

    .line 235
    int-to-float v14, v3

    .line 236
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    int-to-float v15, v3

    .line 241
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 242
    .line 243
    invoke-static {v3}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->d(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 244
    .line 245
    .line 246
    move-result v3

    .line 247
    int-to-float v3, v3

    .line 248
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 249
    .line 250
    invoke-static {v5}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->d(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 251
    .line 252
    .line 253
    move-result v5

    .line 254
    int-to-float v5, v5

    .line 255
    const/4 v12, 0x0

    .line 256
    const/4 v13, 0x0

    .line 257
    move/from16 v16, v3

    .line 258
    .line 259
    move/from16 v17, v5

    .line 260
    .line 261
    invoke-virtual/range {v11 .. v18}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 262
    .line 263
    .line 264
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 265
    .line 266
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g:Landroid/graphics/PorterDuffXfermode;

    .line 267
    .line 268
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 269
    .line 270
    .line 271
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 272
    .line 273
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 274
    .line 275
    .line 276
    iget-object v3, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->f:Landroid/graphics/Path;

    .line 277
    .line 278
    iget-object v5, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 279
    .line 280
    invoke-virtual {v1, v3, v5}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 281
    .line 282
    .line 283
    iget-object v0, v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->e:Landroid/graphics/Paint;

    .line 284
    .line 285
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 289
    .line 290
    .line 291
    return-void
.end method

.method public onMeasure(II)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 5
    .line 6
    iget p2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 7
    .line 8
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 19
    .line 20
    if-eqz p2, :cond_4

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :cond_0
    invoke-virtual {p2}, Ll/r8r;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget p2, v0, Ll/r8r;->e:I

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget p1, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 41
    .line 42
    iget v0, p2, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->b:I

    .line 43
    .line 44
    mul-int/2addr v0, p1

    .line 45
    iget p2, p2, Lcom/p1/mobile/android/ui/label/CommonLabelView$a;->c:I

    .line 46
    .line 47
    div-int/2addr v0, p2

    .line 48
    goto/16 :goto_1

    .line 49
    .line 50
    :cond_1
    invoke-virtual {v0}, Ll/r8r;->e()Z

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 55
    .line 56
    if-eqz p2, :cond_2

    .line 57
    .line 58
    iget p2, v0, Ll/r8r;->b:I

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 61
    .line 62
    .line 63
    iget p2, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 64
    .line 65
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    iget v1, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c:I

    .line 70
    .line 71
    add-int/2addr v0, v1

    .line 72
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    add-int/2addr v0, p1

    .line 77
    move p1, p2

    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {v0}, Ll/r8r;->f()Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 84
    .line 85
    if-eqz p2, :cond_3

    .line 86
    .line 87
    iget-object p2, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/r8r;->f()Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d(Ljava/lang/String;Z)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 98
    .line 99
    check-cast p2, Ljava/lang/Integer;

    .line 100
    .line 101
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    iget v0, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 106
    .line 107
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iget v2, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->d:I

    .line 112
    .line 113
    add-int/2addr v1, v2

    .line 114
    add-int/2addr v1, p2

    .line 115
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    :goto_0
    add-int/2addr p1, v1

    .line 120
    move v3, v0

    .line 121
    move v0, p1

    .line 122
    move p1, v3

    .line 123
    goto :goto_1

    .line 124
    :cond_3
    iget-object p2, v0, Ll/r8r;->a:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/r8r;->f()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->d(Ljava/lang/String;Z)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p2

    .line 134
    iget-object p2, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast p2, Ljava/lang/Integer;

    .line 137
    .line 138
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 139
    .line 140
    .line 141
    move-result p2

    .line 142
    iget-object v0, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c:Ll/r8r;

    .line 143
    .line 144
    iget v0, v0, Ll/r8r;->b:I

    .line 145
    .line 146
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->c(I)Lcom/p1/mobile/android/ui/label/CommonLabelView$a;

    .line 147
    .line 148
    .line 149
    iget v0, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a:I

    .line 150
    .line 151
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->a(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    iget v2, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c:I

    .line 156
    .line 157
    add-int/2addr v1, v2

    .line 158
    iget v2, p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->d:I

    .line 159
    .line 160
    add-int/2addr v1, v2

    .line 161
    add-int/2addr v1, p2

    .line 162
    invoke-static {p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;->c(Lcom/p1/mobile/android/ui/label/CommonLabelView$b;)I

    .line 163
    .line 164
    .line 165
    move-result p1

    .line 166
    goto :goto_0

    .line 167
    :goto_1
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :cond_4
    :goto_2
    const/4 p1, 0x0

    .line 172
    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public setSizeStyle(Lcom/p1/mobile/android/ui/label/LabelStyle;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/label/LabelStyle;->getSize()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a:I

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->m:Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 20
    .line 21
    iput-object p1, p0, Lcom/p1/mobile/android/ui/label/CommonLabelView;->b:Lcom/p1/mobile/android/ui/label/CommonLabelView$b;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "\u521b\u5efa\u6807\u7b7e\u5fc5\u987b\u8981\u643a\u5e26\u6807\u7b7e\u5c3a\u5bf8"

    .line 25
    .line 26
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
