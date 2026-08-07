.class public final Ll/ypy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aqy0;


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
    const-string v1, "measurement.collection.enable_session_stitching_token.client.dev"

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 24
    .line 25
    .line 26
    const-string v1, "measurement.collection.enable_session_stitching_token.first_open_fix"

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 29
    .line 30
    .line 31
    const-string v1, "measurement.session_stitching_token_enabled"

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v0, v1, v3}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sput-object v1, Ll/ypy0;->a:Ll/sqx0;

    .line 39
    .line 40
    const-string v1, "measurement.link_sst_to_sid"

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Ll/asx0;->d(Ljava/lang/String;Z)Ll/sqx0;

    .line 43
    .line 44
    .line 45
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
    sget-object p0, Ll/ypy0;->a:Ll/sqx0;

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
