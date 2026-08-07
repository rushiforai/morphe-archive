.class public final Ll/gfy0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:Ll/gfy0;

.field public static final d:Ll/gfy0;

.field public static final e:Ll/gfy0;

.field public static final f:Ll/gfy0;

.field public static final g:Ll/gfy0;


# instance fields
.field public final a:J

.field public final b:J


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ll/gfy0;

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    invoke-direct {v0, v1, v2, v1, v2}, Ll/gfy0;-><init>(JJ)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/gfy0;->c:Ll/gfy0;

    .line 9
    .line 10
    new-instance v3, Ll/gfy0;

    .line 11
    .line 12
    const-wide v4, 0x7fffffffffffffffL

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    invoke-direct {v3, v4, v5, v4, v5}, Ll/gfy0;-><init>(JJ)V

    .line 18
    .line 19
    .line 20
    sput-object v3, Ll/gfy0;->d:Ll/gfy0;

    .line 21
    .line 22
    new-instance v3, Ll/gfy0;

    .line 23
    .line 24
    invoke-direct {v3, v4, v5, v1, v2}, Ll/gfy0;-><init>(JJ)V

    .line 25
    .line 26
    .line 27
    sput-object v3, Ll/gfy0;->e:Ll/gfy0;

    .line 28
    .line 29
    new-instance v3, Ll/gfy0;

    .line 30
    .line 31
    invoke-direct {v3, v1, v2, v4, v5}, Ll/gfy0;-><init>(JJ)V

    .line 32
    .line 33
    .line 34
    sput-object v3, Ll/gfy0;->f:Ll/gfy0;

    .line 35
    .line 36
    sput-object v0, Ll/gfy0;->g:Ll/gfy0;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v2, p1, v0

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/4 v4, 0x1

    .line 10
    if-ltz v2, :cond_0

    .line 11
    .line 12
    move v2, v4

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v2, v3

    .line 15
    :goto_0
    invoke-static {v2}, Ll/lev0;->d(Z)V

    .line 16
    .line 17
    .line 18
    cmp-long v0, p3, v0

    .line 19
    .line 20
    if-ltz v0, :cond_1

    .line 21
    .line 22
    move v3, v4

    .line 23
    :cond_1
    invoke-static {v3}, Ll/lev0;->d(Z)V

    .line 24
    .line 25
    .line 26
    iput-wide p1, p0, Ll/gfy0;->a:J

    .line 27
    .line 28
    iput-wide p3, p0, Ll/gfy0;->b:J

    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 6
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
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    const-class v2, Ll/gfy0;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    if-eq v2, v3, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    check-cast p1, Ll/gfy0;

    .line 18
    .line 19
    iget-wide v2, p0, Ll/gfy0;->a:J

    .line 20
    .line 21
    iget-wide v4, p1, Ll/gfy0;->a:J

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    iget-wide v2, p0, Ll/gfy0;->b:J

    .line 28
    .line 29
    iget-wide p0, p1, Ll/gfy0;->b:J

    .line 30
    .line 31
    cmp-long p0, v2, p0

    .line 32
    .line 33
    if-nez p0, :cond_2

    .line 34
    .line 35
    return v0

    .line 36
    :cond_2
    :goto_0
    return v1
.end method

.method public final hashCode()I
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/gfy0;->a:J

    .line 2
    .line 3
    long-to-int v0, v0

    .line 4
    iget-wide v1, p0, Ll/gfy0;->b:J

    .line 5
    .line 6
    mul-int/lit8 v0, v0, 0x1f

    .line 7
    .line 8
    long-to-int p0, v1

    .line 9
    add-int/2addr v0, p0

    .line 10
    return v0
.end method
