.class public final Lx8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final c:[I

.field public static final d:[I

.field public static final e:[I

.field public static final f:[I

.field public static final g:[I

.field public static final h:[I

.field public static final i:[I

.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I

.field public static final n:[I


# instance fields
.field public final synthetic a:B

.field public final b:Lff2;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    const v0, 0x7f0400a2

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->c:[I

    const v0, 0x7f04015a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->d:[I

    const v0, 0x7f0404f6

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->e:[I

    const v0, 0x7f04054b

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->f:[I

    const v0, 0x1010119

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->g:[I

    const v0, 0x7f0408c9

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->h:[I

    const v0, 0x7f0408ca

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->i:[I

    const v0, 0x7f040155

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->j:[I

    const v0, 0x7f0406d2

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->k:[I

    const v0, 0x7f04078a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->l:[I

    const v0, 0x7f040412

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->m:[I

    const v0, 0x1010054

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lx8n;->n:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    const/16 v0, 0x9

    iput-byte v0, p0, Lx8n;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    const v1, 0x1010054

    iput v1, v0, Landroid/util/TypedValue;->data:I

    iput v1, v0, Landroid/util/TypedValue;->resourceId:I

    const/4 v1, 0x2

    iput v1, v0, Landroid/util/TypedValue;->type:I

    new-instance v1, Lff2;

    sget-object v2, Lx8n;->n:[I

    invoke-direct {v1, v2, v0}, Lff2;-><init>([ILandroid/util/TypedValue;)V

    iput-object v1, p0, Lx8n;->b:Lff2;

    return-void
.end method

.method public synthetic constructor <init>(Lff2;B)V
    .registers 3

    .line 32
    iput-byte p2, p0, Lx8n;->a:B

    iput-object p1, p0, Lx8n;->b:Lff2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lx8n;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lx8n;->b:Lff2;

    packed-switch v0, :pswitch_data_14e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1d

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-static {p1, p0}, Lq9n;->B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_1d
    return-void

    :pswitch_1e
    move-object v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    if-eqz p0, :cond_2b

    invoke-virtual {p0, v2}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    :cond_2b
    if-eqz v1, :cond_3b

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_3b

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    iget-object v1, v0, Lcom/opera/android/settings/SettingsStatisticView;->d:Lx9j;

    iput p0, v1, Lx9j;->c:I

    :cond_3b
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsStatisticView;->a(Landroid/content/Context;)V

    return-void

    :pswitch_43
    move-object v0, p1

    check-cast v0, Lcom/opera/android/custom_views/PageDotIndicator;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_5b

    invoke-static {p1, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_5b

    iput-object p0, v0, Lcom/opera/android/custom_views/PageDotIndicator;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_5b
    return-void

    :pswitch_5c
    instance-of v0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz v0, :cond_8a

    if-eqz p0, :cond_8a

    check-cast p1, Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_8a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_8a

    iput-object p0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;->l:Landroid/content/res/ColorStateList;

    iget-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;->i:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8a

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    iput-object v0, p1, Landroidx/mediarouter/app/OperaMediaRouteButton;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    :cond_8a
    return-void

    :pswitch_8b
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_99

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_99
    check-cast p1, Lwdd;

    if-eqz v1, :cond_a0

    invoke-virtual {p1, v1}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_a0
    return-void

    :pswitch_a1
    instance-of v0, p1, Landroid/widget/ImageView;

    if-eqz v0, :cond_c0

    if-eqz p0, :cond_c0

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_c0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_c0

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_c0
    return-void

    :pswitch_c1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_e6

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_e6

    instance-of v0, p1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v0, :cond_db

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    goto :goto_e6

    :cond_db
    instance-of v0, p1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_e6

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lcom/opera/android/custom_views/StylingTextView;->h:Lua7;

    invoke-virtual {p1, p0}, Lua7;->M(Landroid/content/res/ColorStateList;)V

    :cond_e6
    :goto_e6
    return-void

    :pswitch_e7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_106

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_106

    instance-of v0, p1, Lcom/opera/android/custom_views/CardView;

    if-eqz v0, :cond_106

    check-cast p1, Lcom/opera/android/custom_views/CardView;

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    iput p0, p1, Lcom/opera/android/custom_views/CardView;->l:I

    invoke-virtual {p1}, Lcom/opera/android/custom_views/CardView;->d()V

    :cond_106
    return-void

    :pswitch_107
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_131

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_131

    instance-of v0, p1, Lcom/opera/android/custom_views/CardView;

    if-eqz v0, :cond_128

    move-object v0, p1

    check-cast v0, Lcom/opera/android/custom_views/CardView;

    iput-object p0, v0, Lcom/opera/android/custom_views/CardView;->e:Landroid/content/res/ColorStateList;

    iget-object v1, v0, Lcom/opera/android/custom_views/CardView;->d:Lua7;

    invoke-virtual {v1, p0}, Lua7;->M(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_128
    instance-of v0, p1, Landroidx/cardview/widget/CardView;

    if-eqz v0, :cond_131

    check-cast p1, Landroidx/cardview/widget/CardView;

    invoke-virtual {p1, p0}, Landroidx/cardview/widget/CardView;->c(Landroid/content/res/ColorStateList;)V

    :cond_131
    return-void

    :pswitch_132
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_14d

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_14d

    instance-of v0, p1, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v0, :cond_14d

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    iget-object p1, p1, Lcom/opera/android/custom_views/StylingImageView;->e:Lua7;

    invoke-virtual {p1, p0}, Lua7;->M(Landroid/content/res/ColorStateList;)V

    :cond_14d
    return-void

    :pswitch_data_14e
    .packed-switch 0x0
        :pswitch_132
        :pswitch_107
        :pswitch_e7
        :pswitch_c1
        :pswitch_a1
        :pswitch_8b
        :pswitch_5c
        :pswitch_43
        :pswitch_1e
    .end packed-switch
.end method
