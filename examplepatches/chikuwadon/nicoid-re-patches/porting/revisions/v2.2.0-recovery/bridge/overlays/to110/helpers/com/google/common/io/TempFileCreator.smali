.class abstract Lcom/google/common/io/TempFileCreator;
.super Ljava/lang/Object;
.source "TempFileCreator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/io/TempFileCreator$JavaNioCreator;,
        Lcom/google/common/io/TempFileCreator$ThrowingCreator;,
        Lcom/google/common/io/TempFileCreator$JavaIoCreator;,
        Lcom/google/common/io/TempFileCreator$TempFileAndChannel;
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/io/TempFileCreator;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 65
    invoke-static {}, Lcom/google/common/io/TempFileCreator;->pickSecureCreator()Lcom/google/common/io/TempFileCreator;

    move-result-object v0

    sput-object v0, Lcom/google/common/io/TempFileCreator;->INSTANCE:Lcom/google/common/io/TempFileCreator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/io/TempFileCreator$1;)V
    .registers 2

    .line 64
    invoke-direct {p0}, Lcom/google/common/io/TempFileCreator;-><init>()V

    return-void
.end method

.method private static pickSecureCreator()Lcom/google/common/io/TempFileCreator;
    .registers 4

    const/4 v0, 0x0

    .line 104
    :try_start_0
    const-string v1, "java.nio.file.Path"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 105
    new-instance v1, Lcom/google/common/io/TempFileCreator$JavaNioCreator;

    invoke-direct {v1, v0}, Lcom/google/common/io/TempFileCreator$JavaNioCreator;-><init>(Lcom/google/common/io/TempFileCreator$1;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 111
    :catch_0
    :try_start_1
    const-string v1, "android.os.Build$VERSION"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "SDK_INT"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 112
    const-string v2, "android.os.Build$VERSION_CODES"

    .line 113
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "JELLY_BEAN"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 119
    new-instance v1, Lcom/google/common/io/TempFileCreator$ThrowingCreator;

    invoke-direct {v1, v0}, Lcom/google/common/io/TempFileCreator$ThrowingCreator;-><init>(Lcom/google/common/io/TempFileCreator$1;)V
    :try_end_1
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v1

    .line 129
    :cond_0
    new-instance v1, Lcom/google/common/io/TempFileCreator$JavaIoCreator;

    invoke-direct {v1, v0}, Lcom/google/common/io/TempFileCreator$JavaIoCreator;-><init>(Lcom/google/common/io/TempFileCreator$1;)V

    return-object v1

    .line 123
    :catch_1
    new-instance v1, Lcom/google/common/io/TempFileCreator$ThrowingCreator;

    invoke-direct {v1, v0}, Lcom/google/common/io/TempFileCreator$ThrowingCreator;-><init>(Lcom/google/common/io/TempFileCreator$1;)V

    return-object v1
.end method

.method static testMakingUserPermissionsFromScratch()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 143
    # invokes: Lcom/google/common/io/TempFileCreator$JavaNioCreator;->userPermissions()Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;
    invoke-static {}, Lcom/google/common/io/TempFileCreator$JavaNioCreator;->access$300()Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/common/io/TempFileCreator$JavaNioCreator$PermissionSupplier;->get()Ljava/nio/file/attribute/FileAttribute;

    return-void
.end method


# virtual methods
.method abstract createTempDir()Ljava/io/File;
.end method

.method abstract openTempFile(Ljava/lang/String;)Lcom/google/common/io/TempFileCreator$TempFileAndChannel;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "prefix"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
