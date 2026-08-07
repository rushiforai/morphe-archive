.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItemRenderType;,
        Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;
    }
.end annotation


# instance fields
.field public subTitle:Ljava/lang/String;

.field public svipWeeklyItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
