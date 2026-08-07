.class public Ll/w5k;
.super Ll/owl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/owl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->d(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p3, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 20
    .line 21
    invoke-static {}, Ll/mbs;->G()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->r9()Ll/c8m0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1, p0}, Ll/c8m0;->b(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    .line 32
    :catch_0
    :goto_0
    return-void
.end method

.method public k(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "livechat.fixedroom.cell.newmsg"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
