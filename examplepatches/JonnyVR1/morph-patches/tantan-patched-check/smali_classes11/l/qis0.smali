.class public final Ll/qis0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;

.field public static final d:Ll/kis0;

.field public static final e:Ll/kis0;

.field public static final f:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const-string v0, "gads:content_age_weight"

    .line 2
    .line 3
    const-wide/16 v1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/qis0;->a:Ll/kis0;

    .line 10
    .line 11
    const-string v0, "gads:enable_content_fetching"

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-static {v0, v3}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/qis0;->b:Ll/kis0;

    .line 19
    .line 20
    const-string v0, "gads:fingerprint_number"

    .line 21
    .line 22
    const-wide/16 v3, 0xa

    .line 23
    .line 24
    invoke-static {v0, v3, v4}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/qis0;->c:Ll/kis0;

    .line 29
    .line 30
    const-string v0, "gads:content_length_weight"

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sput-object v0, Ll/qis0;->d:Ll/kis0;

    .line 37
    .line 38
    const-string v0, "gads:min_content_len"

    .line 39
    .line 40
    const-wide/16 v1, 0xb

    .line 41
    .line 42
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Ll/qis0;->e:Ll/kis0;

    .line 47
    .line 48
    const-string v0, "gads:sleep_sec"

    .line 49
    .line 50
    invoke-static {v0, v3, v4}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Ll/qis0;->f:Ll/kis0;

    .line 55
    .line 56
    return-void
.end method
