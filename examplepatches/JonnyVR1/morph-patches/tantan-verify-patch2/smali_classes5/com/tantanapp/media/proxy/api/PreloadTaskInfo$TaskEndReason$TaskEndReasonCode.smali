.class public Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason$TaskEndReasonCode;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/proxy/api/PreloadTaskInfo$TaskEndReason;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskEndReasonCode"
.end annotation


# static fields
.field public static final END_COMPLETE:I = 0x3

.field public static final END_GET_FILESIZE_FAILED:I = 0x4

.field public static final END_NOT_CONNECT:I = 0x1

.field public static final END_NO_END:I = 0x0

.field public static final END_PAUSE:I = 0x6

.field public static final END_READ_ERROR:I = 0x2

.field public static final END_REMOVE:I = 0x5

.field public static final END_WRITE_FAILED:I = 0x7


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
