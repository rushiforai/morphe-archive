.class public Ll/lwh;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/cxh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/putong/data/DoublePair;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/lwh;->e:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic e0(Ll/lwh;Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lwh;->i0(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic f0(Ll/lwh;Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lwh;->j0(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public Z()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public g0(Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/lwh;->d:Z

    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/DetectRequest;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DetectRequest;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "moment"

    .line 10
    .line 11
    invoke-static {v1}, Lcom/p1/mobile/putong/data/DetectCategoryType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->category:Lcom/p1/mobile/putong/data/DetectCategoryType;

    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/data/DetectText;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/DetectText;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v2, "myState"

    .line 23
    .line 24
    iput-object v2, v1, Lcom/p1/mobile/putong/data/DetectText;->key:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, v1, Lcom/p1/mobile/putong/data/DetectText;->value:Ljava/lang/String;

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/DetectRequest;->text:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/jka;->P6(Lcom/p1/mobile/putong/data/DetectRequest;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    new-instance v0, Ll/jwh;

    .line 49
    .line 50
    invoke-direct {v0, p0, p2}, Ll/jwh;-><init>(Ll/lwh;Ll/x20;)V

    .line 51
    .line 52
    .line 53
    new-instance v1, Ll/kwh;

    .line 54
    .line 55
    invoke-direct {v1, p0, p2}, Ll/kwh;-><init>(Ll/lwh;Ll/x20;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public h0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    :try_start_0
    const-string v0, "extra_addressInfo_name"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/lwh;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "extra_addressInfo_address"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/lwh;->b:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "extra_addressInfo_location"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/data/DoublePair;

    .line 24
    .line 25
    iput-object p1, p0, Ll/lwh;->c:Lcom/p1/mobile/putong/data/DoublePair;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p0

    .line 29
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/android/app/App;->d:Lcom/p1/mobile/android/app/App;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/App;->k(Ljava/lang/Throwable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final synthetic i0(Ll/x20;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/lwh;->d:Z

    .line 3
    .line 4
    const-class p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Detect;->text:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/data/Detect;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-eqz p2, :cond_0

    .line 29
    .line 30
    invoke-interface {p1}, Ll/x20;->call()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    const-string p1, "p_set_my_state_post"

    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/ksg;->l(Lcom/p1/mobile/putong/data/Detect;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->s:I

    .line 43
    .line 44
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->W2:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic j0(Ll/x20;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    iput-boolean p2, p0, Ll/lwh;->d:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ll/x20;->call()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->e:Ll/ms8;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->m:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p0}, Ll/ms8;->V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    return-void
.end method
