.class public final Lcom/google/common/reflect/ClassPath$ClassInfo;
.super Lcom/google/common/reflect/ClassPath$ResourceInfo;
.source "ClassPath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/reflect/ClassPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ClassInfo"
.end annotation


# instance fields
.field private final className:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/ClassLoader;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "file",
            "resourceName",
            "loader"
        }
    .end annotation

    .line 310
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/reflect/ClassPath$ResourceInfo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 311
    invoke-static {p2}, Lcom/google/common/reflect/ClassPath;->getClassName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    return-void
.end method

.method private lastNestedClassSeparator()I
    .registers 7

    .line 386
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    :goto_0
    const/4 v1, -0x1

    const/4 v2, 0x1

    if-lt v0, v2, :cond_1

    .line 387
    iget-object v2, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 388
    iget-object v3, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 389
    iget-object v4, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x2e

    if-eq v2, v5, :cond_1

    if-eq v3, v5, :cond_1

    if-eq v4, v5, :cond_1

    const/16 v1, 0x24

    if-eq v2, v1, :cond_0

    if-ne v3, v1, :cond_0

    if-eq v4, v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return v1
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 1

    .line 362
    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .registers 1

    .line 326
    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-static {p0}, Lcom/google/common/reflect/Reflection;->getPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getSimpleName()Ljava/lang/String;
    .registers 3

    .line 339
    invoke-direct {p0}, Lcom/google/common/reflect/ClassPath$ClassInfo;->lastNestedClassSeparator()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 341
    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x30

    const/16 v1, 0x39

    .line 344
    invoke-static {v0, v1}, Lcom/google/common/base/CharMatcher;->inRange(CC)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->trimLeadingFrom(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 346
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/reflect/ClassPath$ClassInfo;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 347
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    .line 352
    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    if-eqz v1, :cond_1

    return-object p0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public isTopLevel()Z
    .registers 2

    .line 376
    invoke-direct {p0}, Lcom/google/common/reflect/ClassPath$ClassInfo;->lastNestedClassSeparator()I

    move-result p0

    const/4 v0, -0x1

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public load()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 408
    :try_start_0
    iget-object v0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->loader:Ljava/lang/ClassLoader;

    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 411
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 417
    iget-object p0, p0, Lcom/google/common/reflect/ClassPath$ClassInfo;->className:Ljava/lang/String;

    return-object p0
.end method
