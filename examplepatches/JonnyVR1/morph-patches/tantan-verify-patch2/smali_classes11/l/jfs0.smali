.class public final Ll/jfs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final f:Ll/jfs0;

.field public static final g:Ljava/lang/String;

.field public static final h:Ljava/lang/String;

.field public static final i:Ljava/lang/String;

.field public static final j:Ljava/lang/String;

.field public static final k:Ljava/lang/String;

.field public static final l:Ll/mhy0;
    .annotation runtime Ljava/lang/Deprecated;
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
    .locals 2

    .line 1
    new-instance v0, Ll/ods0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ods0;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/jfs0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/jfs0;-><init>(Ll/ods0;)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Ll/jfs0;->f:Ll/jfs0;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    const/16 v1, 0x24

    .line 15
    .line 16
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sput-object v0, Ll/jfs0;->g:Ljava/lang/String;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, Ll/jfs0;->h:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v0, 0x2

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Ll/jfs0;->i:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v0, 0x3

    .line 37
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Ll/jfs0;->j:Ljava/lang/String;

    .line 42
    .line 43
    const/4 v0, 0x4

    .line 44
    invoke-static {v0, v1}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sput-object v0, Ll/jfs0;->k:Ljava/lang/String;

    .line 49
    .line 50
    sget-object v0, Ll/qcs0;->a:Ll/qcs0;

    .line 51
    .line 52
    sput-object v0, Ll/jfs0;->l:Ll/mhy0;

    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>(Ll/ods0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    iput-wide v0, p0, Ll/jfs0;->a:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/jfs0;->b:J

    .line 12
    .line 13
    iput-wide v0, p0, Ll/jfs0;->c:J

    .line 14
    .line 15
    const p1, -0x800001

    .line 16
    .line 17
    .line 18
    iput p1, p0, Ll/jfs0;->d:F

    .line 19
    .line 20
    iput p1, p0, Ll/jfs0;->e:F

    .line 21
    .line 22
    return-void
.end method

.method public synthetic constructor <init>(Ll/ods0;Ll/oes0;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Ll/jfs0;-><init>(Ll/ods0;)V

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 1
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
    instance-of p0, p1, Ll/jfs0;

    .line 6
    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_1
    return v0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    const p0, -0x800001

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const v1, -0x7fff87c1

    .line 9
    .line 10
    .line 11
    add-int/2addr v1, v0

    .line 12
    mul-int/lit8 v1, v1, 0x1f

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v1, p0

    .line 19
    return v1
.end method
