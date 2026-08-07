.class public final Ll/kqy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lqy0;


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
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final c:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final d:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final e:Ll/sqx0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/sqx0<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

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
    const-string v1, "measurement.sgtm.google_signal.enable"

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
    sput-object v1, Ll/kqy0;->a:Ll/sqx0;

    .line 28
    .line 29
    const-string v1, "measurement.sgtm.preview_mode_enabled"

    .line 30
    .line 31
    const/4 v3, 0x1

    .line 32
    invoke-virtual {v0, v1, v3}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sput-object v1, Ll/kqy0;->b:Ll/sqx0;

    .line 37
    .line 38
    const-string v1, "measurement.sgtm.rollout_percentage_fix"

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    sput-object v1, Ll/kqy0;->c:Ll/sqx0;

    .line 45
    .line 46
    const-string v1, "measurement.sgtm.service"

    .line 47
    .line 48
    invoke-virtual {v0, v1, v3}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    sput-object v1, Ll/kqy0;->d:Ll/sqx0;

    .line 53
    .line 54
    const-string v1, "measurement.sgtm.upload_queue"

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    sput-object v1, Ll/kqy0;->e:Ll/sqx0;

    .line 61
    .line 62
    const-string v1, "measurement.id.sgtm"

    .line 63
    .line 64
    const-wide/16 v2, 0x0

    .line 65
    .line 66
    invoke-virtual {v0, v1, v2, v3}, Ll/asx0;->b(Ljava/lang/String;J)Ll/sqx0;

    .line 67
    .line 68
    .line 69
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
.method public final zza()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final zzb()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kqy0;->a:Ll/sqx0;

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

.method public final zzc()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kqy0;->b:Ll/sqx0;

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

.method public final zzd()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kqy0;->c:Ll/sqx0;

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

.method public final zze()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kqy0;->d:Ll/sqx0;

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

.method public final zzf()Z
    .locals 0

    .line 1
    sget-object p0, Ll/kqy0;->e:Ll/sqx0;

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
