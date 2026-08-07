.class public Ll/z5r;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/k6r;

.field public final b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

.field public final c:I


# direct methods
.method public constructor <init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/z5r;->a:Ll/k6r;

    .line 5
    .line 6
    iput-object p2, p0, Ll/z5r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 7
    .line 8
    iput p3, p0, Ll/z5r;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z5r;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;

    .line 5
    .line 6
    iget-object v1, p0, Ll/z5r;->a:Ll/k6r;

    .line 7
    .line 8
    iget p0, p0, Ll/z5r;->c:I

    .line 9
    .line 10
    invoke-virtual {p1, v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;->i0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Ll/k6r;I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->X2:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z5r;->H(Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvStageSuggestItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
