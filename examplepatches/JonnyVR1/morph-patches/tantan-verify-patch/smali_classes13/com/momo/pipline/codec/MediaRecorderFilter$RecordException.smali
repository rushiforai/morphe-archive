.class public Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException;
.super Ljava/lang/Exception;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;
    }
.end annotation


# instance fields
.field private exceptionType:Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;


# direct methods
.method public constructor <init>(Ljava/lang/Exception;Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException;->exceptionType:Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getExceptionType()Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException;->exceptionType:Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;

    .line 2
    .line 3
    return-object p0
.end method

.method public setExceptionType(Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException;->exceptionType:Lcom/momo/pipline/codec/MediaRecorderFilter$RecordException$ExceptionType;

    .line 2
    .line 3
    return-void
.end method
