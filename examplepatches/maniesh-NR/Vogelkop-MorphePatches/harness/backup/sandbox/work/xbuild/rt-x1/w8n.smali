.class public final Lw8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final e:[I

.field public static final f:[I

.field public static final g:[I

.field public static final h:[I

.field public static final i:[I

.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I


# instance fields
.field public final synthetic a:B

.field public final b:Lff2;

.field public final c:Lff2;

.field public final d:Lff2;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    const v0, 0x7f040096

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->e:[I

    const v0, 0x10100d4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->f:[I

    const v0, 0x101046b

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->g:[I

    const v0, 0x7f0400a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->h:[I

    const v0, 0x101046c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->i:[I

    const v0, 0x7f0400a1

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->j:[I

    const v0, 0x7f040348

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->k:[I

    const v0, 0x7f04044d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->l:[I

    const v0, 0x7f0401f7

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lw8n;->m:[I

    return-void
.end method

.method public synthetic constructor <init>(Lff2;Lff2;Lff2;B)V
    .registers 5

    iput-byte p4, p0, Lw8n;->a:B

    iput-object p1, p0, Lw8n;->b:Lff2;

    iput-object p2, p0, Lw8n;->c:Lff2;

    iput-object p3, p0, Lw8n;->d:Lff2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 8

    iget-byte v0, p0, Lw8n;->a:B

    iget-object v1, p0, Lw8n;->d:Lff2;

    iget-object v2, p0, Lw8n;->c:Lff2;

    iget-object p0, p0, Lw8n;->b:Lff2;

    packed-switch v0, :pswitch_data_f2

    move-object v0, p1

    check-cast v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v3, 0x7f06063b

    if-eqz p0, :cond_2d

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2d

    iget p0, p0, Landroid/util/TypedValue;->resourceId:I

    if-nez p0, :cond_26

    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    move-result p0

    goto :goto_2a

    :cond_26
    invoke-virtual {p1, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    :goto_2a
    invoke-virtual {v0, p0}, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->e(I)V

    :cond_2d
    if-eqz v2, :cond_55

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_55

    iget p0, p0, Landroid/util/TypedValue;->resourceId:I

    if-nez p0, :cond_3e

    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    move-result p0

    goto :goto_42

    :cond_3e
    invoke-virtual {p1, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    :goto_42
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    iget-object v2, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Lv85;

    iget-object v4, v2, Lv85;->o:Landroid/content/res/ColorStateList;

    if-eq v4, p0, :cond_55

    iput-object p0, v2, Lv85;->o:Landroid/content/res/ColorStateList;

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Lv85;->l(Z)V

    :cond_55
    if-eqz v1, :cond_76

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_76

    iget p0, p0, Landroid/util/TypedValue;->resourceId:I

    if-nez p0, :cond_66

    invoke-virtual {p1, v3}, Landroid/content/Context;->getColor(I)I

    move-result p0

    goto :goto_6a

    :cond_66
    invoke-virtual {p1, p0}, Landroid/content/Context;->getColor(I)I

    move-result p0

    :goto_6a
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    iget-object p1, v0, Lcom/google/android/material/appbar/CollapsingToolbarLayout;->l:Lv85;

    invoke-virtual {p1, p0}, Lv85;->r(Landroid/content/res/ColorStateList;)V

    :cond_76
    return-void

    :pswitch_77
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_f0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v3, p0, Landroid/util/TypedValue;->resourceId:I

    const/4 v4, 0x0

    if-nez v3, :cond_98

    iget v3, p0, Landroid/util/TypedValue;->type:I

    const/16 v5, 0x1c

    if-lt v3, v5, :cond_94

    const/16 v5, 0x1f

    if-le v3, v5, :cond_98

    :cond_94
    invoke-virtual {p1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_f0

    :cond_98
    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    instance-of v3, v3, Lzdd;

    if-eqz v3, :cond_bf

    instance-of v3, p0, Landroid/graphics/drawable/ColorDrawable;

    if-eqz v3, :cond_bf

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Lzdd;

    invoke-virtual {v3, v0}, Lzdd;->q(Landroid/content/Context;)V

    check-cast p0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v3, p0}, Lzdd;->u(Landroid/content/res/ColorStateList;)V

    goto :goto_c2

    :cond_bf
    invoke-static {p1, p0}, Lq9n;->B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :goto_c2
    if-eqz v2, :cond_d7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_d2

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v4

    :cond_d2
    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p1, v4}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_d7
    if-eqz v1, :cond_f0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_f0

    invoke-static {}, Landroid/graphics/PorterDuff$Mode;->values()[Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iget p0, p0, Landroid/util/TypedValue;->data:I

    aget-object p0, v0, p0

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_f0
    :goto_f0
    return-void

    nop

    :pswitch_data_f2
    .packed-switch 0x0
        :pswitch_77
    .end packed-switch
.end method
