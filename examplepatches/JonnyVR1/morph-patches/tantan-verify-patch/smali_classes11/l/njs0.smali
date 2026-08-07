.class public final Ll/njs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;

.field public static final d:Ll/kis0;

.field public static final e:Ll/kis0;

.field public static final f:Ll/kis0;

.field public static final g:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "gads:adapter_initialization:red_button"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/njs0;->a:Ll/kis0;

    .line 9
    .line 10
    const-string v0, "gads:adapter_settings:red_button"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/njs0;->b:Ll/kis0;

    .line 17
    .line 18
    const-string v0, "gads:ads_service_force_stop:red_button"

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ll/njs0;->c:Ll/kis0;

    .line 25
    .line 26
    const-string v0, "gads:ad_serving:enabled"

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-static {v0, v2}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/njs0;->d:Ll/kis0;

    .line 34
    .line 35
    const-string v0, "gads:adaptive_banner:fail_invalid_ad_size"

    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Ll/njs0;->e:Ll/kis0;

    .line 42
    .line 43
    const-string v0, "gads:sdk_use_dynamic_module"

    .line 44
    .line 45
    invoke-static {v0, v2}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sput-object v0, Ll/njs0;->f:Ll/kis0;

    .line 50
    .line 51
    const-string v0, "gads:signal_adapters:red_button"

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sput-object v0, Ll/njs0;->g:Ll/kis0;

    .line 58
    .line 59
    return-void
.end method
