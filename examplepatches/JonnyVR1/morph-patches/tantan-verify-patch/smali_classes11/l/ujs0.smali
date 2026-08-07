.class public final Ll/ujs0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;

.field public static final c:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "gads:ad_loader:timeout_ms"

    .line 2
    .line 3
    const-wide/32 v1, 0xea60

    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/ujs0;->a:Ll/kis0;

    .line 11
    .line 12
    const-string v0, "gads:rendering:timeout_ms"

    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/ujs0;->b:Ll/kis0;

    .line 19
    .line 20
    const-string v0, "gads:resolve_future:default_timeout_ms"

    .line 21
    .line 22
    const-wide/16 v1, 0x7530

    .line 23
    .line 24
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sput-object v0, Ll/ujs0;->c:Ll/kis0;

    .line 29
    .line 30
    return-void
.end method
