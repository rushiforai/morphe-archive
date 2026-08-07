.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;
    }
.end annotation


# static fields
.field public static a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;


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

.method public static a(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Audio;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->e(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$a;->a:[I

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq p0, v1, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq p0, v1, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->x2:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->h0:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 34
    .line 35
    .line 36
    return p1
.end method

.method public static b(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Audio;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->e(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$a;->a:[I

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eq p0, v0, :cond_2

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq p0, v1, :cond_2

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq p0, v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x4

    .line 25
    if-eq p0, v1, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x5

    .line 28
    if-eq p0, v1, :cond_0

    .line 29
    .line 30
    return v0

    .line 31
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->w2:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 34
    .line 35
    .line 36
    return p1

    .line 37
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->f0:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 40
    .line 41
    .line 42
    return p1

    .line 43
    :cond_2
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->y2:I

    .line 44
    .line 45
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 46
    .line 47
    .line 48
    return p1
.end method

.method public static c(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Audio;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->e(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$a;->a:[I

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    aget p0, p0, p1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eq p0, v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq p0, v1, :cond_1

    .line 20
    .line 21
    const/4 v1, 0x3

    .line 22
    if-eq p0, v1, :cond_0

    .line 23
    .line 24
    return v0

    .line 25
    :cond_0
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->x2:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 28
    .line 29
    .line 30
    return p1

    .line 31
    :cond_1
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->h0:I

    .line 32
    .line 33
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 34
    .line 35
    .line 36
    return p1
.end method

.method public static d(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Audio;",
            ")",
            "Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->AUDIO:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->NOTHING:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 25
    .line 26
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 27
    .line 28
    if-eqz p1, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->isFromShoot()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_2

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->SHOOT_VIDEO:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->ALBUM_VIDEO:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_3
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    if-eqz p1, :cond_5

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->isFromShoot()Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->SHOOT_PHOTO:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->ALBUM_PHOTO:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 56
    .line 57
    return-object p0

    .line 58
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;->NOTHING:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 59
    .line 60
    return-object p0
.end method

.method public static e(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Lcom/p1/mobile/putong/data/Audio;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->d(Ljava/util/ArrayList;Lcom/p1/mobile/putong/data/Audio;)Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sput-object p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/FeedPostPageMediaSelectableHandle$MomentMediaType;

    .line 6
    .line 7
    return-void
.end method
