.class public Lcom/opera/hype/image/editor/ImageEditorActivity;
.super Lfp1;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0016\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/hype/image/editor/ImageEditorActivity;",
        "Lfp1;",
        "<init>",
        "()V",
        "image-editor"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final d:Landroid/graphics/Bitmap$CompressFormat;


# instance fields
.field public final a:Lzyk;

.field public final b:Lzyk;

.field public final c:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    sput-object v0, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lfp1;-><init>()V

    new-instance v0, Lpwa;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpwa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/hype/image/editor/ImageEditorActivity;->a:Lzyk;

    new-instance v0, Lpwa;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lpwa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/hype/image/editor/ImageEditorActivity;->b:Lzyk;

    new-instance v0, Lpwa;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lpwa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance v0, Lpwa;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lpwa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    new-instance v0, Lpwa;

    const/4 v1, 0x4

    invoke-direct {v0, p0, v1}, Lpwa;-><init>(Lcom/opera/hype/image/editor/ImageEditorActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/hype/image/editor/ImageEditorActivity;->c:Lzyk;

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1}, Landroidx/fragment/app/r;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d020a

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_75

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lfp1;->setContentView(Landroid/view/View;)V

    if-nez p1, :cond_74

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_2c

    const-string v0, "output"

    const-class v1, Landroid/net/Uri;

    invoke-static {p1, v0, v1}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    check-cast p1, Landroid/net/Uri;

    goto :goto_2d

    :cond_2c
    move-object p1, v3

    :goto_2d
    if-nez p1, :cond_33

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_33
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "output-properties"

    if-eqz p1, :cond_46

    const-class v1, Lluf;

    invoke-static {p1, v0, v1}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    check-cast p1, Lluf;

    goto :goto_47

    :cond_46
    move-object p1, v3

    :goto_47
    if-nez p1, :cond_56

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_56

    invoke-virtual {p0}, Lcom/opera/hype/image/editor/ImageEditorActivity;->s()Lluf;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :cond_56
    new-instance p1, Laxa;

    invoke-direct {p1}, Laxa;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroidx/fragment/app/a;

    invoke-direct {v0, p0}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {v0, p1}, Landroidx/fragment/app/a;->n(Laxa;)Landroidx/fragment/app/a;

    const p0, 0x7f0a026e

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v3, v1}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    invoke-virtual {v0}, Landroidx/fragment/app/a;->h()I

    :cond_74
    return-void

    :cond_75
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final s()Lluf;
    .registers 11

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a7

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x22

    if-lt v2, v3, :cond_12

    invoke-static {v0}, Lt8;->A(Landroid/content/Intent;)Ljava/io/Serializable;

    move-result-object v2

    goto :goto_21

    :cond_12
    const-string v2, "output-format"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    const-class v3, Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_21

    move-object v2, v1

    :cond_21
    :goto_21
    check-cast v2, Landroid/graphics/Bitmap$CompressFormat;

    if-nez v2, :cond_27

    sget-object v2, Lcom/opera/hype/image/editor/ImageEditorActivity;->d:Landroid/graphics/Bitmap$CompressFormat;

    :cond_27
    move-object v4, v2

    const-string v2, "output-quality"

    const/16 v3, 0x64

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    if-ltz v2, :cond_3a

    const/16 v6, 0x65

    if-lt v2, v6, :cond_3b

    :cond_3a
    move-object v5, v1

    :cond_3b
    if-eqz v5, :cond_41

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    :cond_41
    move v5, v3

    const-string v2, "output-max-size"

    const-class v3, Landroid/graphics/Point;

    invoke-static {v0, v2, v3}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    check-cast v2, Landroid/graphics/Point;

    if-eqz v2, :cond_5d

    iget v3, v2, Landroid/graphics/Point;->x:I

    if-lez v3, :cond_59

    iget v3, v2, Landroid/graphics/Point;->y:I

    if-lez v3, :cond_59

    move-object v1, v2

    :cond_59
    if-eqz v1, :cond_5d

    :goto_5b
    move-object v6, v1

    goto :goto_78

    :cond_5d
    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    new-instance v1, Landroid/graphics/Point;

    iget v2, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v2, v2

    const v3, 0x3f99999a    # 1.2f

    mul-float/2addr v2, v3

    float-to-int v2, v2

    iget p0, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float p0, p0

    mul-float/2addr p0, v3

    float-to-int p0, p0

    invoke-direct {v1, v2, p0}, Landroid/graphics/Point;-><init>(II)V

    goto :goto_5b

    :goto_78
    const-string p0, "output-description"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, ""

    if-nez p0, :cond_84

    move-object v7, v1

    goto :goto_85

    :cond_84
    move-object v7, p0

    :goto_85
    const-string p0, "output-comment"

    invoke-virtual {v0, p0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_8f

    move-object v8, v1

    goto :goto_90

    :cond_8f
    move-object v8, p0

    :goto_90
    const-string p0, "output-watermark-strategy"

    const-class v1, Lqnn;

    invoke-static {v0, p0, v1}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Parcelable;

    check-cast p0, Lqnn;

    if-nez p0, :cond_a0

    sget-object p0, Lqnn;->a:Lqnn;

    :cond_a0
    move-object v9, p0

    new-instance v3, Lluf;

    invoke-direct/range {v3 .. v9}, Lluf;-><init>(Landroid/graphics/Bitmap$CompressFormat;ILandroid/graphics/Point;Ljava/lang/String;Ljava/lang/String;Lqnn;)V

    return-object v3

    :cond_a7
    return-object v1
.end method
