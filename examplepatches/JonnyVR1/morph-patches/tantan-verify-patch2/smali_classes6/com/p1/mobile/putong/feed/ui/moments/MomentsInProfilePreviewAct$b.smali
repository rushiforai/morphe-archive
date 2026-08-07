.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/Media;

.field public b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-nez v2, :cond_3

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    :goto_0
    return v1

    .line 49
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Moment;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_4
    if-nez p1, :cond_5

    .line 61
    .line 62
    return v0

    .line 63
    :cond_5
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Media;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->hashCode()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    :cond_1
    add-int/2addr v0, v1

    .line 23
    return v0
.end method
