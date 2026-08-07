.class public Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;
    }
.end annotation


# instance fields
.field public musicUrl:Ljava/lang/String;

.field public playMusicType:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

.field public repeatCount:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->musicUrl:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->repeatCount:I

    .line 10
    .line 11
    sget-object v0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;->MMLivePlayMusicTypePlayoutAndPublish:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig;->playMusicType:Lcom/immomo/momomediaext/utils/MMLivePlayMusicConfig$MMLivePlayMusicType;

    .line 14
    .line 15
    return-void
.end method
