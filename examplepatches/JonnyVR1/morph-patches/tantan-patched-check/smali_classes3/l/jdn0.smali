.class public Ll/jdn0;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/ayn0;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

.field public final c:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;Ll/nsv;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ayn0;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jdn0;->a:Ll/ayn0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/jdn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

    .line 7
    .line 8
    iput-object p3, p0, Ll/jdn0;->c:Ll/nsv;

    .line 9
    .line 10
    iput-object p4, p0, Ll/jdn0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p5, p0, Ll/jdn0;->e:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Ll/jdn0;->a:Ll/ayn0;

    .line 5
    .line 6
    iget-object v2, p0, Ll/jdn0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;

    .line 7
    .line 8
    iget-object v3, p0, Ll/jdn0;->c:Ll/nsv;

    .line 9
    .line 10
    iget-object v4, p0, Ll/jdn0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v5, p0, Ll/jdn0;->e:Ljava/lang/String;

    .line 13
    .line 14
    move-object v0, p1

    .line 15
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->o(Ll/ayn0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEndSparkRanking;Ll/nsv;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->x8:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jdn0;->H(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/jdn0;->I(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jdn0;->J(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
