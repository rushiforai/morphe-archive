.class public final Lnicoid/network238/okio/internal/-FileSystem;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u001a\u0014\u0010\u0005\u001a\u00020\u0006*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u001a\u001c\u0010\u0007\u001a\u00020\u0008*\u00020\u00022\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u0006H\u0000\u001a\u001c\u0010\u000b\u001a\u00020\u0008*\u00020\u00022\u0006\u0010\u000c\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0004H\u0000\u001a\u001c\u0010\u000e\u001a\u00020\u0008*\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0006H\u0000\u001a\"\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0012*\u00020\u00022\u0006\u0010\t\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u0006H\u0000\u001aF\u0010\u0014\u001a\u00020\u0008*\u0008\u0012\u0004\u0012\u00020\u00040\u00152\u0006\u0010\u0016\u001a\u00020\u00022\u000c\u0010\u0017\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00182\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0013\u001a\u00020\u00062\u0006\u0010\u0019\u001a\u00020\u0006H\u0080@\u00a2\u0006\u0002\u0010\u001a\u001a\u0016\u0010\u001b\u001a\u0004\u0018\u00010\u0004*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "commonMetadata",
        "Lnicoid/network238/okio/FileMetadata;",
        "Lnicoid/network238/okio/FileSystem;",
        "path",
        "Lnicoid/network238/okio/Path;",
        "commonExists",
        "",
        "commonCreateDirectories",
        "",
        "dir",
        "mustCreate",
        "commonCopy",
        "source",
        "target",
        "commonDeleteRecursively",
        "fileOrDirectory",
        "mustExist",
        "commonListRecursively",
        "Lnicoid/network238/kotlin/sequences/Sequence;",
        "followSymlinks",
        "collectRecursively",
        "Lnicoid/network238/kotlin/sequences/SequenceScope;",
        "fileSystem",
        "stack",
        "Lnicoid/network238/kotlin/collections/ArrayDeque;",
        "postorder",
        "(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "symlinkTarget",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final collectRecursively(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/sequences/SequenceScope;",
            "Lnicoid/network238/okio/FileSystem;",
            "Lnicoid/network238/kotlin/collections/ArrayDeque;",
            "Lnicoid/network238/okio/Path;",
            "ZZ",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p6, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;

    if-eqz v0, :cond_0

    move-object v0, p6

    check-cast v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;

    iget v1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_0

    sub-int/2addr v1, v2

    iput v1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;

    invoke-direct {v0, p6}, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    :goto_0
    iget-object p6, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->result:Ljava/lang/Object;

    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 107
    iget v2, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    packed-switch v2, :pswitch_data_0

    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    invoke-static {p6}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_8

    :pswitch_1
    iget-boolean p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$1:Z

    iget-boolean p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$0:Z

    iget-object p2, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$4:Ljava/lang/Object;

    check-cast p2, Ljava/util/Iterator;

    iget-object p3, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$3:Ljava/lang/Object;

    check-cast p3, Lnicoid/network238/okio/Path;

    iget-object p4, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$2:Ljava/lang/Object;

    check-cast p4, Lnicoid/network238/kotlin/collections/ArrayDeque;

    iget-object p5, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$1:Ljava/lang/Object;

    check-cast p5, Lnicoid/network238/okio/FileSystem;

    iget-object v2, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$0:Ljava/lang/Object;

    check-cast v2, Lnicoid/network238/kotlin/sequences/SequenceScope;

    :try_start_0
    invoke-static {p6}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v7, p0

    move v6, p1

    move-object v4, p4

    move-object v3, p5

    move-object v8, v0

    goto/16 :goto_4

    .line 138
    :catchall_0
    move-exception v0

    move-object p0, v0

    goto/16 :goto_5

    .line 107
    :pswitch_2
    iget-boolean p5, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$1:Z

    iget-boolean p4, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$0:Z

    iget-object p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$3:Ljava/lang/Object;

    move-object p3, p0

    check-cast p3, Lnicoid/network238/okio/Path;

    iget-object p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$2:Ljava/lang/Object;

    move-object p2, p0

    check-cast p2, Lnicoid/network238/kotlin/collections/ArrayDeque;

    iget-object p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$1:Ljava/lang/Object;

    move-object p1, p0

    check-cast p1, Lnicoid/network238/okio/FileSystem;

    iget-object p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lnicoid/network238/kotlin/sequences/SequenceScope;

    invoke-static {p6}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_1

    :pswitch_3
    invoke-static {p6}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    if-nez p5, :cond_1

    .line 116
    iput-object p0, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$1:Ljava/lang/Object;

    iput-object p2, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$2:Ljava/lang/Object;

    iput-object p3, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$3:Ljava/lang/Object;

    iput-boolean p4, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$0:Z

    iput-boolean p5, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$1:Z

    const/4 p6, 0x1

    iput p6, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    invoke-virtual {p0, p3, v0}, Lnicoid/network238/kotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p6

    if-ne p6, v1, :cond_1

    goto/16 :goto_7

    .line 119
    :cond_1
    :goto_1
    invoke-virtual {p1, p3}, Lnicoid/network238/okio/FileSystem;->listOrNull(Lnicoid/network238/okio/Path;)Ljava/util/List;

    move-result-object p6

    if-nez p6, :cond_2

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p6

    .line 120
    :cond_2
    invoke-interface {p6}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7

    const/4 v2, 0x0

    move-object v3, p3

    :goto_2
    if-eqz p4, :cond_3

    .line 125
    invoke-virtual {p2, v3}, Lnicoid/network238/kotlin/collections/ArrayDeque;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "symlink cycle at "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 126
    :cond_3
    invoke-static {p1, v3}, Lnicoid/network238/okio/internal/-FileSystem;->symlinkTarget(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object v4

    if-nez v4, :cond_6

    if-nez p4, :cond_4

    if-eqz v2, :cond_4

    goto :goto_6

    .line 132
    :cond_4
    invoke-virtual {p2, v3}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 134
    :try_start_1
    invoke-interface {p6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v6, p4

    move v7, p5

    move-object p2, p6

    move-object v8, v0

    :goto_3
    :try_start_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    move-object v5, p0

    check-cast v5, Lnicoid/network238/okio/Path;

    .line 135
    iput-object v2, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$0:Ljava/lang/Object;

    iput-object v3, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$1:Ljava/lang/Object;

    iput-object v4, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$2:Ljava/lang/Object;

    iput-object p3, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$3:Ljava/lang/Object;

    iput-object p2, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$4:Ljava/lang/Object;

    iput-boolean v6, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$0:Z

    iput-boolean v7, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->Z$1:Z

    const/4 p0, 0x2

    iput p0, v8, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    invoke-static/range {v2 .. v8}, Lnicoid/network238/okio/internal/-FileSystem;->collectRecursively(Lnicoid/network238/kotlin/sequences/SequenceScope;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/kotlin/collections/ArrayDeque;Lnicoid/network238/okio/Path;ZZLnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eq p0, v1, :cond_8

    :goto_4
    goto :goto_3

    .line 138
    :cond_5
    invoke-virtual {v4}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeLast()Ljava/lang/Object;

    move-object p0, v2

    move p5, v7

    move-object v0, v8

    goto :goto_6

    :catchall_1
    move-exception v0

    move-object p0, v0

    move-object p4, v4

    goto :goto_5

    :catchall_2
    move-exception v0

    move-object p0, v0

    move-object p4, p2

    :goto_5
    invoke-virtual {p4}, Lnicoid/network238/kotlin/collections/ArrayDeque;->removeLast()Ljava/lang/Object;

    throw p0

    :cond_6
    add-int/lit8 v2, v2, 0x1

    move-object v3, v4

    goto :goto_2

    :cond_7
    :goto_6
    if-eqz p5, :cond_9

    .line 145
    const/4 p1, 0x0

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$0:Ljava/lang/Object;

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$1:Ljava/lang/Object;

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$2:Ljava/lang/Object;

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$3:Ljava/lang/Object;

    iput-object p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->L$4:Ljava/lang/Object;

    const/4 p1, 0x3

    iput p1, v0, Lnicoid/network238/okio/internal/-FileSystem$collectRecursively$1;->label:I

    invoke-virtual {p0, p3, v0}, Lnicoid/network238/kotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_9

    :cond_8
    :goto_7
    return-object v1

    .line 147
    :cond_9
    :goto_8
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final commonCopy(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Lnicoid/network238/okio/Path;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 188
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object p1

    .line 66
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x2

    :try_start_0
    invoke-static {p0, p2, v1, v2, v0}, Lnicoid/network238/okio/FileSystem;->sink$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)Lnicoid/network238/okio/Sink;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/BufferedSink;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 67
    :try_start_1
    invoke-interface {p0, p1}, Lnicoid/network238/okio/BufferedSink;->writeAll(Lnicoid/network238/okio/Source;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz p0, :cond_0

    .line 169
    :try_start_2
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    .line 174
    :cond_0
    :goto_0
    move-object p0, v0

    goto :goto_2

    .line 169
    :catchall_1
    move-exception p2

    if-eqz p0, :cond_1

    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_1

    :catchall_2
    move-exception p0

    .line 174
    :try_start_4
    invoke-static {p2, p0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    move-object p0, p2

    move-object p2, v0

    :goto_2
    if-nez p0, :cond_2

    .line 181
    invoke-virtual {p2}, Ljava/lang/Number;->longValue()J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-eqz p1, :cond_3

    .line 183
    :try_start_5
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_3

    :catchall_3
    move-exception v0

    goto :goto_3

    .line 179
    :cond_2
    :try_start_6
    throw p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    :catchall_4
    move-exception p0

    move-object v0, p0

    if-eqz p1, :cond_3

    .line 183
    :try_start_7
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_5

    goto :goto_3

    :catchall_5
    move-exception p0

    .line 188
    invoke-static {v0, p0}, Lnicoid/network238/kotlin/ExceptionsKt;->addSuppressed(Ljava/lang/Throwable;Ljava/lang/Throwable;)V

    :cond_3
    :goto_3
    if-nez v0, :cond_4

    return-void

    .line 195
    :cond_4
    throw v0
.end method

.method public static final commonCreateDirectories(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    new-instance v0, Lnicoid/network238/kotlin/collections/ArrayDeque;

    invoke-direct {v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;-><init>()V

    move-object v1, p1

    :goto_0
    if-eqz v1, :cond_0

    .line 49
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/FileSystem;->exists(Lnicoid/network238/okio/Path;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 50
    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/collections/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    .line 51
    invoke-virtual {v1}, Lnicoid/network238/okio/Path;->parent()Lnicoid/network238/okio/Path;

    move-result-object v1

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    .line 54
    invoke-virtual {v0}, Lnicoid/network238/kotlin/collections/ArrayDeque;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance p0, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " already exists."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 57
    :cond_1
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okio/Path;

    .line 59
    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-static {p0, p2, v0, v1, v2}, Lnicoid/network238/okio/FileSystem;->createDirectory$default(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;ZILjava/lang/Object;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method public static final commonDeleteRecursively(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    new-instance v0, Lnicoid/network238/okio/internal/-FileSystem$commonDeleteRecursively$sequence$1;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lnicoid/network238/okio/internal/-FileSystem$commonDeleteRecursively$sequence$1;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Lnicoid/network238/kotlin/coroutines/Continuation;)V

    invoke-static {v0}, Lnicoid/network238/kotlin/sequences/SequencesKt;->sequence(Lnicoid/network238/kotlin/jvm/functions/Function2;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p1

    .line 83
    invoke-interface {p1}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 84
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 85
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okio/Path;

    if-eqz p2, :cond_0

    .line 86
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/FileSystem;->delete(Lnicoid/network238/okio/Path;Z)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static final commonExists(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static final commonListRecursively(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;Z)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/FileSystem;",
            "Lnicoid/network238/okio/Path;",
            "Z)",
            "Lnicoid/network238/kotlin/sequences/Sequence;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    new-instance v0, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p0, p2, v1}, Lnicoid/network238/okio/internal/-FileSystem$commonListRecursively$1;-><init>(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;ZLnicoid/network238/kotlin/coroutines/Continuation;)V

    invoke-static {v0}, Lnicoid/network238/kotlin/sequences/SequencesKt;->sequence(Lnicoid/network238/kotlin/jvm/functions/Function2;)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p0

    return-object p0
.end method

.method public static final commonMetadata(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->metadataOrNull(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object p0

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/FileNotFoundException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "no such file: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final symlinkTarget(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/FileSystem;->metadata(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/FileMetadata;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okio/FileMetadata;->getSymlinkTarget()Lnicoid/network238/okio/Path;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 153
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okio/Path;->parent()Lnicoid/network238/okio/Path;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1, p0}, Lnicoid/network238/okio/Path;->resolve(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Path;

    move-result-object p0

    return-object p0
.end method
