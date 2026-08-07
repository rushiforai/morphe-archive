.class public final Ll/sis0;
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
    const-string v0, "gads:csi_reporting_ratio"

    .line 2
    .line 3
    const-wide v1, 0x3fa999999999999aL    # 0.05

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Ll/kis0;->a(Ljava/lang/String;D)Ll/kis0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Ll/sis0;->a:Ll/kis0;

    .line 13
    .line 14
    const-string v0, "gads:sdk_csi_server"

    .line 15
    .line 16
    const-string v1, "https://csi.gstatic.com/csi"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/kis0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/kis0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Ll/sis0;->b:Ll/kis0;

    .line 23
    .line 24
    const-string v0, "gads:enabled_sdk_csi"

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-static {v0, v1}, Ll/kis0;->d(Ljava/lang/String;Z)Ll/kis0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/sis0;->c:Ll/kis0;

    .line 32
    .line 33
    return-void
.end method
