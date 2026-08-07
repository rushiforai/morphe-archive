.class final Lcom/mm/mmfile/MMFileUtil$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mm/mmfile/MMFileUtil;->getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;IIZZ)[Ljava/io/File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$indexStart:I

.field final synthetic val$sortType:Lcom/mm/mmfile/SortType;

.field final synthetic val$timeEnd:I

.field final synthetic val$timeStart:I


# direct methods
.method public constructor <init>(IILcom/mm/mmfile/SortType;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeStart:I

    .line 2
    .line 3
    iput p2, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeEnd:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$sortType:Lcom/mm/mmfile/SortType;

    .line 6
    .line 7
    iput p4, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$indexStart:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public compare(Ljava/io/File;Ljava/io/File;)I
    .locals 9

    .line 1
    const-string v0, "MMFile"

    .line 2
    .line 3
    const-string v1, ".xlog"

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const/4 v2, 0x0

    .line 14
    :try_start_0
    iget v3, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeStart:I

    .line 15
    .line 16
    iget v4, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeEnd:I

    .line 17
    .line 18
    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    iget v5, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeStart:I

    .line 27
    .line 28
    iget v6, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$timeEnd:I

    .line 29
    .line 30
    invoke-virtual {p2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 35
    .line 36
    .line 37
    move-result-wide v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    iget-object v7, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$sortType:Lcom/mm/mmfile/SortType;

    .line 39
    .line 40
    sget-object v8, Lcom/mm/mmfile/SortType;->POSITIVE:Lcom/mm/mmfile/SortType;

    .line 41
    .line 42
    if-ne v7, v8, :cond_0

    .line 43
    .line 44
    sub-long/2addr v3, v5

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    sub-long v3, v5, v3

    .line 47
    .line 48
    :goto_0
    const-wide/16 v5, 0x0

    .line 49
    .line 50
    cmp-long v5, v3, v5

    .line 51
    .line 52
    if-nez v5, :cond_4

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iget v4, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$indexStart:I

    .line 63
    .line 64
    if-lt v4, v3, :cond_1

    .line 65
    .line 66
    move p1, v2

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    :goto_1
    iget v3, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$indexStart:I

    .line 77
    .line 78
    if-lt v3, v1, :cond_2

    .line 79
    .line 80
    move p2, v2

    .line 81
    goto :goto_2

    .line 82
    :cond_2
    invoke-virtual {p2, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    :goto_2
    iget-object p0, p0, Lcom/mm/mmfile/MMFileUtil$1;->val$sortType:Lcom/mm/mmfile/SortType;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 91
    .line 92
    if-ne p0, v8, :cond_3

    .line 93
    .line 94
    sub-int/2addr p1, p2

    .line 95
    return p1

    .line 96
    :cond_3
    sub-int/2addr p2, p1

    .line 97
    return p2

    .line 98
    :catch_0
    move-exception p0

    .line 99
    invoke-static {v0, p0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    return v2

    .line 103
    :cond_4
    long-to-int p0, v3

    .line 104
    return p0

    .line 105
    :catchall_0
    move-exception p0

    .line 106
    invoke-static {v0, p0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 110
    check-cast p1, Ljava/io/File;

    check-cast p2, Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/mm/mmfile/MMFileUtil$1;->compare(Ljava/io/File;Ljava/io/File;)I

    move-result p0

    return p0
.end method
