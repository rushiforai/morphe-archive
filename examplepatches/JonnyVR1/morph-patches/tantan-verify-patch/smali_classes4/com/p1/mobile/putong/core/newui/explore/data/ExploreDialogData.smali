.class public Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;
    }
.end annotation


# instance fields
.field public exploreUploadPic:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;

.field public pop_up_icon:Ljava/lang/String;

.field public pop_up_sub_title:Ljava/lang/String;

.field public pop_up_title:Ljava/lang/String;

.field public skip:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_icon:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->pop_up_sub_title:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->skip:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;

    .line 13
    .line 14
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;->exploreUploadPic:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;

    .line 18
    .line 19
    iput-object p5, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;->new_pop_up_title:Ljava/lang/String;

    .line 20
    .line 21
    iput-object p6, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;->new_pop_up_sub_title:Ljava/lang/String;

    .line 22
    .line 23
    iput-object p7, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;->new_pop_up_box_title:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p8, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;->new_pop_up_warning:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p9, p1, Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData$ExploreUploadPic;->type:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method
