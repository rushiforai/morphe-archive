.class public Ll/jm5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ll/jxd0;

.field public static b:Ll/jxd0;

.field public static c:Ll/jxd0;

.field public static d:Ll/wyd0;

.field public static e:Ll/jxd0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "activate_autoplay"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/jm5;->a:Ll/jxd0;

    .line 11
    .line 12
    new-instance v0, Ll/jxd0;

    .line 13
    .line 14
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 15
    .line 16
    const-string v2, "activate_preload_media"

    .line 17
    .line 18
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/jm5;->b:Ll/jxd0;

    .line 22
    .line 23
    new-instance v0, Ll/jxd0;

    .line 24
    .line 25
    sget-object v2, Ll/uqb0;->c0:Ll/bn5;

    .line 26
    .line 27
    invoke-interface {v2}, Ll/bn5;->X4()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "activate_autoplay_wifi_and_4g"

    .line 36
    .line 37
    invoke-direct {v0, v3, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Ll/jm5;->c:Ll/jxd0;

    .line 41
    .line 42
    new-instance v0, Ll/wyd0;

    .line 43
    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, "old_reviewed_picture_"

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    sget-object v3, Ll/uqb0;->c0:Ll/bn5;

    .line 52
    .line 53
    invoke-interface {v3}, Ll/bn5;->userId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, ""

    .line 65
    .line 66
    invoke-direct {v0, v2, v3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    sput-object v0, Ll/jm5;->d:Ll/wyd0;

    .line 70
    .line 71
    new-instance v0, Ll/jxd0;

    .line 72
    .line 73
    const-string v2, "oms_after_ad_show_need_click"

    .line 74
    .line 75
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 76
    .line 77
    .line 78
    sput-object v0, Ll/jm5;->e:Ll/jxd0;

    .line 79
    .line 80
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
