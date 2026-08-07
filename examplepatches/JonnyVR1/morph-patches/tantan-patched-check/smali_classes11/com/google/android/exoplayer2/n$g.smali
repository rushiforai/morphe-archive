.class public final Lcom/google/android/exoplayer2/n$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/e;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "g"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/n$g$a;
    }
.end annotation


# static fields
.field public static final f:Lcom/google/android/exoplayer2/n$g;

.field public static final g:Ljava/lang/String;

.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Lcom/google/android/exoplayer2/e$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/exoplayer2/e$a<",
            "Lcom/google/android/exoplayer2/n$g;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:J

.field public final b:J

.field public final c:J

.field public final d:F

.field public final e:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$g$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/exoplayer2/n$g$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/n$g$a;->f()Lcom/google/android/exoplayer2/n$g;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->f:Lcom/google/android/exoplayer2/n$g;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->g:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->h:Ljava/lang/String;

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->i:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->j:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v0, 0x4

    .line 41
    invoke-static {v0}, Ll/bmk0;->z0(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->k:Ljava/lang/String;

    .line 46
    .line 47
    new-instance v0, Ll/wsx;

    .line 48
    .line 49
    invoke-direct {v0}, Ll/wsx;-><init>()V

    .line 50
    .line 51
    .line 52
    sput-object v0, Lcom/google/android/exoplayer2/n$g;->l:Lcom/google/android/exoplayer2/e$a;

    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>(JJJFF)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-wide p1, p0, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 29
    iput-wide p3, p0, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 30
    iput-wide p5, p0, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 31
    iput p7, p0, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 32
    iput p8, p0, Lcom/google/android/exoplayer2/n$g;->e:F

    return-void
.end method

.method public constructor <init>(Lcom/google/android/exoplayer2/n$g$a;)V
    .locals 9

    .line 1
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$g$a;->a(Lcom/google/android/exoplayer2/n$g$a;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v1

    .line 5
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$g$a;->b(Lcom/google/android/exoplayer2/n$g$a;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v3

    .line 9
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$g$a;->c(Lcom/google/android/exoplayer2/n$g$a;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v5

    .line 13
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$g$a;->d(Lcom/google/android/exoplayer2/n$g$a;)F

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    invoke-static {p1}, Lcom/google/android/exoplayer2/n$g$a;->e(Lcom/google/android/exoplayer2/n$g$a;)F

    .line 18
    .line 19
    .line 20
    move-result v8

    .line 21
    move-object v0, p0

    .line 22
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/n$g;-><init>(JJJFF)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/n$g$a;Lcom/google/android/exoplayer2/n$a;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/n$g;-><init>(Lcom/google/android/exoplayer2/n$g$a;)V

    return-void
.end method

.method public static synthetic a(Landroid/os/Bundle;)Lcom/google/android/exoplayer2/n$g;
    .locals 12

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$g;

    .line 2
    .line 3
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->g:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v2, Lcom/google/android/exoplayer2/n$g;->f:Lcom/google/android/exoplayer2/n$g;

    .line 6
    .line 7
    iget-wide v3, v2, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 8
    .line 9
    invoke-virtual {p0, v1, v3, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->h:Ljava/lang/String;

    .line 14
    .line 15
    iget-wide v5, v2, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 16
    .line 17
    invoke-virtual {p0, v1, v5, v6}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 18
    .line 19
    .line 20
    move-result-wide v5

    .line 21
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->i:Ljava/lang/String;

    .line 22
    .line 23
    iget-wide v7, v2, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 24
    .line 25
    invoke-virtual {p0, v1, v7, v8}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 26
    .line 27
    .line 28
    move-result-wide v7

    .line 29
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->j:Ljava/lang/String;

    .line 30
    .line 31
    iget v9, v2, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 32
    .line 33
    invoke-virtual {p0, v1, v9}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    sget-object v9, Lcom/google/android/exoplayer2/n$g;->k:Ljava/lang/String;

    .line 38
    .line 39
    iget v2, v2, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 40
    .line 41
    invoke-virtual {p0, v9, v2}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    move-wide v10, v7

    .line 46
    move v7, v1

    .line 47
    move-wide v1, v3

    .line 48
    move-wide v3, v5

    .line 49
    move-wide v5, v10

    .line 50
    move v8, p0

    .line 51
    invoke-direct/range {v0 .. v8}, Lcom/google/android/exoplayer2/n$g;-><init>(JJJFF)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method


# virtual methods
.method public b()Lcom/google/android/exoplayer2/n$g$a;
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/n$g$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/google/android/exoplayer2/n$g$a;-><init>(Lcom/google/android/exoplayer2/n$g;Lcom/google/android/exoplayer2/n$a;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/exoplayer2/n$g;

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
    check-cast p1, Lcom/google/android/exoplayer2/n$g;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 38
    .line 39
    iget v3, p1, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 40
    .line 41
    cmpl-float v1, v1, v3

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget p0, p0, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 46
    .line 47
    iget p1, p1, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 48
    .line 49
    cmpl-float p0, p0, p1

    .line 50
    .line 51
    if-nez p0, :cond_2

    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget-wide v0, p0, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 2
    .line 3
    const/16 v2, 0x20

    .line 4
    .line 5
    ushr-long v3, v0, v2

    .line 6
    .line 7
    xor-long/2addr v0, v3

    .line 8
    long-to-int v0, v0

    .line 9
    mul-int/lit8 v0, v0, 0x1f

    .line 10
    .line 11
    iget-wide v3, p0, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 12
    .line 13
    ushr-long v5, v3, v2

    .line 14
    .line 15
    xor-long/2addr v3, v5

    .line 16
    long-to-int v1, v3

    .line 17
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x1f

    .line 19
    .line 20
    iget-wide v3, p0, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 21
    .line 22
    ushr-long v1, v3, v2

    .line 23
    .line 24
    xor-long/2addr v1, v3

    .line 25
    long-to-int v1, v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x1f

    .line 28
    .line 29
    iget v1, p0, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    cmpl-float v3, v1, v2

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    if-eqz v3, :cond_0

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v1, v4

    .line 43
    :goto_0
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x1f

    .line 45
    .line 46
    iget p0, p0, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 47
    .line 48
    cmpl-float v1, p0, v2

    .line 49
    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    :cond_1
    add-int/2addr v0, v4

    .line 57
    return v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .locals 6

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 7
    .line 8
    sget-object v3, Lcom/google/android/exoplayer2/n$g;->f:Lcom/google/android/exoplayer2/n$g;

    .line 9
    .line 10
    iget-wide v4, v3, Lcom/google/android/exoplayer2/n$g;->a:J

    .line 11
    .line 12
    cmp-long v4, v1, v4

    .line 13
    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    sget-object v4, Lcom/google/android/exoplayer2/n$g;->g:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v4, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-wide v1, p0, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 22
    .line 23
    iget-wide v4, v3, Lcom/google/android/exoplayer2/n$g;->b:J

    .line 24
    .line 25
    cmp-long v4, v1, v4

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    sget-object v4, Lcom/google/android/exoplayer2/n$g;->h:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v4, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-wide v1, p0, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 35
    .line 36
    iget-wide v4, v3, Lcom/google/android/exoplayer2/n$g;->c:J

    .line 37
    .line 38
    cmp-long v4, v1, v4

    .line 39
    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    sget-object v4, Lcom/google/android/exoplayer2/n$g;->i:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v4, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget v1, p0, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 48
    .line 49
    iget v2, v3, Lcom/google/android/exoplayer2/n$g;->d:F

    .line 50
    .line 51
    cmpl-float v2, v1, v2

    .line 52
    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    sget-object v2, Lcom/google/android/exoplayer2/n$g;->j:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget p0, p0, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 61
    .line 62
    iget v1, v3, Lcom/google/android/exoplayer2/n$g;->e:F

    .line 63
    .line 64
    cmpl-float v1, p0, v1

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    sget-object v1, Lcom/google/android/exoplayer2/n$g;->k:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 71
    .line 72
    .line 73
    :cond_4
    return-object v0
.end method
