.class public Ll/odt$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/cmb0$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/odt;->j()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->yn()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 p1, 0x0

    .line 10
    if-eqz p0, :cond_2

    .line 11
    .line 12
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/sre0;->a:Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-boolean p0, Ll/tbs;->c:Z

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    invoke-static {p0}, Ll/v5k0;->o(Landroid/content/Context;)Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0, p3, p4}, Ll/fss;->p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    iget-object p0, p3, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 41
    .line 42
    iget-object p2, p3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {p0, p1, p2}, Ll/gss;->c(Ljava/lang/String;ZLjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {p3, p4}, Ll/odt;->i(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_2
    :goto_0
    return p1
.end method

.method public b(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;
    .locals 0

    .line 1
    invoke-virtual {p3}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mqr;->l()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-static {p3, p4}, Ll/fss;->h(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const-string p0, "live.schema.push.all"

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    const-string p0, "live.schema.boutique.enter"

    .line 28
    .line 29
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    :cond_2
    iget-boolean p0, p3, Lcom/p1/mobile/putong/data/PushMessage;->silent:Z

    .line 36
    .line 37
    if-nez p0, :cond_3

    .line 38
    .line 39
    iget-object p0, p3, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {p0, p4}, Ll/cft;->b(Ljava/lang/String;Lcom/p1/mobile/putong/api/push/PushTrackData;)Landroid/app/PendingIntent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_3
    const/4 p0, 0x1

    .line 47
    invoke-static {p3, p4, p0}, Ll/cft;->a(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Z)Landroid/app/PendingIntent;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0
.end method
