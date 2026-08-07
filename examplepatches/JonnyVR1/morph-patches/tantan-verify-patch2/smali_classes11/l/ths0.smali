.class public final Ll/ths0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ll/ewr0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/mpr0;

.field public final synthetic b:Ll/gix0;


# direct methods
.method public constructor <init>(Ll/mpr0;Ll/gix0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ths0;->a:Ll/mpr0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ths0;->b:Ll/gix0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4

    .line 1
    check-cast p1, Ll/ewr0;

    .line 2
    .line 3
    check-cast p2, Ll/ewr0;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ths0;->a:Ll/mpr0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/ths0;->b:Ll/gix0;

    .line 8
    .line 9
    instance-of v1, p1, Ll/w4s0;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    instance-of p0, p2, Ll/w4s0;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v3

    .line 20
    :cond_0
    return v2

    .line 21
    :cond_1
    instance-of v1, p2, Ll/w4s0;

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    const/4 p0, -0x1

    .line 26
    return p0

    .line 27
    :cond_2
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-interface {p1}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-interface {p2}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_3
    const/4 v1, 0x2

    .line 43
    new-array v1, v1, [Ll/ewr0;

    .line 44
    .line 45
    aput-object p1, v1, v2

    .line 46
    .line 47
    aput-object p2, v1, v3

    .line 48
    .line 49
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {v0, p0, p1}, Ll/mpr0;->d(Ll/gix0;Ljava/util/List;)Ll/ewr0;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 62
    .line 63
    .line 64
    move-result-wide p0

    .line 65
    invoke-static {p0, p1}, Ll/tqw0;->a(D)D

    .line 66
    .line 67
    .line 68
    move-result-wide p0

    .line 69
    double-to-int p0, p0

    .line 70
    return p0
.end method
