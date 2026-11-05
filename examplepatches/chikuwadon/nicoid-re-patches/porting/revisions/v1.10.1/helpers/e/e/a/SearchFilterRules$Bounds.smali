.class final Le/e/a/SearchFilterRules$Bounds;
.super Ljava/lang/Object;
.source "SearchFilterRules.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SearchFilterRules;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Bounds"
.end annotation


# instance fields
.field final from:J

.field final high:I

.field final low:I

.field final to:J

.field final valid:Z


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 12

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const/4 v0, -0x1

    const-wide/high16 v1, -0x8000000000000000L

    const-wide v3, 0x7fffffffffffffffL

    :try_start_b
    new-instance v5, Le/e/a/SearchFilterRules$Query;

    invoke-direct {v5, p1}, Le/e/a/SearchFilterRules$Query;-><init>(Ljava/lang/String;)V

    const-string p1, "minDuration"

    invoke-virtual {v5, p1}, Le/e/a/SearchFilterRules$Query;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v6, "maxDuration"

    invoke-virtual {v5, v6}, Le/e/a/SearchFilterRules$Query;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "minRegisteredAt"

    invoke-virtual {v5, v7}, Le/e/a/SearchFilterRules$Query;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "maxRegisteredAt"

    invoke-virtual {v5, v8}, Le/e/a/SearchFilterRules$Query;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz p1, :cond_37

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_2e
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_2e} :catch_6c

    if-ltz p1, :cond_31

    goto :goto_38

    :cond_31
    :try_start_31
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    :cond_37
    const/4 p1, -0x1

    :goto_38
    if-eqz v6, :cond_4a

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_3e
    .catch Ljava/lang/RuntimeException; {:try_start_31 .. :try_end_3e} :catch_47

    if-ltz v0, :cond_41

    goto :goto_4a

    :cond_41
    :try_start_41
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    :catch_47
    move-exception v5

    move v0, p1

    goto :goto_6d

    :cond_4a
    :goto_4a
    if-eqz v7, :cond_56

    # invokes: Le/e/a/SearchFilterRules;->date(Ljava/lang/String;)J
    invoke-static {v7}, Le/e/a/SearchFilterRules;->access$0(Ljava/lang/String;)J

    move-result-wide v1

    goto :goto_56

    :catch_51
    move-exception v5

    move v9, v0

    move v0, p1

    move p1, v9

    goto :goto_6e

    :cond_56
    :goto_56
    if-eqz v5, :cond_5c

    # invokes: Le/e/a/SearchFilterRules;->date(Ljava/lang/String;)J
    invoke-static {v5}, Le/e/a/SearchFilterRules;->access$0(Ljava/lang/String;)J

    move-result-wide v3

    :cond_5c
    if-ltz v0, :cond_60

    if-gt p1, v0, :cond_66

    :cond_60
    cmp-long v5, v1, v3

    if-gtz v5, :cond_66

    const/4 v5, 0x1

    goto :goto_72

    :cond_66
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5
    :try_end_6c
    .catch Ljava/lang/RuntimeException; {:try_start_41 .. :try_end_6c} :catch_51

    :catch_6c
    move-exception p1

    :goto_6d
    const/4 p1, -0x1

    :goto_6e
    const/4 v5, 0x0

    move v9, v0

    move v0, p1

    move p1, v9

    .line 19
    :goto_72
    iput p1, p0, Le/e/a/SearchFilterRules$Bounds;->low:I

    iput v0, p0, Le/e/a/SearchFilterRules$Bounds;->high:I

    iput-wide v1, p0, Le/e/a/SearchFilterRules$Bounds;->from:J

    iput-wide v3, p0, Le/e/a/SearchFilterRules$Bounds;->to:J

    iput-boolean v5, p0, Le/e/a/SearchFilterRules$Bounds;->valid:Z

    .line 20
    return-void
.end method
