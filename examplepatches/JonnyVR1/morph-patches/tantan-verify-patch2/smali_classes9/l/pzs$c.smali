.class public Ll/pzs$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pzs;->x(Ll/hti;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/z20<",
        "Ljava/lang/String;",
        "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/pzs;


# direct methods
.method public constructor <init>(Ll/pzs;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pzs$c;->a:Ll/pzs;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const-string v0, "PhotoAlbumFeedPreviewAdapter"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "NewMeetAct"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 21
    .line 22
    if-ne p2, v0, :cond_2

    .line 23
    .line 24
    const-string p2, "PlayerView"

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll/pzs$c;->a:Ll/pzs;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-static {p0, p1}, Ll/pzs;->m(Ll/pzs;Z)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    iget-object p0, p0, Ll/pzs$c;->a:Ll/pzs;

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-virtual {p0, p1, p1}, Ll/pzs;->K0(ZZ)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/pzs$c;->a(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
