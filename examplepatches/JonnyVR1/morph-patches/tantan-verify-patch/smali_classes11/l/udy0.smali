.class public final Ll/udy0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/os/Bundle;

.field public b:Ljava/util/List;

.field public c:Z

.field public d:I

.field public final e:Landroid/os/Bundle;

.field public final f:Landroid/os/Bundle;

.field public final g:Ljava/util/List;

.field public h:I

.field public i:Ljava/lang/String;

.field public final j:Ljava/util/List;

.field public k:I

.field public final l:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Bundle;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/udy0;->a:Landroid/os/Bundle;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/udy0;->b:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/udy0;->c:Z

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Ll/udy0;->d:I

    .line 23
    .line 24
    new-instance v1, Landroid/os/Bundle;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Ll/udy0;->e:Landroid/os/Bundle;

    .line 30
    .line 31
    new-instance v1, Landroid/os/Bundle;

    .line 32
    .line 33
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Ll/udy0;->f:Landroid/os/Bundle;

    .line 37
    .line 38
    new-instance v1, Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ll/udy0;->g:Ljava/util/List;

    .line 44
    .line 45
    iput v0, p0, Ll/udy0;->h:I

    .line 46
    .line 47
    const/4 v0, 0x0

    .line 48
    iput-object v0, p0, Ll/udy0;->i:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v0, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/udy0;->j:Ljava/util/List;

    .line 56
    .line 57
    const v0, 0xea60

    .line 58
    .line 59
    .line 60
    iput v0, p0, Ll/udy0;->k:I

    .line 61
    .line 62
    sget-object v0, Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;->DEFAULT:Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/google/android/gms/ads/RequestConfiguration$PublisherPrivacyPersonalizationState;->getValue()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iput v0, p0, Ll/udy0;->l:I

    .line 69
    .line 70
    return-void
.end method


# virtual methods
.method public final a()Lcom/google/android/gms/ads/internal/client/zzl;
    .locals 27

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/gms/ads/internal/client/zzl;

    .line 4
    .line 5
    iget-object v14, v0, Ll/udy0;->e:Landroid/os/Bundle;

    .line 6
    .line 7
    iget-object v4, v0, Ll/udy0;->a:Landroid/os/Bundle;

    .line 8
    .line 9
    iget-object v15, v0, Ll/udy0;->f:Landroid/os/Bundle;

    .line 10
    .line 11
    iget-object v6, v0, Ll/udy0;->b:Ljava/util/List;

    .line 12
    .line 13
    iget-boolean v7, v0, Ll/udy0;->c:Z

    .line 14
    .line 15
    iget v8, v0, Ll/udy0;->d:I

    .line 16
    .line 17
    iget v2, v0, Ll/udy0;->h:I

    .line 18
    .line 19
    iget-object v3, v0, Ll/udy0;->i:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v5, v0, Ll/udy0;->j:Ljava/util/List;

    .line 22
    .line 23
    iget-object v9, v0, Ll/udy0;->g:Ljava/util/List;

    .line 24
    .line 25
    iget v10, v0, Ll/udy0;->k:I

    .line 26
    .line 27
    const/16 v25, 0x0

    .line 28
    .line 29
    iget v0, v0, Ll/udy0;->l:I

    .line 30
    .line 31
    move/from16 v26, v0

    .line 32
    .line 33
    move-object v0, v1

    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    move/from16 v21, v2

    .line 37
    .line 38
    move-object/from16 v22, v3

    .line 39
    .line 40
    const-wide/16 v2, -0x1

    .line 41
    .line 42
    move-object/from16 v23, v5

    .line 43
    .line 44
    const/4 v5, -0x1

    .line 45
    move-object/from16 v16, v9

    .line 46
    .line 47
    const/4 v9, 0x0

    .line 48
    move/from16 v24, v10

    .line 49
    .line 50
    const/4 v10, 0x0

    .line 51
    const/4 v11, 0x0

    .line 52
    const/4 v12, 0x0

    .line 53
    const/4 v13, 0x0

    .line 54
    const/16 v17, 0x0

    .line 55
    .line 56
    const/16 v18, 0x0

    .line 57
    .line 58
    const/16 v19, 0x0

    .line 59
    .line 60
    const/16 v20, 0x0

    .line 61
    .line 62
    invoke-direct/range {v0 .. v26}, Lcom/google/android/gms/ads/internal/client/zzl;-><init>(IJLandroid/os/Bundle;ILjava/util/List;ZIZLjava/lang/String;Lcom/google/android/gms/ads/internal/client/zzfh;Landroid/location/Location;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;ZLcom/google/android/gms/ads/internal/client/zzc;ILjava/lang/String;Ljava/util/List;ILjava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public final b(Landroid/os/Bundle;)Ll/udy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/udy0;->a:Landroid/os/Bundle;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c(I)Ll/udy0;
    .locals 0

    .line 1
    iput p1, p0, Ll/udy0;->k:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Z)Ll/udy0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/udy0;->c:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/util/List;)Ll/udy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/udy0;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f(Ljava/lang/String;)Ll/udy0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/udy0;->i:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(I)Ll/udy0;
    .locals 0

    .line 1
    iput p1, p0, Ll/udy0;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(I)Ll/udy0;
    .locals 0

    .line 1
    iput p1, p0, Ll/udy0;->h:I

    .line 2
    .line 3
    return-object p0
.end method
