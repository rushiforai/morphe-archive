.class public final Lb9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final A:[I

.field public static final B:[I

.field public static final o:[I

.field public static final p:[I

.field public static final q:[I

.field public static final r:[I

.field public static final s:[I

.field public static final t:[I

.field public static final u:[I

.field public static final v:[I

.field public static final w:[I

.field public static final x:[I

.field public static final y:[I

.field public static final z:[I


# instance fields
.field public final a:Lff2;

.field public final b:Lff2;

.field public final c:Lff2;

.field public final d:Lff2;

.field public final e:Lff2;

.field public final f:Lff2;

.field public final g:Lff2;

.field public final h:Lff2;

.field public final i:Lff2;

.field public final j:Lff2;

.field public final k:Lff2;

.field public final l:Lff2;

.field public final m:Lff2;

.field public final n:Lff2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x7f0404f4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->o:[I

    const v0, 0x7f0404f5

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->p:[I

    const v0, 0x7f0409e4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->q:[I

    const v0, 0x7f0409e5

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->r:[I

    const v0, 0x7f0409eb

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->s:[I

    const v0, 0x7f0409ec

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->t:[I

    const v0, 0x7f0409ed

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->u:[I

    const v0, 0x7f0409f3

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->v:[I

    const v0, 0x7f0409f4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->w:[I

    const v0, 0x7f0409f5

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->x:[I

    const v0, 0x7f040a2d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->y:[I

    const v0, 0x7f040a2e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->z:[I

    const v0, 0x7f040a2f

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->A:[I

    const v0, 0x7f040a36

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lb9n;->B:[I

    return-void
.end method

.method public constructor <init>(Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb9n;->a:Lff2;

    iput-object p2, p0, Lb9n;->b:Lff2;

    iput-object p3, p0, Lb9n;->c:Lff2;

    iput-object p4, p0, Lb9n;->d:Lff2;

    iput-object p5, p0, Lb9n;->e:Lff2;

    iput-object p6, p0, Lb9n;->f:Lff2;

    iput-object p7, p0, Lb9n;->g:Lff2;

    iput-object p8, p0, Lb9n;->h:Lff2;

    iput-object p9, p0, Lb9n;->i:Lff2;

    iput-object p10, p0, Lb9n;->j:Lff2;

    iput-object p11, p0, Lb9n;->k:Lff2;

    iput-object p12, p0, Lb9n;->l:Lff2;

    iput-object p13, p0, Lb9n;->m:Lff2;

    iput-object p14, p0, Lb9n;->n:Lff2;

    return-void
.end method

.method public static b(Landroid/content/Context;Landroid/util/TypedValue;)F
    .registers 4

    iget v0, p1, Landroid/util/TypedValue;->type:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_14

    iget p1, p1, Landroid/util/TypedValue;->data:I

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/TypedValue;->complexToDimension(ILandroid/util/DisplayMetrics;)F

    move-result p0

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 16

    if-eqz p1, :cond_2e6

    instance-of v0, p1, Lcom/google/android/material/slider/Slider;

    iget-object v1, p0, Lb9n;->m:Lff2;

    iget-object v2, p0, Lb9n;->l:Lff2;

    iget-object v3, p0, Lb9n;->k:Lff2;

    iget-object v4, p0, Lb9n;->j:Lff2;

    iget-object v5, p0, Lb9n;->i:Lff2;

    iget-object v6, p0, Lb9n;->h:Lff2;

    iget-object v7, p0, Lb9n;->f:Lff2;

    iget-object v8, p0, Lb9n;->c:Lff2;

    iget-object v9, p0, Lb9n;->a:Lff2;

    iget-object v10, p0, Lb9n;->n:Lff2;

    iget-object v11, p0, Lb9n;->e:Lff2;

    iget-object v12, p0, Lb9n;->b:Lff2;

    iget-object v13, p0, Lb9n;->g:Lff2;

    iget-object p0, p0, Lb9n;->d:Lff2;

    if-eqz v0, :cond_181

    check-cast p1, Lcom/google/android/material/slider/Slider;

    if-eqz p0, :cond_3b

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_3b

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lb9n;->b(Landroid/content/Context;Landroid/util/TypedValue;)F

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->N(F)V

    :cond_3b
    if-eqz v13, :cond_52

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v13, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_52

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lb9n;->b(Landroid/content/Context;Landroid/util/TypedValue;)F

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->R(F)V

    :cond_52
    if-eqz v12, :cond_69

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v12, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_69

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->L(I)V

    :cond_69
    if-eqz v11, :cond_85

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v11, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_85

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    shl-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->T(I)V

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->O(I)V

    :cond_85
    if-eqz v10, :cond_9c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v10, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_9c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->X(I)V

    :cond_9c
    if-eqz v9, :cond_b5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v9, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_b5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_b5

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->M(Landroid/content/res/ColorStateList;)V

    :cond_b5
    if-eqz v8, :cond_ce

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v8, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_ce

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_ce

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->S(Landroid/content/res/ColorStateList;)V

    :cond_ce
    if-eqz v7, :cond_e7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v7, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_e7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_e7

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->Q(Landroid/content/res/ColorStateList;)V

    :cond_e7
    if-eqz v6, :cond_103

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v6, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_103

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_103

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->V(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->U(Landroid/content/res/ColorStateList;)V

    :cond_103
    if-eqz v5, :cond_11c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v5, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_11c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_11c

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->U(Landroid/content/res/ColorStateList;)V

    :cond_11c
    if-eqz v4, :cond_135

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v4, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_135

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_135

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->V(Landroid/content/res/ColorStateList;)V

    :cond_135
    if-eqz v3, :cond_14e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v3, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_14e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_14e

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->B0(Landroid/content/res/ColorStateList;)V

    :cond_14e
    if-eqz v2, :cond_167

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_167

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_167

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->W(Landroid/content/res/ColorStateList;)V

    :cond_167
    if-eqz v1, :cond_2e6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2e6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2e6

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/Slider;->Y(Landroid/content/res/ColorStateList;)V

    return-void

    :cond_181
    instance-of v0, p1, Lcom/google/android/material/slider/h;

    if-eqz v0, :cond_2e6

    check-cast p1, Lcom/google/android/material/slider/h;

    if-eqz p0, :cond_19e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_19e

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lb9n;->b(Landroid/content/Context;Landroid/util/TypedValue;)F

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->N(F)V

    :cond_19e
    if-eqz v13, :cond_1b5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v13, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1b5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lb9n;->b(Landroid/content/Context;Landroid/util/TypedValue;)F

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->R(F)V

    :cond_1b5
    if-eqz v12, :cond_1cc

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v12, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1cc

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->L(I)V

    :cond_1cc
    if-eqz v11, :cond_1e8

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v11, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1e8

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    shl-int/lit8 p0, p0, 0x1

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->T(I)V

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->O(I)V

    :cond_1e8
    if-eqz v10, :cond_1ff

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v10, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1ff

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->g(Landroid/content/Context;Landroid/util/TypedValue;)I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->X(I)V

    :cond_1ff
    if-eqz v9, :cond_218

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v9, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_218

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_218

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->M(Landroid/content/res/ColorStateList;)V

    :cond_218
    if-eqz v8, :cond_231

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v8, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_231

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_231

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->S(Landroid/content/res/ColorStateList;)V

    :cond_231
    if-eqz v7, :cond_24a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v7, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_24a

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_24a

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->Q(Landroid/content/res/ColorStateList;)V

    :cond_24a
    if-eqz v6, :cond_266

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v6, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_266

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_266

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->V(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->U(Landroid/content/res/ColorStateList;)V

    :cond_266
    if-eqz v5, :cond_27f

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v5, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_27f

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_27f

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->U(Landroid/content/res/ColorStateList;)V

    :cond_27f
    if-eqz v4, :cond_298

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v4, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_298

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_298

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->V(Landroid/content/res/ColorStateList;)V

    :cond_298
    if-eqz v3, :cond_2b4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v3, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2b4

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2b4

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->Y(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->W(Landroid/content/res/ColorStateList;)V

    :cond_2b4
    if-eqz v2, :cond_2cd

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2cd

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2cd

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->W(Landroid/content/res/ColorStateList;)V

    :cond_2cd
    if-eqz v1, :cond_2e6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2e6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2e6

    invoke-virtual {p1, p0}, Lcom/google/android/material/slider/h;->Y(Landroid/content/res/ColorStateList;)V

    :cond_2e6
    return-void
.end method
