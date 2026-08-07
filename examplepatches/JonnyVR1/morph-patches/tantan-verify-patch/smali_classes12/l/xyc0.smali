.class public abstract Ll/xyc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Ljava/util/Map;

.field public static final e:Ljava/util/Map;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final b:Lcom/google/mlkit/common/sdkinternal/model/BaseModel;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final c:Lcom/google/mlkit/common/sdkinternal/ModelType;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/EnumMap;

    .line 2
    .line 3
    const-class v1, Lcom/google/mlkit/common/sdkinternal/model/BaseModel;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/xyc0;->d:Ljava/util/Map;

    .line 9
    .line 10
    new-instance v0, Ljava/util/EnumMap;

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/xyc0;->e:Ljava/util/Map;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ll/xyc0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Ll/xyc0;

    .line 12
    .line 13
    iget-object v1, p0, Ll/xyc0;->a:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Ll/xyc0;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/xyc0;->b:Lcom/google/mlkit/common/sdkinternal/model/BaseModel;

    .line 24
    .line 25
    iget-object v3, p1, Ll/xyc0;->b:Lcom/google/mlkit/common/sdkinternal/model/BaseModel;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Ll/xyc0;->c:Lcom/google/mlkit/common/sdkinternal/ModelType;

    .line 34
    .line 35
    iget-object p1, p1, Ll/xyc0;->c:Lcom/google/mlkit/common/sdkinternal/ModelType;

    .line 36
    .line 37
    invoke-static {p0, p1}, Lcom/google/android/gms/common/internal/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xyc0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xyc0;->b:Lcom/google/mlkit/common/sdkinternal/model/BaseModel;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xyc0;->c:Lcom/google/mlkit/common/sdkinternal/ModelType;

    .line 6
    .line 7
    filled-new-array {v0, v1, p0}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Objects;->hashCode([Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const-string v0, "RemoteModel"

    .line 2
    .line 3
    invoke-static {v0}, Ll/ssy0;->a(Ljava/lang/String;)Ll/tqy0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "modelName"

    .line 8
    .line 9
    iget-object v2, p0, Ll/xyc0;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/tqy0;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/tqy0;

    .line 12
    .line 13
    .line 14
    const-string v1, "baseModel"

    .line 15
    .line 16
    iget-object v2, p0, Ll/xyc0;->b:Lcom/google/mlkit/common/sdkinternal/model/BaseModel;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ll/tqy0;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/tqy0;

    .line 19
    .line 20
    .line 21
    const-string v1, "modelType"

    .line 22
    .line 23
    iget-object p0, p0, Ll/xyc0;->c:Lcom/google/mlkit/common/sdkinternal/ModelType;

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0}, Ll/tqy0;->a(Ljava/lang/String;Ljava/lang/Object;)Ll/tqy0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/tqy0;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
