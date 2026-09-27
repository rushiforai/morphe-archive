.class final Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;
.super Ljava/lang/Object;
.source "SemanticCaptionTimeline.java"


# static fields
.field private static final PRESENTATION_LEAD_MS:J = 0x0L

.field private static volatile cues:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile currentVideo:Ljava/lang/String; = ""

.field private static volatile ownerVideo:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 12
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    sput-object v0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->cues:Ljava/util/List;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static activeCue(J)Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;
    .registers 10

    .line 39
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->cues:Ljava/util/List;

    .line 40
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_a

    return-object v2

    .line 41
    :cond_a
    sget-object v1, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->currentVideo:Ljava/lang/String;

    .line 42
    sget-object v3, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->ownerVideo:Ljava/lang/String;

    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_21

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_21

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    return-object v2

    .line 46
    :cond_21
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x0

    move v4, v3

    :goto_27
    if-ge v4, v1, :cond_3e

    add-int v5, v4, v1

    ushr-int/lit8 v5, v5, 0x1

    .line 49
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    iget-wide v6, v6, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v6, v6, p0

    if-gtz v6, :cond_3c

    add-int/lit8 v4, v5, 0x1

    goto :goto_27

    :cond_3c
    move v1, v5

    goto :goto_27

    :cond_3e
    add-int/lit8 v4, v4, -0x1

    .line 52
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 53
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;

    .line 54
    iget-wide v3, v0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->startMs:J

    cmp-long v1, p0, v3

    if-ltz v1, :cond_57

    iget-wide v3, v0, Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;->endMs:J

    cmp-long p0, p0, v3

    if-gez p0, :cond_57

    return-object v0

    :cond_57
    return-object v2
.end method

.method static currentVideoId()Ljava/lang/String;
    .registers 1

    .line 25
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->currentVideo:Ljava/lang/String;

    return-object v0
.end method

.method static onVideoId(Ljava/lang/String;)V
    .registers 1

    if-nez p0, :cond_5

    .line 21
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :goto_9
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->currentVideo:Ljava/lang/String;

    return-void
.end method

.method static presentationTime(J)J
    .registers 4

    const-wide/16 v0, 0x0

    .line 17
    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p0

    return-wide p0
.end method

.method static replace(Ljava/lang/String;Ljava/util/List;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lapp/yydarlinker/deepseekcaptions/CaptionDocument$Cue;",
            ">;)Z"
        }
    .end annotation

    if-nez p0, :cond_5

    .line 29
    const-string p0, ""

    goto :goto_9

    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 30
    :goto_9
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_11

    const/4 p0, 0x0

    return p0

    .line 31
    :cond_11
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->ownerVideo:Ljava/lang/String;

    if-nez p1, :cond_18

    .line 33
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_21

    .line 34
    :cond_18
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    :goto_21
    sput-object p0, Lapp/yydarlinker/deepseekcaptions/SemanticCaptionTimeline;->cues:Ljava/util/List;

    const/4 p0, 0x1

    return p0
.end method
