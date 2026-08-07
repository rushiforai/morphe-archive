.class public interface abstract Lcom/meituan/robust/RobustCallBack;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract exceptionNotify(Ljava/lang/Throwable;Ljava/lang/String;)V
.end method

.method public abstract logNotify(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract onPatchApplied(ZLcom/meituan/robust/Patch;)V
.end method

.method public abstract onPatchFetched(ZZLcom/meituan/robust/Patch;)V
.end method

.method public abstract onPatchListFetched(ZZLjava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/util/List<",
            "Lcom/meituan/robust/Patch;",
            ">;)V"
        }
    .end annotation
.end method
