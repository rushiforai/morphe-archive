.class public Ll/smd;
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
.field public static final b:J


# instance fields
.field public final a:Landroid/app/ActivityManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/32 v0, 0x493e0

    .line 2
    .line 3
    .line 4
    sput-wide v0, Ll/smd;->b:J

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/app/ActivityManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/smd;->a:Landroid/app/ActivityManager;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/npy;
    .locals 8

    .line 1
    new-instance v0, Ll/npy;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/smd;->b()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const v5, 0x7fffffff

    .line 8
    .line 9
    .line 10
    sget-wide v6, Ll/smd;->b:J

    .line 11
    .line 12
    const/16 v2, 0x100

    .line 13
    .line 14
    const v3, 0x7fffffff

    .line 15
    .line 16
    .line 17
    const v4, 0x7fffffff

    .line 18
    .line 19
    .line 20
    invoke-direct/range {v0 .. v7}, Ll/npy;-><init>(IIIIIJ)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public final b()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/smd;->a:Landroid/app/ActivityManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getMemoryClass()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x100000

    .line 8
    .line 9
    mul-int/2addr p0, v0

    .line 10
    const v0, 0x7fffffff

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/high16 v0, 0x2000000

    .line 18
    .line 19
    if-ge p0, v0, :cond_0

    .line 20
    .line 21
    const/high16 p0, 0x400000

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    const/high16 v0, 0x4000000

    .line 25
    .line 26
    if-ge p0, v0, :cond_1

    .line 27
    .line 28
    const/high16 p0, 0x600000

    .line 29
    .line 30
    return p0

    .line 31
    :cond_1
    div-int/lit8 p0, p0, 0x4

    .line 32
    .line 33
    return p0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/smd;->a()Ll/npy;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
