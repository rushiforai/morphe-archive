.class public Ll/fpp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Ll/fpp0;",
        ">;"
    }
.end annotation


# static fields
.field public static d:Ll/fpp0;

.field public static e:Ll/fpp0;

.field public static f:Ll/fpp0;

.field public static g:Ll/fpp0;


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    new-instance v0, Ll/fpp0;

    .line 2
    .line 3
    const-wide/32 v3, 0xea60

    .line 4
    .line 5
    .line 6
    sget-object v5, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->NOTICE:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 7
    .line 8
    const-wide/32 v1, 0x7fffffff

    .line 9
    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, Ll/fpp0;-><init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/fpp0;->d:Ll/fpp0;

    .line 15
    .line 16
    new-instance v1, Ll/fpp0;

    .line 17
    .line 18
    const-wide/16 v4, 0x7530

    .line 19
    .line 20
    sget-object v6, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->MID_ALERT:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 21
    .line 22
    const-wide/32 v2, 0xfa000

    .line 23
    .line 24
    .line 25
    invoke-direct/range {v1 .. v6}, Ll/fpp0;-><init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V

    .line 26
    .line 27
    .line 28
    sput-object v1, Ll/fpp0;->e:Ll/fpp0;

    .line 29
    .line 30
    new-instance v2, Ll/fpp0;

    .line 31
    .line 32
    const-wide/16 v5, 0x2710

    .line 33
    .line 34
    sget-object v7, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->HIGH_ALERT:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 35
    .line 36
    const-wide/32 v3, 0x7d000

    .line 37
    .line 38
    .line 39
    invoke-direct/range {v2 .. v7}, Ll/fpp0;-><init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V

    .line 40
    .line 41
    .line 42
    sput-object v2, Ll/fpp0;->f:Ll/fpp0;

    .line 43
    .line 44
    new-instance v3, Ll/fpp0;

    .line 45
    .line 46
    const-wide/16 v6, 0x1388

    .line 47
    .line 48
    sget-object v8, Lcom/tantanapp/beatles/file/diskusage/WarningLevel;->URGENT_ALERT:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 49
    .line 50
    const-wide/32 v4, 0x19000

    .line 51
    .line 52
    .line 53
    invoke-direct/range {v3 .. v8}, Ll/fpp0;-><init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V

    .line 54
    .line 55
    .line 56
    sput-object v3, Ll/fpp0;->g:Ll/fpp0;

    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>(JJLcom/tantanapp/beatles/file/diskusage/WarningLevel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Ll/fpp0;->a:J

    .line 5
    .line 6
    iput-wide p3, p0, Ll/fpp0;->b:J

    .line 7
    .line 8
    iput-object p5, p0, Ll/fpp0;->c:Lcom/tantanapp/beatles/file/diskusage/WarningLevel;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/fpp0;)I
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iget-wide v0, p0, Ll/fpp0;->a:J

    .line 6
    .line 7
    iget-wide p0, p1, Ll/fpp0;->a:J

    .line 8
    .line 9
    sub-long/2addr v0, p0

    .line 10
    long-to-int p0, v0

    .line 11
    return p0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Ll/fpp0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fpp0;->a(Ll/fpp0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
