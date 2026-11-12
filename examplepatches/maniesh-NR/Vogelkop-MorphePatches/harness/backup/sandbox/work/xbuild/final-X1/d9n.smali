.class public final Ld9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final A:[I

.field public static final B:[I

.field public static final C:[I

.field public static final m:[I

.field public static final n:[I

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

.field public final b:Lmgh;

.field public final c:Lmgh;

.field public final d:Lmgh;

.field public final e:Lmgh;

.field public final f:Lmgh;

.field public final g:Lff2;

.field public final h:Lff2;

.field public final i:Lff2;

.field public final j:Lff2;

.field public final k:Lff2;

.field public final l:Lff2;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x101009a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->m:[I

    const v0, 0x7f04050a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->n:[I

    const v0, 0x7f040509

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->o:[I

    const v0, 0x7f0404fe

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->p:[I

    const v0, 0x7f0404fd

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->q:[I

    const v0, 0x7f040375

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->r:[I

    const v0, 0x7f040374

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->s:[I

    const v0, 0x7f040373

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->t:[I

    const v0, 0x7f040372

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->u:[I

    const v0, 0x7f040435

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->v:[I

    const v0, 0x7f040434

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->w:[I

    const v0, 0x7f040103

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->x:[I

    const v0, 0x7f040104

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->y:[I

    const v0, 0x7f0408d7

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->z:[I

    const v0, 0x7f04041e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->A:[I

    const v0, 0x7f040430

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->B:[I

    const v0, 0x7f040911

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ld9n;->C:[I

    return-void
.end method

.method public constructor <init>(Lff2;Lmgh;Lmgh;Lmgh;Lmgh;Lmgh;Lff2;Lff2;Lff2;Lff2;Lff2;Lff2;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld9n;->a:Lff2;

    iput-object p2, p0, Ld9n;->b:Lmgh;

    iput-object p3, p0, Ld9n;->c:Lmgh;

    iput-object p4, p0, Ld9n;->d:Lmgh;

    iput-object p5, p0, Ld9n;->e:Lmgh;

    iput-object p6, p0, Ld9n;->f:Lmgh;

    iput-object p7, p0, Ld9n;->g:Lff2;

    iput-object p8, p0, Ld9n;->h:Lff2;

    iput-object p9, p0, Ld9n;->i:Lff2;

    iput-object p10, p0, Ld9n;->j:Lff2;

    iput-object p11, p0, Ld9n;->k:Lff2;

    iput-object p12, p0, Ld9n;->l:Lff2;

    return-void
.end method

.method public static b(Lzg;[I[I)Lmgh;
    .registers 4

    invoke-static {p0, p1}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object p1

    invoke-static {p0, p2}, Lff2;->a(Lzg;[I)Lff2;

    move-result-object p0

    if-nez p1, :cond_e

    if-nez p0, :cond_e

    const/4 p0, 0x0

    return-object p0

    :cond_e
    new-instance p2, Lmgh;

    const/16 v0, 0xa

    invoke-direct {p2, p1, p0, v0}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p2
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 9

    move-object v0, p1

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v0, Lcom/google/android/material/textfield/TextInputLayout;->c:Lz28;

    iget-object v2, v0, Lcom/google/android/material/textfield/TextInputLayout;->k:Ll6b;

    const/4 v3, 0x0

    iget-object v4, p0, Ld9n;->a:Lff2;

    if-eqz v4, :cond_2a

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_2a

    invoke-static {p1, v4}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v4

    if-eqz v4, :cond_2a

    iput-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/content/res/ColorStateList;

    iput-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->j0:Landroid/content/res/ColorStateList;

    iget-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    if-eqz v4, :cond_2a

    invoke-virtual {v0, v3, v3}, Lcom/google/android/material/textfield/TextInputLayout;->E(ZZ)V

    :cond_2a
    iget-object v4, p0, Ld9n;->b:Lmgh;

    if-eqz v4, :cond_79

    iget-object v5, v4, Lmgh;->c:Ljava/lang/Object;

    check-cast v5, Lff2;

    if-eqz v5, :cond_51

    invoke-virtual {v5, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v5

    if-eqz v5, :cond_51

    iget v5, v5, Landroid/util/TypedValue;->resourceId:I

    if-eqz v5, :cond_51

    iget-object v6, v0, Lcom/google/android/material/textfield/TextInputLayout;->v0:Lv85;

    invoke-virtual {v6, v5}, Lv85;->q(I)V

    iget-object v5, v6, Lv85;->p:Landroid/content/res/ColorStateList;

    iput-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->j0:Landroid/content/res/ColorStateList;

    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    if-eqz v5, :cond_51

    invoke-virtual {v0, v3, v3}, Lcom/google/android/material/textfield/TextInputLayout;->E(ZZ)V

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->D()V

    :cond_51
    iget-object v4, v4, Lmgh;->b:Ljava/lang/Object;

    check-cast v4, Lff2;

    if-eqz v4, :cond_79

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_79

    invoke-static {p1, v4}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v4

    if-eqz v4, :cond_79

    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->j0:Landroid/content/res/ColorStateList;

    if-eq v5, v4, :cond_79

    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->i0:Landroid/content/res/ColorStateList;

    if-nez v5, :cond_70

    iget-object v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->v0:Lv85;

    invoke-virtual {v5, v4}, Lv85;->r(Landroid/content/res/ColorStateList;)V

    :cond_70
    iput-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->j0:Landroid/content/res/ColorStateList;

    iget-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    if-eqz v4, :cond_79

    invoke-virtual {v0, v3, v3}, Lcom/google/android/material/textfield/TextInputLayout;->E(ZZ)V

    :cond_79
    iget-object v3, p0, Ld9n;->c:Lmgh;

    if-eqz v3, :cond_b1

    iget-object v4, v3, Lmgh;->c:Ljava/lang/Object;

    check-cast v4, Lff2;

    if-eqz v4, :cond_96

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_96

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v4, :cond_96

    iput v4, v2, Ll6b;->z:I

    iget-object v5, v2, Ll6b;->y:Lyq1;

    if-eqz v5, :cond_96

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setTextAppearance(I)V

    :cond_96
    iget-object v3, v3, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Lff2;

    if-eqz v3, :cond_b1

    invoke-virtual {v3, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_b1

    invoke-static {p1, v3}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_b1

    iput-object v3, v2, Ll6b;->A:Landroid/content/res/ColorStateList;

    iget-object v4, v2, Ll6b;->y:Lyq1;

    if-eqz v4, :cond_b1

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_b1
    iget-object v3, p0, Ld9n;->d:Lmgh;

    if-eqz v3, :cond_e9

    iget-object v4, v3, Lmgh;->c:Ljava/lang/Object;

    check-cast v4, Lff2;

    if-eqz v4, :cond_ce

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_ce

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v4, :cond_ce

    iget v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    if-eq v5, v4, :cond_ce

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->r:I

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_ce
    iget-object v3, v3, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Lff2;

    if-eqz v3, :cond_e9

    invoke-virtual {v3, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_e9

    invoke-static {p1, v3}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_e9

    iget-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    if-eq v4, v3, :cond_e9

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->z:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_e9
    iget-object v3, p0, Ld9n;->e:Lmgh;

    if-eqz v3, :cond_121

    iget-object v4, v3, Lmgh;->c:Ljava/lang/Object;

    check-cast v4, Lff2;

    if-eqz v4, :cond_106

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_106

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v4, :cond_106

    iget v5, v0, Lcom/google/android/material/textfield/TextInputLayout;->q:I

    if-eq v5, v4, :cond_106

    iput v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->q:I

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_106
    iget-object v3, v3, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Lff2;

    if-eqz v3, :cond_121

    invoke-virtual {v3, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_121

    invoke-static {p1, v3}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_121

    iget-object v4, v0, Lcom/google/android/material/textfield/TextInputLayout;->A:Landroid/content/res/ColorStateList;

    if-eq v4, v3, :cond_121

    iput-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->A:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->y()V

    :cond_121
    iget-object v3, p0, Ld9n;->f:Lmgh;

    if-eqz v3, :cond_15b

    iget-object v4, v3, Lmgh;->c:Ljava/lang/Object;

    check-cast v4, Lff2;

    if-eqz v4, :cond_140

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_140

    iget v4, v4, Landroid/util/TypedValue;->resourceId:I

    if-eqz v4, :cond_140

    iput v4, v2, Ll6b;->u:I

    iget-object v5, v2, Ll6b;->r:Lyq1;

    if-eqz v5, :cond_140

    iget-object v6, v2, Ll6b;->h:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v6, v5, v4}, Lcom/google/android/material/textfield/TextInputLayout;->v(Lyq1;I)V

    :cond_140
    iget-object v3, v3, Lmgh;->b:Ljava/lang/Object;

    check-cast v3, Lff2;

    if-eqz v3, :cond_15b

    invoke-virtual {v3, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_15b

    invoke-static {p1, v3}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_15b

    iput-object v3, v2, Ll6b;->v:Landroid/content/res/ColorStateList;

    iget-object v2, v2, Ll6b;->r:Lyq1;

    if-eqz v2, :cond_15b

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_15b
    iget-object v2, p0, Ld9n;->i:Lff2;

    if-eqz v2, :cond_17c

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_17c

    invoke-static {p1, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_17c

    iget-object v3, v0, Lcom/google/android/material/textfield/TextInputLayout;->b:Lr3k;

    iget-object v4, v3, Lr3k;->e:Landroid/content/res/ColorStateList;

    if-eq v4, v2, :cond_17c

    iput-object v2, v3, Lr3k;->e:Landroid/content/res/ColorStateList;

    iget-object v4, v3, Lr3k;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v5, v3, Lr3k;->d:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v3, v3, Lr3k;->f:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v4, v5, v2, v3}, Lic4;->k(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_17c
    iget-object v2, p0, Ld9n;->j:Lff2;

    if-eqz v2, :cond_19b

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_19b

    invoke-static {p1, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_19b

    iget-object v3, v1, Lz28;->j:Landroid/content/res/ColorStateList;

    if-eq v3, v2, :cond_19b

    iput-object v2, v1, Lz28;->j:Landroid/content/res/ColorStateList;

    iget-object v3, v1, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v1, Lz28;->f:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, v1, Lz28;->k:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v3, v4, v2, v5}, Lic4;->k(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_19b
    iget-object v2, p0, Ld9n;->k:Lff2;

    if-eqz v2, :cond_1ba

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_1ba

    invoke-static {p1, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_1ba

    iget-object v3, v1, Lz28;->d:Landroid/content/res/ColorStateList;

    if-eq v3, v2, :cond_1ba

    iput-object v2, v1, Lz28;->d:Landroid/content/res/ColorStateList;

    iget-object v3, v1, Lz28;->a:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object v4, v1, Lz28;->c:Lcom/google/android/material/internal/CheckableImageButton;

    iget-object v5, v1, Lz28;->e:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v3, v4, v2, v5}, Lic4;->k(Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/internal/CheckableImageButton;Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;)V

    :cond_1ba
    iget-object v2, p0, Ld9n;->l:Lff2;

    if-eqz v2, :cond_1cf

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_1cf

    invoke-static {p1, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v2

    if-eqz v2, :cond_1cf

    iget-object v1, v1, Lz28;->n:Lyq1;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_1cf
    iget-object v1, p0, Ld9n;->g:Lff2;

    if-eqz v1, :cond_1e2

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_1e2

    invoke-static {p1, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_1e2

    invoke-virtual {v0, v1}, Lcom/google/android/material/textfield/TextInputLayout;->o(Landroid/content/res/ColorStateList;)V

    :cond_1e2
    iget-object p0, p0, Ld9n;->h:Lff2;

    if-eqz p0, :cond_1fb

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1fb

    invoke-static {p1, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_1fb

    iget-object p1, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/content/res/ColorStateList;

    if-eq p1, p0, :cond_1fb

    iput-object p0, v0, Lcom/google/android/material/textfield/TextInputLayout;->n0:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Lcom/google/android/material/textfield/TextInputLayout;->H()V

    :cond_1fb
    return-void
.end method
