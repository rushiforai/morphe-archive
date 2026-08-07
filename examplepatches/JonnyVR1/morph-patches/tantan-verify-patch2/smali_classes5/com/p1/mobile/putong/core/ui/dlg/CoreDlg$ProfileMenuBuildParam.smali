.class public Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProfileMenuBuildParam"
.end annotation


# instance fields
.field public contentType:Ljava/lang/String;

.field public momentId:Ljava/lang/String;

.field public profileCommentText:Ljava/lang/String;

.field public reportFrom:Lcom/p1/mobile/putong/core/data/ReportFrom;

.field public reportTypeId:Ljava/lang/String;


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


# virtual methods
.method public setContentType(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->contentType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setMomentIdText(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    .locals 0

    return-object p0
.end method

.method public setProfileCommentText(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->profileCommentText:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setReportFrom(Lcom/p1/mobile/putong/core/data/ReportFrom;)Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportFrom:Lcom/p1/mobile/putong/core/data/ReportFrom;

    .line 2
    .line 3
    return-object p0
.end method

.method public setReportTypeId(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg$ProfileMenuBuildParam;->reportTypeId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
