.class public interface abstract Lcom/momo/mcamera/liveprocessor/IProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final FACE_PROCESS_BY_BYTEDANCE:I = 0x0

.field public static final FACE_PROCESS_BY_MOMO:I = 0x1


# virtual methods
.method public abstract process(Ll/omw;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/omw;",
            ")TT;"
        }
    .end annotation
.end method

.method public abstract release()V
.end method

.method public abstract setModelPath(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method
