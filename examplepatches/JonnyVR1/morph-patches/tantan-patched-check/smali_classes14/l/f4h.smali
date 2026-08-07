.class public Ll/f4h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e4h;


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
.method public a(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Lcom/p1/mobile/android/app/Act;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    const/4 p0, -0x1

    .line 2
    return p0
.end method

.method public d(Landroid/view/View;Ll/ftn0$a;)V
    .locals 0

    .line 1
    return-void
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Landroid/view/View;Ll/pbi;)V
    .locals 0

    .line 1
    return-void
.end method

.method public g()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pbi;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "moment-nearby-entrance-user"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getFeedVoiceUserData(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/ftn0$a;",
            ">;"
        }
    .end annotation

    .line 1
    const-string p0, "moment-nearby-entrance-room"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->getFeedVoiceCardData(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
