.class public Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MMLiveLinkMember"
.end annotation


# instance fields
.field public h:F

.field public isMuteAudio:Z

.field public muteFlag:I

.field public offlineFlag:I

.field public userid:Ljava/lang/String;

.field public volume:F

.field public w:F

.field public x:F

.field public y:F

.field public z:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->volume:F

    .line 6
    .line 7
    return-void
.end method
