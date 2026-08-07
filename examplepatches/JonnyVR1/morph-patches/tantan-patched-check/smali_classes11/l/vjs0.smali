.class public final Ll/vjs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;

.field public static final d:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "gads:invalidate_token_at_refresh_start"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Ll/vjs0;->a:Ll/kis0;

    .line 9
    .line 10
    const-string v0, "gms:expose_token_for_gma:enabled"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Ll/vjs0;->b:Ll/kis0;

    .line 17
    .line 18
    const-string v0, "gads:timeout_for_trustless_token:millis"

    .line 19
    .line 20
    const-wide/16 v1, 0x7d0

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sput-object v0, Ll/vjs0;->c:Ll/kis0;

    .line 27
    .line 28
    const-string v0, "gads:cached_token:ttl_millis"

    .line 29
    .line 30
    const-wide/32 v1, 0xa4cb80

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Ll/vjs0;->d:Ll/kis0;

    .line 38
    .line 39
    return-void
.end method
