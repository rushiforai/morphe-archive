.class public Ll/zsc0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zsc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:I

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zsc0$a;->h:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->text:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/zsc0$a;->g:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/zsc0$a;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zsc0$a;->c(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/zsc0$a;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zsc0$a;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zsc0$a;->h:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->color:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->name:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zsc0$a;->h:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public e()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ruf0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zsc0$a;->e:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zsc0$a;->f:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Ll/zsc0$a;->d:I

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/aiv;->z0(ILjava/lang/String;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/xsc0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xsc0;-><init>(Ll/zsc0$a;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->backgroundUrl:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, p0, Ll/zsc0$a;->e:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColorTemplate;->icons:Ljava/util/List;

    .line 42
    .line 43
    new-instance v1, Ll/ysc0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/ysc0;-><init>(Ll/zsc0$a;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;

    .line 53
    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->url:Ljava/lang/String;

    .line 57
    .line 58
    iput-object v0, p0, Ll/zsc0$a;->f:Ljava/lang/String;

    .line 59
    .line 60
    :cond_1
    iget-object v0, p0, Ll/zsc0$a;->e:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Ll/zsc0$a;->f:Ljava/lang/String;

    .line 63
    .line 64
    iget-object p0, p0, Ll/zsc0$a;->g:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v0, v1, p0}, Ll/vag;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method
