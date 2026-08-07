.class public final Ll/qjs0;
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
    const-string v0, "gads:dynamite_load:fail:sample_rate"

    .line 2
    .line 3
    const-wide/16 v1, 0x2710

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/qjs0;->a:Ll/kis0;

    .line 10
    .line 11
    const-string v0, "gads:report_dynamite_crash_in_background_thread"

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/qjs0;->b:Ll/kis0;

    .line 19
    .line 20
    const-string v0, "gads:public_beta:traffic_multiplier"

    .line 21
    .line 22
    const-string v2, "1.0"

    .line 23
    .line 24
    invoke-static {v0, v2}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/qjs0;->c:Ll/kis0;

    .line 29
    .line 30
    const-string v0, "gads:sdk_crash_report_class_prefix"

    .line 31
    .line 32
    const-string v2, "com.google."

    .line 33
    .line 34
    invoke-static {v0, v2}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Ll/qjs0;->d:Ll/kis0;

    .line 39
    .line 40
    const-string v0, "gads:sdk_crash_report_enabled"

    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/qjs0;->e:Ll/kis0;

    .line 47
    .line 48
    const-string v0, "gads:sdk_crash_report_full_stacktrace"

    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/qjs0;->f:Ll/kis0;

    .line 55
    .line 56
    const-string v0, "gads:trapped_exception_sample_rate"

    .line 57
    .line 58
    const-wide v1, 0x3f847ae147ae147bL    # 0.01

    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    invoke-static {v0, v1, v2}, Ll/kis0;->a(Ljava/lang/String;D)Ll/kis0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    sput-object v0, Ll/qjs0;->g:Ll/kis0;

    .line 68
    .line 69
    return-void
.end method
