.class public interface abstract Lcom/tencent/ugc/TXRecordCommon$ITXVideoRecordListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/ugc/TXRecordCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ITXVideoRecordListener"
.end annotation


# virtual methods
.method public abstract onRecordComplete(Lcom/tencent/ugc/TXRecordCommon$TXRecordResult;)V
.end method

.method public abstract onRecordEvent(ILandroid/os/Bundle;)V
.end method

.method public abstract onRecordProgress(J)V
.end method
