.class public final Lhu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg1i;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lhu3;->a:Z

    new-instance v0, Lsee;

    invoke-direct {v0}, Lsee;-><init>()V

    iput-object v0, p0, Lhu3;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lku3;)V
    .registers 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhu3;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 15

    iget-object p0, p0, Lhu3;->d:Ljava/lang/Object;

    check-cast p0, Lsee;

    iget-object v0, p0, Lsee;->c:[Ljava/lang/Object;

    iget-object v1, p0, Lsee;->a:[J

    array-length v2, v1

    add-int/lit8 v2, v2, -0x2

    if-ltz v2, :cond_56

    const/4 v3, 0x0

    move v4, v3

    :goto_f
    aget-wide v5, v1, v4

    not-long v7, v5

    const/4 v9, 0x7

    shl-long/2addr v7, v9

    and-long/2addr v7, v5

    const-wide v9, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v7, v9

    cmp-long v7, v7, v9

    if-eqz v7, :cond_51

    sub-int v7, v4, v2

    not-int v7, v7

    ushr-int/lit8 v7, v7, 0x1f

    const/16 v8, 0x8

    rsub-int/lit8 v7, v7, 0x8

    move v9, v3

    :goto_29
    if-ge v9, v7, :cond_4f

    const-wide/16 v10, 0xff

    and-long/2addr v10, v5

    const-wide/16 v12, 0x80

    cmp-long v10, v10, v12

    if-gez v10, :cond_4b

    shl-int/lit8 v10, v4, 0x3

    add-int/2addr v10, v9

    aget-object v10, v0, v10

    instance-of v11, v10, Ldee;

    if-eqz v11, :cond_4b

    check-cast v10, Ldee;

    iget-object v11, v10, Ldee;->a:[Ljava/lang/Object;

    iget v10, v10, Ldee;->b:I

    move v12, v3

    :goto_44
    if-ge v12, v10, :cond_4b

    aget-object v13, v11, v12

    add-int/lit8 v12, v12, 0x1

    goto :goto_44

    :cond_4b
    shr-long/2addr v5, v8

    add-int/lit8 v9, v9, 0x1

    goto :goto_29

    :cond_4f
    if-ne v7, v8, :cond_56

    :cond_51
    if-eq v4, v2, :cond_56

    add-int/lit8 v4, v4, 0x1

    goto :goto_f

    :cond_56
    invoke-virtual {p0}, Lsee;->a()V

    return-void
.end method
