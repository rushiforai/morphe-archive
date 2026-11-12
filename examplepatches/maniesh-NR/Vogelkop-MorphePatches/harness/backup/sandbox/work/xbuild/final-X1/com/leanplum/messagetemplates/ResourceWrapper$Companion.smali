.class public final Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/leanplum/messagetemplates/ResourceWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001e\u0010\u0007\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\n\u001a\u00020\u000bH\u0007b\u0002\u0008\u000cJ\u0010\u0010\r\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0002J\u0010\u0010\u000e\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\tH\u0002R\u0015\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u0092\u0002\u0002\u0008\u0006\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;",
        "",
        "<init>",
        "()V",
        "EMPTY",
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "Lkotlin/jvm/JvmField;",
        "getResourceFromInputStream",
        "inputStream",
        "Ljava/io/InputStream;",
        "lottie",
        "",
        "Lkotlin/jvm/JvmStatic;",
        "getImageFromInputStream",
        "getLottieFromInputStream",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;-><init>()V

    return-void
.end method

.method private final getImageFromInputStream(Ljava/io/InputStream;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 4

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object p0

    new-instance p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    if-nez p0, :cond_b

    sget-object v0, Ldg0;->e:Ldg0;

    goto :goto_d

    :cond_b
    sget-object v0, Ldg0;->c:Ldg0;

    :goto_d
    const/4 v1, 0x0

    invoke-direct {p1, p0, v1, v0}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    return-object p1
.end method

.method private final getLottieFromInputStream(Ljava/io/InputStream;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 4

    const/4 p0, 0x0

    invoke-static {p1, p0}, Lu2d;->c(Ljava/io/InputStream;Ljava/lang/String;)Ll3d;

    move-result-object p1

    iget-object p1, p1, Ll3d;->a:Ljava/lang/Object;

    check-cast p1, Lp2d;

    if-eqz p1, :cond_19

    invoke-static {p1}, Lcom/opera/android/widget/LottieAnimationView;->r(Lp2d;)Z

    move-result v0

    if-eqz v0, :cond_19

    new-instance v0, Lcom/leanplum/messagetemplates/ResourceWrapper;

    sget-object v1, Ldg0;->f:Ldg0;

    invoke-direct {v0, p0, p1, v1}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    return-object v0

    :cond_19
    new-instance p1, Lcom/leanplum/messagetemplates/ResourceWrapper;

    sget-object v0, Ldg0;->e:Ldg0;

    invoke-direct {p1, p0, p0, v0}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    return-object p1
.end method


# virtual methods
.method public final getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    if-nez p1, :cond_b

    new-instance p0, Lcom/leanplum/messagetemplates/ResourceWrapper;

    sget-object p1, Ldg0;->d:Ldg0;

    const/4 p2, 0x0

    invoke-direct {p0, p2, p2, p1}, Lcom/leanplum/messagetemplates/ResourceWrapper;-><init>(Landroid/graphics/Bitmap;Lp2d;Ldg0;)V

    return-object p0

    :cond_b
    if-eqz p2, :cond_12

    :try_start_d
    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getLottieFromInputStream(Ljava/io/InputStream;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    goto :goto_16

    :cond_12
    invoke-direct {p0, p1}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getImageFromInputStream(Ljava/io/InputStream;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_1a

    :goto_16
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p0

    :catchall_1a
    move-exception p0

    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0
.end method
