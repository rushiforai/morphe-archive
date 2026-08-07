.class public Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskStatus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/proxy/api/PreloadTaskInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskStatus"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskStatus$TaskStatusHin;
    }
.end annotation


# static fields
.field public static StrTaskStatus:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const-string v5, "\u4e0b\u8f7d\u5b8c\u6210"

    .line 2
    .line 3
    const-string v6, "\u5df2\u5220\u9664"

    .line 4
    .line 5
    const-string v0, "\u672a\u542f\u52a8"

    .line 6
    .line 7
    const-string v1, "\u4e0b\u8f7d\u4e2d"

    .line 8
    .line 9
    const-string v2, "\u6682\u505c"

    .line 10
    .line 11
    const-string v3, "\u5220\u9664\u4e2d..."

    .line 12
    .line 13
    const-string v4, "\u6682\u505c\u4e2d..."

    .line 14
    .line 15
    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskStatus;->StrTaskStatus:[Ljava/lang/String;

    .line 20
    .line 21
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
