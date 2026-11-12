.class public final Le9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final h:[I

.field public static final i:[I

.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I

.field public static final n:[I


# instance fields
.field public final a:Lff2;

.field public final b:Lff2;

.field public final c:Lff2;

.field public final d:Lff2;

.field public final e:Lff2;

.field public final f:Lff2;

.field public final g:Lff2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x1010392

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->h:[I

    const v0, 0x1010393

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->i:[I

    const v0, 0x101016f

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->j:[I

    const v0, 0x1010170

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->k:[I

    const v0, 0x101016d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->l:[I

    const v0, 0x101016e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->m:[I

    const v0, 0x10104d6

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Le9n;->n:[I

    return-void
.end method

.method public constructor <init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le9n;->a:Lff2;

    iput-object p2, p0, Le9n;->b:Lff2;

    iput-object p3, p0, Le9n;->c:Lff2;

    iput-object p4, p0, Le9n;->d:Lff2;

    iput-object p5, p0, Le9n;->e:Lff2;

    iput-object p6, p0, Le9n;->f:Lff2;

    iput-object p7, p0, Le9n;->g:Lff2;

    return-void
.end method

.method public static b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;
    .registers 2

    if-eqz p1, :cond_8

    invoke-virtual {p1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p1

    if-nez p1, :cond_a

    :cond_8
    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-static {p0, p1}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p1, Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, v1, v2

    iget-object v3, p0, Le9n;->f:Lff2;

    iget-object v4, p0, Le9n;->e:Lff2;

    if-nez v2, :cond_30

    const/4 v2, 0x2

    aget-object v1, v1, v2

    if-nez v1, :cond_30

    iget-object v1, p0, Le9n;->c:Lff2;

    invoke-static {v0, v1}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v4}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v4, p0, Le9n;->d:Lff2;

    invoke-static {v0, v4}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v0, v3}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p1, v1, v2, v4, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_47

    :cond_30
    iget-object v1, p0, Le9n;->a:Lff2;

    invoke-static {v0, v1}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-static {v0, v4}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v4, p0, Le9n;->b:Lff2;

    invoke-static {v0, v4}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-static {v0, v3}, Le9n;->b(Landroid/content/Context;Lff2;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {p1, v1, v2, v4, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :goto_47
    iget-object p0, p0, Le9n;->g:Lff2;

    if-eqz p0, :cond_58

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_58

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setCompoundDrawableTintList(Landroid/content/res/ColorStateList;)V

    :cond_58
    return-void
.end method
