.class public final Lg9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final f:[I

.field public static final g:[I

.field public static final h:[I

.field public static final i:[I

.field public static final j:[I

.field public static final k:[I


# instance fields
.field public final a:Lff2;

.field public final b:Lff2;

.field public final c:Lff2;

.field public final d:Lff2;

.field public final e:Lff2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x7f040a0f

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->f:[I

    const v0, 0x7f04090a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->g:[I

    const v0, 0x7f040a10

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->h:[I

    const v0, 0x7f04090b

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->i:[I

    const v0, 0x7f0401ef

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->j:[I

    const v0, 0x10104ff

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lg9n;->k:[I

    return-void
.end method

.method public constructor <init>(Lff2;Lff2;Lff2;Lff2;Lff2;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lg9n;->a:Lff2;

    iput-object p2, p0, Lg9n;->b:Lff2;

    iput-object p3, p0, Lg9n;->c:Lff2;

    iput-object p4, p0, Lg9n;->d:Lff2;

    iput-object p5, p0, Lg9n;->e:Lff2;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    move-object v0, p1

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lg9n;->a:Lff2;

    if-eqz v1, :cond_1c

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_1c

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    iput v1, v0, Landroidx/appcompat/widget/Toolbar;->k:I

    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->b:Lyq1;

    if-eqz v2, :cond_1c

    invoke-virtual {v2, p1, v1}, Lyq1;->setTextAppearance(Landroid/content/Context;I)V

    :cond_1c
    iget-object v1, p0, Lg9n;->c:Lff2;

    if-eqz v1, :cond_40

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_40

    invoke-static {p1, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Landroidx/appcompat/widget/Toolbar;->y:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->b:Lyq1;

    if-eqz v2, :cond_40

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_40
    iget-object v1, p0, Lg9n;->b:Lff2;

    if-eqz v1, :cond_55

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_55

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    iput v1, v0, Landroidx/appcompat/widget/Toolbar;->l:I

    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->c:Lyq1;

    if-eqz v2, :cond_55

    invoke-virtual {v2, p1, v1}, Lyq1;->setTextAppearance(Landroid/content/Context;I)V

    :cond_55
    iget-object v1, p0, Lg9n;->d:Lff2;

    if-eqz v1, :cond_79

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_79

    invoke-static {p1, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_79

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, v0, Landroidx/appcompat/widget/Toolbar;->z:Landroid/content/res/ColorStateList;

    iget-object v2, v0, Landroidx/appcompat/widget/Toolbar;->c:Lyq1;

    if-eqz v2, :cond_79

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_79
    iget-object p0, p0, Lg9n;->e:Lff2;

    if-eqz p0, :cond_91

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_91

    invoke-static {p1, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_91

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->c()V

    iget-object p1, v0, Landroidx/appcompat/widget/Toolbar;->g:Landroidx/appcompat/widget/AppCompatImageButton;

    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_91
    return-void
.end method
