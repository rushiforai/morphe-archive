.class public Ll/wtd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/wyd0;

.field public static b:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    const-string v1, "intl_deferred_deeplink_live_id"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/wtd;->a:Ll/wyd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    const-string v1, "intl_deferred_deeplink_show_live"

    .line 15
    .line 16
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/wtd;->b:Ll/jxd0;

    .line 22
    .line 23
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
