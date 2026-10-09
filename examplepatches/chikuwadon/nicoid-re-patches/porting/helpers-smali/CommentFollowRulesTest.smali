.class public LCommentFollowRulesTest;
.super Ljava/lang/Object;
.source "CommentFollowRulesTest.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static expect([JJI)V
    .registers 7

    .line 3
    invoke-static {p0, p1, p2}, Le/e/a/CommentFollowRules;->nearest([JJ)I

    move-result p0

    if-ne p0, p3, :cond_7

    return-void

    :cond_7
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "at "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, ": "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " != "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 12

    .line 5
    const/4 p0, 0x0

    const-wide/16 v0, 0x64

    const/4 v2, -0x1

    invoke-static {p0, v0, v1, v2}, LCommentFollowRulesTest;->expect([JJI)V

    const/4 p0, 0x0

    new-array v3, p0, [J

    invoke-static {v3, v0, v1, v2}, LCommentFollowRulesTest;->expect([JJI)V

    .line 6
    const/4 v0, 0x2

    new-array v1, v0, [J

    fill-array-data v1, :array_84

    const-wide/16 v3, 0x3e7

    invoke-static {v1, v3, v4, v2}, LCommentFollowRulesTest;->expect([JJI)V

    .line 7
    const/4 v1, 0x3

    new-array v3, v1, [J

    const/4 v4, 0x1

    const-wide/16 v5, 0x3e8

    aput-wide v5, v3, v4

    const-wide/16 v7, 0x7d0

    aput-wide v7, v3, v0

    const-wide/16 v9, 0x258

    invoke-static {v3, v9, v10, p0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 8
    const/4 v3, 0x4

    new-array v9, v3, [J

    aput-wide v5, v9, v4

    aput-wide v5, v9, v0

    aput-wide v7, v9, v1

    invoke-static {v9, v5, v6, v0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 9
    new-array v3, v3, [J

    aput-wide v5, v3, v4

    aput-wide v5, v3, v0

    aput-wide v7, v3, v1

    const-wide/16 v9, 0x7cf

    invoke-static {v3, v9, v10, v0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 10
    new-array v3, v1, [J

    aput-wide v5, v3, v4

    aput-wide v7, v3, v0

    const-wide/16 v9, 0x9c4

    invoke-static {v3, v9, v10, v0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 11
    new-array v3, v1, [J

    aput-wide v7, v3, p0

    aput-wide v5, v3, v0

    const-wide/16 v9, 0x5dc

    invoke-static {v3, v9, v10, v0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 12
    new-array v3, v1, [J

    aput-wide v5, v3, v4

    aput-wide v7, v3, v0

    const-wide/16 v5, 0x1f4

    invoke-static {v3, v5, v6, p0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 13
    new-array v1, v1, [J

    const-wide/16 v5, -0x1

    aput-wide v5, v1, p0

    const-wide v5, 0x7fffffffffffffffL

    aput-wide v5, v1, v4

    const-wide/16 v7, -0x64

    invoke-static {v1, v7, v8, v0}, LCommentFollowRulesTest;->expect([JJI)V

    .line 14
    new-array v0, v4, [J

    aput-wide v5, v0, p0

    invoke-static {v0, v5, v6, v2}, LCommentFollowRulesTest;->expect([JJI)V

    .line 15
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v0, "Follow rules pass: no future selection, tied timestamps, unsorted data, seeks, and invalid times."

    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    return-void

    :array_84
    .array-data 8
        0x3e8
        0x7d0
    .end array-data
.end method
