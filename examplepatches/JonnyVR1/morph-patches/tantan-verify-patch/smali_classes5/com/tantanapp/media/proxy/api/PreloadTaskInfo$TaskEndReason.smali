.class public Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskEndReason"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason$TaskEndReasonHin;,
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason$TaskEndReasonCode;
    }
.end annotation


# static fields
.field public static StrTaskEndReason:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    const-string v6, "\u88ab\u6682\u505c"

    .line 2
    .line 3
    const-string v7, "\u5199\u78c1\u76d8\u5931\u8d25"

    .line 4
    .line 5
    const-string v0, "\u521d\u59cb\u5316,\u65e0\u9519\u8bef"

    .line 6
    .line 7
    const-string v1, "connect\u5931\u8d25"

    .line 8
    .line 9
    const-string v2, "\u8bfb\u9519\u8bef"

    .line 10
    .line 11
    const-string v3, "\u4e0b\u8f7d\u5b8c\u6210"

    .line 12
    .line 13
    const-string v4, "\u83b7\u53d6\u6587\u4ef6\u5927\u5c0f\u5931\u8d25"

    .line 14
    .line 15
    const-string v5, "\u88ab\u5220\u9664"

    .line 16
    .line 17
    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason;->StrTaskEndReason:[Ljava/lang/String;

    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
