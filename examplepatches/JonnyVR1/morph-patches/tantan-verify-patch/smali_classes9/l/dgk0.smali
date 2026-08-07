.class public Ll/dgk0;
.super Ll/jk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jk2<",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
        "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wbg0;Ll/zod;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
            ">;",
            "Ll/zod;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ll/jk2;-><init>(Ll/wbg0;Ll/zod;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getContent()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getRoomId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;->getRoomId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string p2, "no_care"

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p2}, Ll/mq2;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_1

    .line 32
    .line 33
    :cond_0
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;
    .locals 0

    .line 1
    return-object p2
.end method

.method public b()Ljava/lang/Class;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;",
            ">;"
        }
    .end annotation

    .line 1
    const-class p0, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "live.notice.userWithBgColorSocketNotification"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic q(Lcom/google/protobuf/q;Ljava/lang/String;)Z
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dgk0;->B(Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public bridge synthetic z(Ljava/lang/String;Lcom/google/protobuf/q;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dgk0;->C(Ljava/lang/String;Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;)Lcom/p1/mobile/longlink/msg/liveadmininner/LongLinkAdminMessage$UserWithBgColorSocketNotification;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
