.class public final Ll/ujy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xjy0;


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
    const-string v1, "measurement.set_default_event_parameters_propagate_clear.client.dev"

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
    sput-object v1, Ll/ujy0;->a:Ll/sqx0;

    .line 28
    .line 29
    const-string v1, "measurement.set_default_event_parameters_propagate_clear.service"

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    sput-object v1, Ll/ujy0;->b:Ll/sqx0;

    .line 36
    .line 37
    const-string v1, "measurement.id.set_default_event_parameters_propagate_clear.experiment_id"

    .line 38
    .line 39
    const-wide/16 v2, 0x0

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3}, Ll/asx0;->b(Ljava/lang/String;J)Ll/sqx0;

    .line 42
    .line 43
    .line 44
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
    sget-object p0, Ll/ujy0;->a:Ll/sqx0;

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

.method public final zzb()Z
    .locals 0

    .line 1
    sget-object p0, Ll/ujy0;->b:Ll/sqx0;

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
