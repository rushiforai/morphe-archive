.class public Ll/eyr;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:Ll/x20;

.field public b:Ll/x20;

.field public c:Ll/y20;


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


# virtual methods
.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eyr;->c:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public f0()Z
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method

.method public g0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;ILjava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTab;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/intl/voicesquare/base/LiveBaseQuickChatPageView;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public h0(Ll/x20;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eyr;->b:Ll/x20;

    .line 2
    .line 3
    iput-object p2, p0, Ll/eyr;->a:Ll/x20;

    .line 4
    .line 5
    return-void
.end method

.method public i0(Ll/y20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/eyr;->c:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public j0(ILjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/external/intl/voicesquare/base/LiveBaseQuickChatPageView;",
            ">;)V"
        }
    .end annotation

    const/4 p0, 0x0

    throw p0
.end method

.method public k0()V
    .locals 0

    const/4 p0, 0x0

    throw p0
.end method
