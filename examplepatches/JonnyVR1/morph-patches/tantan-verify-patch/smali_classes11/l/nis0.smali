.class public final Ll/nis0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ll/kis0;

.field public static final b:Ll/kis0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "gads:timeout_for_app_set_id_info_gmscore:enabled"

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
    sput-object v0, Ll/nis0;->a:Ll/kis0;

    .line 9
    .line 10
    const-string v0, "gads:timeout_for_app_set_id_info_gmscore:millis"

    .line 11
    .line 12
    const-wide/16 v1, 0x7d0

    .line 13
    .line 14
    invoke-static {v0, v1, v2}, Ll/kis0;->b(Ljava/lang/String;J)Ll/kis0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Ll/nis0;->b:Ll/kis0;

    .line 19
    .line 20
    return-void
.end method
