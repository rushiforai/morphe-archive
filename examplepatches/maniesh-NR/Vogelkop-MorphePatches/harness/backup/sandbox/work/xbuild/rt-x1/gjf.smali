.class public final Lgjf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/util/SparseArray;

.field public final b:Landroid/util/SparseArray;

.field public final c:Landroid/util/SparseArray;

.field public final d:Lhjf;

.field public final e:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lhjf;Lcom/opera/android/settings/SettingsManager;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lgjf;->a:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lgjf;->b:Landroid/util/SparseArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lgjf;->c:Landroid/util/SparseArray;

    iput-object p1, p0, Lgjf;->d:Lhjf;

    iput-object p2, p0, Lgjf;->e:Lcom/opera/android/settings/SettingsManager;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lgjf;
    .registers 2

    const-string v0, "com.opera.android.graphics.MASK_PROVIDER_SERVICE"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgjf;

    if-eqz p0, :cond_b

    return-object p0

    :cond_b
    const-string p0, "Trying to use a Context without support?"

    invoke-static {p0}, Lqp2;->g(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final b(II)Lbcd;
    .registers 9

    iget-object v0, p0, Lgjf;->e:Lcom/opera/android/settings/SettingsManager;

    const/4 v1, 0x2

    if-ne p2, v1, :cond_c

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->x()Lp7j;

    move-result-object v2

    iget-byte v2, v2, Lp7j;->b:B

    goto :goto_d

    :cond_c
    move v2, p2

    :goto_d
    const/4 v3, 0x3

    const/4 v4, 0x1

    iget-object v5, p0, Lgjf;->a:Landroid/util/SparseArray;

    if-eqz v2, :cond_1e

    if-eq v2, v4, :cond_1c

    if-eq v2, v1, :cond_1e

    if-ne v2, v3, :cond_1e

    iget-object v5, p0, Lgjf;->c:Landroid/util/SparseArray;

    goto :goto_1e

    :cond_1c
    iget-object v5, p0, Lgjf;->b:Landroid/util/SparseArray;

    :cond_1e
    :goto_1e
    invoke-virtual {v5, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbcd;

    if-nez v2, :cond_6c

    if-ne p2, v1, :cond_2e

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->x()Lp7j;

    move-result-object p2

    iget-byte p2, p2, Lp7j;->b:B

    :cond_2e
    if-eqz p2, :cond_58

    if-eq p2, v4, :cond_48

    if-eq p2, v1, :cond_42

    if-eq p2, v3, :cond_3c

    int-to-float p2, p1

    invoke-static {p2}, Li41;->I(F)Landroid/graphics/Path;

    move-result-object p2

    goto :goto_5d

    :cond_3c
    int-to-float p2, p1

    invoke-static {p2}, Li41;->H(F)Landroid/graphics/Path;

    move-result-object p2

    goto :goto_5d

    :cond_42
    int-to-float p2, p1

    invoke-static {p2}, Li41;->I(F)Landroid/graphics/Path;

    move-result-object p2

    goto :goto_5d

    :cond_48
    int-to-float p2, p1

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, p2, p2, p2, v1}, Landroid/graphics/Path;->addCircle(FFFLandroid/graphics/Path$Direction;)V

    move-object p2, v0

    goto :goto_5d

    :cond_58
    int-to-float p2, p1

    invoke-static {p2}, Li41;->I(F)Landroid/graphics/Path;

    move-result-object p2

    :goto_5d
    new-instance v0, Lbcd;

    iget-object p0, p0, Lgjf;->d:Lhjf;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-direct {v0, p0, p2, p1}, Lbcd;-><init>(Landroid/content/res/Resources;Landroid/graphics/Path;I)V

    invoke-virtual {v5, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-object v0

    :cond_6c
    return-object v2
.end method
