.class public final Ll/kpy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/epy0;


# static fields
.field public static final a:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final f:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Ll/asx0;

    .line 2
    .line 3
    const-string v1, "com.google.android.gms.measurement"

    .line 4
    .line 5
    invoke-static {v1}, Ll/xqx0;->a(Ljava/lang/String;)Landroid/net/Uri;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {v0, v1}, Ll/asx0;-><init>(Landroid/net/Uri;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/asx0;->f()Ll/asx0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/asx0;->e()Ll/asx0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "measurement.test.boolean_flag"

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sput-object v1, Ll/kpy0;->a:Ll/sqx0;

    .line 28
    .line 29
    const-string v1, "measurement.test.cached_long_flag"

    .line 30
    .line 31
    const-wide/16 v2, -0x1

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2, v3}, Ll/asx0;->b(Ljava/lang/String;J)Ll/sqx0;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sput-object v1, Ll/kpy0;->b:Ll/sqx0;

    .line 38
    .line 39
    const-string v1, "measurement.test.double_flag"

    .line 40
    .line 41
    const-wide/high16 v4, -0x3ff8000000000000L    # -3.0

    .line 42
    .line 43
    invoke-virtual {v0, v1, v4, v5}, Ll/asx0;->a(Ljava/lang/String;D)Ll/sqx0;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sput-object v1, Ll/kpy0;->c:Ll/sqx0;

    .line 48
    .line 49
    const-string v1, "measurement.test.int_flag"

    .line 50
    .line 51
    const-wide/16 v4, -0x2

    .line 52
    .line 53
    invoke-virtual {v0, v1, v4, v5}, Ll/asx0;->b(Ljava/lang/String;J)Ll/sqx0;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    sput-object v1, Ll/kpy0;->d:Ll/sqx0;

    .line 58
    .line 59
    const-string v1, "measurement.test.long_flag"

    .line 60
    .line 61
    invoke-virtual {v0, v1, v2, v3}, Ll/asx0;->b(Ljava/lang/String;J)Ll/sqx0;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    sput-object v1, Ll/kpy0;->e:Ll/sqx0;

    .line 66
    .line 67
    const-string v1, "measurement.test.string_flag"

    .line 68
    .line 69
    const-string v2, "---"

    .line 70
    .line 71
    invoke-virtual {v0, v1, v2}, Ll/asx0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/sqx0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sput-object v0, Ll/kpy0;->f:Ll/sqx0;

    .line 76
    .line 77
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


# virtual methods
.method public final zza()D
    .locals 2

    .line 1
    sget-object p0, Ll/kpy0;->c:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Double;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public final zzb()J
    .locals 2

    .line 1
    sget-object p0, Ll/kpy0;->b:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public final zzc()J
    .locals 2

    .line 1
    sget-object p0, Ll/kpy0;->d:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public final zzd()J
    .locals 2

    .line 1
    sget-object p0, Ll/kpy0;->e:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public final zze()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/kpy0;->f:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public final zzf()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kpy0;->a:Ll/sqx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/sqx0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
