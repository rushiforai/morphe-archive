.class public Ll/bas;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/tqf0;

.field public final b:Ll/ajt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;Ll/ajt;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/tqf0;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p0}, Ll/tqf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;Ll/ogd0;Ll/bas;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/bas;->a:Ll/tqf0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/bas;->b:Ll/ajt;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bas;->a:Ll/tqf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tqf0;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bas;->a:Ll/tqf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/tqf0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p0, p0, Ll/bas;->a:Ll/tqf0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/tqf0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bas;->a:Ll/tqf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/tqf0;->e()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
