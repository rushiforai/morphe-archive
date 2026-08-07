.class public final Ll/t6y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jcy0;


# static fields
.field public static final b:Ll/l8y0;


# instance fields
.field public final a:Ll/l8y0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/o6y0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/o6y0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/t6y0;->b:Ll/l8y0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    new-instance v0, Ll/y6y0;

    .line 2
    .line 3
    invoke-static {}, Ll/e2y0;->a()Ll/e2y0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const/4 v2, 0x2

    .line 8
    new-array v2, v2, [Ll/l8y0;

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    aput-object v1, v2, v3

    .line 12
    .line 13
    sget-object v1, Ll/t6y0;->b:Ll/l8y0;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    aput-object v1, v2, v3

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ll/y6y0;-><init>([Ll/l8y0;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/t6y0;-><init>(Ll/l8y0;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Ll/l8y0;)V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string v0, "messageInfoFactory"

    invoke-static {p1, v0}, Ll/i2y0;->f(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ll/l8y0;

    iput-object p1, p0, Ll/t6y0;->a:Ll/l8y0;

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/Class;)Ll/ocy0;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ll/ocy0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/vcy0;->l(Ljava/lang/Class;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/t6y0;->a:Ll/l8y0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/l8y0;->zza(Ljava/lang/Class;)Ll/h9y0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-interface {v1}, Ll/h9y0;->zzc()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/vcy0;->h()Ll/hfy0;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {}, Ll/i0y0;->a()Ll/e0y0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-interface {v1}, Ll/h9y0;->zza()Ll/m9y0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {p0, p1, v0}, Lcom/google/android/gms/internal/measurement/x0;->g(Ll/hfy0;Ll/e0y0;Ll/m9y0;)Lcom/google/android/gms/internal/measurement/x0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    invoke-static {}, Ll/dby0;->a()Ll/uay0;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {}, Ll/j6y0;->a()Ll/a6y0;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-static {}, Ll/vcy0;->h()Ll/hfy0;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    sget-object p0, Ll/c7y0;->a:[I

    .line 46
    .line 47
    invoke-interface {v1}, Ll/h9y0;->zzb()Lcom/google/android/gms/internal/measurement/zzln;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    aget p0, p0, v0

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    if-eq p0, v0, :cond_1

    .line 59
    .line 60
    invoke-static {}, Ll/i0y0;->a()Ll/e0y0;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    :goto_0
    move-object v5, p0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const/4 p0, 0x0

    .line 67
    goto :goto_0

    .line 68
    :goto_1
    invoke-static {}, Ll/z7y0;->a()Ll/q7y0;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    move-object v0, p1

    .line 73
    invoke-static/range {v0 .. v6}, Lcom/google/android/gms/internal/measurement/w0;->k(Ljava/lang/Class;Ll/h9y0;Ll/uay0;Ll/a6y0;Ll/hfy0;Ll/e0y0;Ll/q7y0;)Lcom/google/android/gms/internal/measurement/w0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0
.end method
