.class public final synthetic Ll/c2x0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/t6x0;


# static fields
.field public static final synthetic a:Ll/c2x0;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/c2x0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/c2x0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/c2x0;->a:Ll/c2x0;

    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/xww0;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ll/q2x0;

    .line 2
    .line 3
    sget-object p0, Ll/d2x0;->a:Ll/yww0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/q2x0;->b()Ll/v2x0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/v2x0;->b()Ll/gyw0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Ll/cyw0;->b(Ll/lxw0;)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :try_start_0
    invoke-static {}, Ll/jhx0;->a()Ll/jhx0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, Lcom/google/android/gms/internal/ads/u4;->O([BLl/jhx0;)Lcom/google/android/gms/internal/ads/u4;

    .line 22
    .line 23
    .line 24
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzhag; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    invoke-virtual {p1}, Ll/q2x0;->b()Ll/v2x0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/v2x0;->c()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/a2x0;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jxw0;->a(Ljava/lang/String;)Ll/ixw0;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-interface {p1}, Ll/ixw0;->zzb()Ll/jww0;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-direct {v0, p0, p1}, Ll/a2x0;-><init>(Lcom/google/android/gms/internal/ads/u4;Ll/jww0;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    new-instance p1, Ljava/security/GeneralSecurityException;

    .line 49
    .line 50
    const-string v0, "Parsing of DEK key template failed: "

    .line 51
    .line 52
    invoke-direct {p1, v0, p0}, Ljava/security/GeneralSecurityException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    throw p1
.end method
