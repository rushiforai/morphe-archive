.class public final Lvc4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lha4;

.field public final c:Lha4;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvc4;->a:Landroid/content/Context;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_12

    new-instance v0, Lha4;

    invoke-direct {v0, p1}, Lha4;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lvc4;->c:Lha4;

    :cond_12
    const/4 v0, 0x0

    :try_start_13
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x84

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1
    :try_end_21
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_13 .. :try_end_21} :catch_68

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->services:[Landroid/content/pm/ServiceInfo;

    if-eqz v1, :cond_68

    array-length v2, v1

    const/4 v3, 0x0

    move-object v4, v0

    :goto_28
    if-ge v3, v2, :cond_45

    aget-object v5, v1, v3

    iget-object v5, v5, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    if-eqz v5, :cond_42

    const-string v6, "androidx.camera.featurecombinationquery.PLAY_SERVICES_IMPL_PROVIDER_KEY"

    invoke-virtual {v5, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_42

    if-nez v4, :cond_3c

    move-object v4, v5

    goto :goto_42

    :cond_3c
    const-string p0, "Multiple Play Services CameraDeviceSetupCompat implementations found in the manifest."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    throw v0

    :cond_42
    :goto_42
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    :cond_45
    if-eqz v4, :cond_68

    :try_start_47
    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Landroid/content/Context;

    filled-new-array {v2}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lha4;
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_5f} :catch_61

    move-object v0, p1

    goto :goto_68

    :catch_61
    move-exception p0

    const-string p1, "Failed to instantiate Play Services CameraDeviceSetupCompat implementation"

    invoke-static {p1, p0}, Lh9o;->m(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_68
    :cond_68
    :goto_68
    iput-object v0, p0, Lvc4;->b:Lha4;

    return-void
.end method
