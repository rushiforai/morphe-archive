.class public Ll/e1k0;
.super Ll/wr4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const-string v0, "UpdateConfigHandler"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/wr4;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e(Ll/aje;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Ll/cje;->q(Ll/aje;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    const/4 p1, 0x0

    .line 9
    const-string v0, "Event_Resource_Save_Config"

    .line 10
    .line 11
    invoke-static {v0, p0, p1}, Ll/u4d0;->a(Ljava/lang/String;ILjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method
