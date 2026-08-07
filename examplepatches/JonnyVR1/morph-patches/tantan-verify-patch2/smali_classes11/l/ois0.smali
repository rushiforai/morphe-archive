.class public final Ll/ois0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "gads:device_info_caching_expiry_ms:expiry"

    .line 2
    .line 3
    const-wide/32 v1, 0x493e0

    .line 4
    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Ll/ois0;->a:Ll/kis0;

    .line 11
    .line 12
    return-void
.end method
