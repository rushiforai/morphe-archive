.class final Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;
.super Ljava/lang/Object;
.source "JDK8PlatformImplementations.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/internal/jdk8/JDK8PlatformImplementations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ReflectSdkVersion"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJDK8PlatformImplementations.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JDK8PlatformImplementations.kt\nkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,97:1\n1#2:98\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c2\u0002\u0018\u00002\u00020\u0001B\t\u0008B\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001a\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0084\u0008\u0092\u0002\u0002\u0008\u0007\u00a2\u0006\u0004\n\u0002\u0010\u0006\u00a8\u0006\u0008"
    }
    d2 = {
        "Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;",
        "",
        "<init>",
        "()V",
        "sdkVersion",
        "",
        "Ljava/lang/Integer;",
        "Lkotlin/jvm/JvmField;",
        "kotlin-stdlib-jdk8"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;

.field public static final sdkVersion:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;

    invoke-direct {v0}, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;-><init>()V

    sput-object v0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;->INSTANCE:Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;

    const/4 v0, 0x0

    .line 35
    :try_start_8
    const-string v1, "android.os.Build$VERSION"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "SDK_INT"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/Integer;

    if-eqz v2, :cond_1f

    check-cast v1, Ljava/lang/Integer;
    :try_end_1e
    .catchall {:try_start_8 .. :try_end_1e} :catchall_1f

    goto :goto_20

    :catchall_1f
    :cond_1f
    move-object v1, v0

    :goto_20
    if-eqz v1, :cond_2c

    .line 38
    move-object v2, v1

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    if-lez v2, :cond_2c

    move-object v0, v1

    :cond_2c
    sput-object v0, Lkotlin/internal/jdk8/JDK8PlatformImplementations$ReflectSdkVersion;->sdkVersion:Ljava/lang/Integer;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
