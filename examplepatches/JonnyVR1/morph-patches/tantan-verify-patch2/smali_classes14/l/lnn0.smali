.class public Ll/lnn0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/onn0;",
        ">;"
    }
.end annotation


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

.method public static synthetic e0(Ll/lnn0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lnn0;->g0(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ar2;->lifecycleProviderImpl:Ll/ner;

    .line 2
    .line 3
    instance-of v0, p0, Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final synthetic g0(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/onn0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/onn0;->j(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h0()V
    .locals 2

    .line 1
    const-string v0, "liked_audio_room"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVoiceInternalSquareApi;->getLikedVoiceRooms(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/knn0;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/knn0;-><init>(Ll/lnn0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method
