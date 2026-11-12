.class public final Lidb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwcj;


# instance fields
.field public final a:Landroid/content/Intent;

.field public final b:Landroid/content/pm/ResolveInfo;

.field public final c:Lzcj;


# direct methods
.method public constructor <init>(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Lzcj;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lidb;->a:Landroid/content/Intent;

    iput-object p2, p0, Lidb;->b:Landroid/content/pm/ResolveInfo;

    iput-object p3, p0, Lidb;->c:Lzcj;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .registers 3

    iget-object v0, p0, Lidb;->a:Landroid/content/Intent;

    invoke-virtual {p0, p1, v0}, Lidb;->e(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public final b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    const/high16 v0, 0x42200000    # 40.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    iget-object p0, p0, Lidb;->b:Landroid/content/pm/ResolveInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/pm/ResolveInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    sget p1, Lb0j;->d:I

    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    filled-new-array {p0}, [Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-direct {p1, p0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    invoke-virtual {p1, p0, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerWidth(II)V

    invoke-virtual {p1, p0, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    new-instance v0, Lb0j;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Integer;

    move-result-object p0

    invoke-direct {v0, p1, p0}, Lb0j;-><init>(Landroid/graphics/drawable/LayerDrawable;[Ljava/lang/Integer;)V

    return-object v0
.end method

.method public final c(Landroid/content/Context;Li4d;)V
    .registers 3

    iget-object p2, p2, Li4d;->b:Ljava/lang/Object;

    check-cast p2, Landroid/content/Intent;

    invoke-virtual {p0, p1, p2}, Lidb;->e(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public final d(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    iget-object p0, p0, Lidb;->b:Landroid/content/pm/ResolveInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/content/pm/ResolveInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final e(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p2}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object p2, p0, Lidb;->b:Landroid/content/pm/ResolveInfo;

    iget-object p2, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, p2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p2, p2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 p2, 0x10000000

    invoke-virtual {v0, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    :try_start_15
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_18
    .catch Ljava/lang/SecurityException; {:try_start_15 .. :try_end_18} :catch_18

    :catch_18
    iget-object p1, p0, Lidb;->c:Lzcj;

    invoke-virtual {p0}, Lidb;->getId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzcj;->e(Ljava/lang/String;)V

    return-void
.end method

.method public final getId()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lidb;->b:Landroid/content/pm/ResolveInfo;

    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, p0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v0, 0x3a

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
