.class public Ll/hzj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Z

.field public final e:Ljava/lang/String;

.field public final f:I

.field public g:Lcom/p1/mobile/putong/data/LangModel;

.field public final h:Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

.field public final i:Z


# direct methods
.method public constructor <init>(Ljava/util/List;ILjava/lang/String;ILjava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/jjs;",
            ">;I",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;",
            "Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/hzj;->d:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/hzj;->a:Ljava/util/List;

    .line 8
    .line 9
    iput p2, p0, Ll/hzj;->b:I

    .line 10
    .line 11
    iput-object p3, p0, Ll/hzj;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput p4, p0, Ll/hzj;->f:I

    .line 14
    .line 15
    iput-object p5, p0, Ll/hzj;->e:Ljava/lang/String;

    .line 16
    .line 17
    iput-object p6, p0, Ll/hzj;->h:Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 18
    .line 19
    iput-boolean p7, p0, Ll/hzj;->i:Z

    .line 20
    .line 21
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-static {p3}, Ll/cpj;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Ll/hzj;->g:Lcom/p1/mobile/putong/data/LangModel;

    .line 32
    .line 33
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;Ll/bjs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->s0(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogIndicator;Ll/bjs;)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;->E0(Ll/hzj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/hzj;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ll/hzj;->f:I

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzj;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzj;->g:Lcom/p1/mobile/putong/data/LangModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public e()Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hzj;->h:Lcom/p1/mobile/putong/live/base/data/BLiveTabEntrance;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/hzj;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public g(Landroid/view/ViewGroup;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget v0, Ll/yec0;->s1:I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftOuterContentView;

    .line 17
    .line 18
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/hzj;->i:Z

    .line 2
    .line 3
    return p0
.end method
