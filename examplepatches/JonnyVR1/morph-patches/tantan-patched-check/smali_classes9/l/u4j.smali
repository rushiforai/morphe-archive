.class public Ll/u4j;
.super Ll/mer;
.source "SourceFile"


# instance fields
.field public g:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public h:Ll/hpp0;

.field public i:Ll/kyt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/mer;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/u4j;->g:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 5
    .line 6
    new-instance v0, Ll/hpp0;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Ll/hpp0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/u4j;->h:Ll/hpp0;

    .line 12
    .line 13
    iget-boolean p2, p3, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->withMute:Z

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    new-instance p2, Ll/kyt;

    .line 18
    .line 19
    invoke-direct {p2, p1}, Ll/kyt;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/u4j;->i:Ll/kyt;

    .line 23
    .line 24
    :cond_0
    return-void
.end method


# virtual methods
.method public F2(Ll/dum;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4j;->h:Ll/hpp0;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/mer;->H2(Ll/l6t;Ll/dum;)Ll/l6t;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u4j;->i:Ll/kyt;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ll/mer;->H2(Ll/l6t;Ll/dum;)Ll/l6t;

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-super {p0, p1}, Ll/mer;->F2(Ll/dum;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public s2()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u4j;->h:Ll/hpp0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/hpp0;->s2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
