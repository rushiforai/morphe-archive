.class public Ll/lod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/a7h0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/a7h0<",
        "Ll/npy;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x493e0

    .line 2
    .line 3
    .line 4
    sput-wide v0, Ll/lod;->a:J

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()I
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Runtime;->maxMemory()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/32 v2, 0x7fffffff

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    long-to-int p0, v0

    .line 17
    const/high16 v0, 0x1000000

    .line 18
    .line 19
    if-ge p0, v0, :cond_0

    .line 20
    .line 21
    const/high16 p0, 0x100000

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/high16 v0, 0x2000000

    .line 25
    .line 26
    if-ge p0, v0, :cond_1

    .line 27
    .line 28
    const/high16 p0, 0x200000

    .line 29
    .line 30
    return p0

    .line 31
    :cond_1
    const/high16 p0, 0x400000

    .line 32
    .line 33
    return p0
.end method


# virtual methods
.method public a()Ll/npy;
    .locals 8

    .line 1
    invoke-direct {p0}, Ll/lod;->b()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    div-int/lit8 v5, v1, 0x8

    .line 6
    .line 7
    new-instance v0, Ll/npy;

    .line 8
    .line 9
    const v4, 0x7fffffff

    .line 10
    .line 11
    .line 12
    sget-wide v6, Ll/lod;->a:J

    .line 13
    .line 14
    const v2, 0x7fffffff

    .line 15
    .line 16
    .line 17
    move v3, v1

    .line 18
    invoke-direct/range {v0 .. v7}, Ll/npy;-><init>(IIIIIJ)V

    .line 19
    .line 20
    .line 21
    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lod;->a()Ll/npy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
