.class public final Le3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lacl;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Le3g;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Le3g;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 13
    iput-byte p3, p0, Le3g;->a:B

    iput-object p1, p0, Le3g;->b:Ljava/lang/Object;

    iput-object p2, p0, Le3g;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lkol;Lqnl;Landroid/net/Uri;)V
    .registers 4

    const/4 p3, 0x3

    iput-byte p3, p0, Le3g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le3g;->b:Ljava/lang/Object;

    iput-object p2, p0, Le3g;->c:Ljava/lang/Object;

    return-void
.end method

.method private final d(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 3

    return-void
.end method

.method private final e(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method

.method private final f(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Exception;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    iget-byte p1, p0, Le3g;->a:B

    const/4 p2, 0x0

    iget-object v0, p0, Le3g;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_2a

    check-cast v0, Lkol;

    iget-object p1, v0, Lkol;->k:Ljava/util/LinkedHashSet;

    invoke-interface {p1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Le3g;->c:Ljava/lang/Object;

    check-cast p0, Lqnl;

    invoke-virtual {p0, p2}, Lqnl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :pswitch_16
    return-void

    :pswitch_17
    iget-object p0, p0, Le3g;->c:Ljava/lang/Object;

    check-cast p0, Lq2g;

    invoke-virtual {p0}, Lq2g;->run()V

    return-void

    :pswitch_1f
    check-cast v0, Lf3g;

    iput-object p2, v0, Lf3g;->h:Le3g;

    iget-object p0, v0, Lf3g;->g:Lwpk;

    invoke-virtual {p0}, Lwpk;->run()V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_1f
        :pswitch_17
        :pswitch_16
    .end packed-switch
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    iget-byte v0, p0, Le3g;->a:B

    iget-object p0, p0, Le3g;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_28

    return-void

    :pswitch_8
    if-eqz p1, :cond_14

    check-cast p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    new-instance v0, Lmxh;

    invoke-direct {v0, p1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_14
    :pswitch_14
    return-void

    :pswitch_15
    check-cast p0, Lf3g;

    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iget-object p0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    new-instance v0, Lmxh;

    invoke-direct {v0, p1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_15
        :pswitch_14
        :pswitch_8
    .end packed-switch
.end method

.method public final c(Landroid/graphics/Bitmap;I)V
    .registers 10

    iget-byte p2, p0, Le3g;->a:B

    const/4 v0, 0x0

    const v1, 0x7f04067b

    iget-object v2, p0, Le3g;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_a6

    check-cast v2, Lkol;

    iget-object p2, v2, Lkol;->k:Ljava/util/LinkedHashSet;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, p0, Le3g;->c:Ljava/lang/Object;

    check-cast p0, Lqnl;

    invoke-virtual {p0, p1}, Lqnl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1a
    check-cast v2, Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iget-object p0, p0, Le3g;->c:Ljava/lang/Object;

    check-cast p0, Lzri;

    iget p0, p0, Lzri;->h:I

    int-to-float p0, p0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    div-float/2addr v1, p2

    mul-float/2addr v1, p0

    float-to-int p0, v1

    sget-object p2, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance p2, Lq8i;

    invoke-direct {p2, p1, p0, p0}, Lq8i;-><init>(Landroid/graphics/Bitmap;II)V

    new-instance p0, Lmxh;

    invoke-direct {p0, p2}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v2, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void

    :pswitch_48
    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    filled-new-array {v1}, [I

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p2, Luq8;

    invoke-static {p0}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v1

    invoke-direct {p2, p0, v1, v0, p1}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v2, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_6a
    check-cast v2, Lf3g;

    const/4 p2, 0x0

    iput-object p2, v2, Lf3g;->h:Le3g;

    iget-object p2, v2, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, v2, Lfmj;->e:I

    filled-new-array {v1}, [I

    move-result-object v1

    invoke-virtual {v3, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v1

    invoke-virtual {v1, v0, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v1, Luq8;

    invoke-static {v3}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v6

    invoke-direct {v1, v3, v6, v5, p1}, Luq8;-><init>(Landroid/content/Context;Lgjf;ILandroid/graphics/Bitmap;)V

    invoke-virtual {v1, v0, v0, v4, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    new-instance p1, Lmxh;

    invoke-direct {p1, v1}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p2, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    iget-object p1, v2, Lf3g;->f:Lnv6;

    iget-object p0, p0, Le3g;->c:Ljava/lang/Object;

    check-cast p0, Lfqk;

    iget-object p0, p0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p1, p0}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    return-void

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_6a
        :pswitch_48
        :pswitch_1a
    .end packed-switch
.end method
