.class public Ll/w15;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/b25;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/ChatPartners;

.field public b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u7f51\u7edc\u9519\u8bef"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f0(Ll/w15;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w15;->l0(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic g0(Ll/w15;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w15;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/b25;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/b25;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public Z()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->Z()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/t15;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/t15;-><init>(Ll/w15;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPartnerScene;->ONLINE_SQUARE_ACTIVE:Lcom/p1/mobile/putong/core/data/ChatPartnerScene;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/dkb;->l7(Lcom/p1/mobile/putong/core/data/ChatPartnerScene;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/u15;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/u15;-><init>(Ll/w15;)V

    .line 34
    .line 35
    .line 36
    new-instance p0, Ll/v15;

    .line 37
    .line 38
    invoke-direct {p0}, Ll/v15;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public h0()Lcom/p1/mobile/putong/core/data/ChatPartners;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w15;->a:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    return-object p0
.end method

.method public i0()Lcom/p1/mobile/putong/core/data/ChatPartnerText;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w15;->b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 2
    .line 3
    return-object p0
.end method

.method public j0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w15;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->chatPartners:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 18
    .line 19
    iput-object v0, p0, Ll/w15;->a:Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 20
    .line 21
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v1, Ll/b25;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/b25;->m(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 29
    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 31
    .line 32
    const/16 v1, 0x4e21

    .line 33
    .line 34
    if-eq v0, v1, :cond_2

    .line 35
    .line 36
    const/16 v1, 0x4e22

    .line 37
    .line 38
    if-eq v0, v1, :cond_2

    .line 39
    .line 40
    const/16 v1, 0x4e23

    .line 41
    .line 42
    if-ne v0, v1, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    return-void

    .line 46
    :cond_2
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Meta;->message:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p1, p0, Ll/w15;->c:Ljava/lang/String;

    .line 49
    .line 50
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/core/data/ChatPartnerText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w15;->b:Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 2
    .line 3
    return-void
.end method
