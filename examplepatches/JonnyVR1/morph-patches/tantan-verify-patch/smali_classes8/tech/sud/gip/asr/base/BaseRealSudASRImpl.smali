.class public abstract Ltech/sud/gip/asr/base/BaseRealSudASRImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/asr/base/Sudtry;


# static fields
.field private static final FILE_TAG:Ljava/lang/String; = "BaseRealSudASRImpl"


# instance fields
.field private final _TAG:Ljava/lang/String;

.field private _matchASRInfoEvent:Ll/srg0;

.field protected final _paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

.field protected hitKeywordSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected isIntentRunning:Z

.field protected mLanguage:Ljava/lang/String;

.field protected mgCommonGameASR:Ll/gog0;


# direct methods
.method public constructor <init>(Ltech/sud/gip/asr/base/model/InitASRParamModel;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "SudGIP "

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashSet;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 26
    .line 27
    iput-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 28
    .line 29
    return-void
.end method

.method private numberConver(Ljava/lang/String;Ll/gog0;)V
    .locals 8

    .line 1
    const-string v0, "[0-9]+"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v7, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    :try_start_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception v0

    .line 35
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-lez p1, :cond_1

    .line 44
    .line 45
    iget-object v5, p2, Ll/gog0;->d:Ljava/lang/String;

    .line 46
    .line 47
    const/4 v4, 0x0

    .line 48
    const/4 v6, 0x0

    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v3, 0x0

    .line 51
    move-object v1, p0

    .line 52
    invoke-virtual/range {v1 .. v7}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->notifyAppCommonSelfTextHit(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private numberMatch(Ljava/lang/String;Ll/gog0;)V
    .locals 13

    .line 1
    iget-object v0, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_4

    .line 12
    .line 13
    :cond_0
    iget-object v1, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x0

    .line 20
    move v0, v3

    .line 21
    :goto_0
    if-ge v0, v2, :cond_2

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    add-int/lit8 v5, v0, 0x1

    .line 28
    .line 29
    move-object v8, v4

    .line 30
    check-cast v8, Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v8, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 41
    .line 42
    invoke-virtual {v0, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    new-instance v11, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    :try_start_0
    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    new-instance v4, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    :goto_1
    move-object v12, v4

    .line 70
    goto :goto_2

    .line 71
    :catch_0
    move-exception v0

    .line 72
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    const/4 v4, 0x0

    .line 76
    goto :goto_1

    .line 77
    :goto_2
    iget-object v10, p2, Ll/gog0;->d:Ljava/lang/String;

    .line 78
    .line 79
    const/4 v7, 0x1

    .line 80
    const/4 v9, 0x0

    .line 81
    move-object v6, p0

    .line 82
    invoke-virtual/range {v6 .. v12}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->notifyAppCommonSelfTextHit(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 83
    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_1
    move-object v6, p0

    .line 87
    :goto_3
    move v0, v5

    .line 88
    move-object p0, v6

    .line 89
    goto :goto_0

    .line 90
    :cond_2
    move-object v6, p0

    .line 91
    iget-object p0, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    :cond_3
    if-ge v3, p1, :cond_4

    .line 98
    .line 99
    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    add-int/lit8 v3, v3, 0x1

    .line 104
    .line 105
    check-cast p2, Ljava/lang/String;

    .line 106
    .line 107
    iget-object v0, v6, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 108
    .line 109
    invoke-virtual {v0, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-nez p2, :cond_3

    .line 114
    .line 115
    goto :goto_4

    .line 116
    :cond_4
    const/4 p0, 0x1

    .line 117
    invoke-virtual {v6, p0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 118
    .line 119
    .line 120
    :cond_5
    :goto_4
    return-void
.end method

.method private textMatch(Ljava/lang/String;Ll/gog0;)V
    .locals 12

    .line 1
    iget-object v0, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const/4 v2, 0x0

    .line 29
    move v3, v2

    .line 30
    :goto_0
    if-ge v3, v1, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v4

    .line 36
    add-int/lit8 v3, v3, 0x1

    .line 37
    .line 38
    move-object v7, v4

    .line 39
    check-cast v7, Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v7, :cond_1

    .line 42
    .line 43
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-virtual {v7, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-virtual {p1, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    if-eqz v4, :cond_1

    .line 56
    .line 57
    iget-object v4, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 58
    .line 59
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    new-instance v10, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object v9, p2, Ll/gog0;->d:Ljava/lang/String;

    .line 71
    .line 72
    const/4 v8, 0x0

    .line 73
    const/4 v11, 0x0

    .line 74
    const/4 v6, 0x1

    .line 75
    move-object v5, p0

    .line 76
    invoke-virtual/range {v5 .. v11}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->notifyAppCommonSelfTextHit(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    move-object v5, p0

    .line 81
    :goto_1
    move-object p0, v5

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    move-object v5, p0

    .line 84
    iget-object p0, p2, Ll/gog0;->b:Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    :cond_3
    if-ge v2, p1, :cond_4

    .line 91
    .line 92
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    add-int/lit8 v2, v2, 0x1

    .line 97
    .line 98
    check-cast p2, Ljava/lang/String;

    .line 99
    .line 100
    iget-object v0, v5, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 101
    .line 102
    invoke-virtual {v0, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p2

    .line 106
    if-nez p2, :cond_3

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_4
    const/4 p0, 0x1

    .line 110
    invoke-virtual {v5, p0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 111
    .line 112
    .line 113
    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method public displayException(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "displayException:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "BaseRealSudASRImpl"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ljava/lang/System;->lineSeparator()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {v1, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public handleGameASR(Ljava/lang/String;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleGameASR:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v2, "BaseRealSudASRImpl"

    .line 16
    .line 17
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 21
    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    const/4 p1, 0x0

    .line 45
    iput-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->mgCommonGameASR:Ll/gog0;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    invoke-static {p1}, Ll/gog0;->a(Ljava/lang/String;)Ll/gog0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->mgCommonGameASR:Ll/gog0;

    .line 56
    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0, v1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-boolean v0, p1, Ll/gog0;->a:Z

    .line 64
    .line 65
    const/4 v3, 0x1

    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    iget-object v0, p1, Ll/gog0;->d:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isSupportWordType(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    const-string v1, "handleGameASR nonsupport:"

    .line 75
    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 79
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v3, p1, Ll/gog0;->d:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    new-instance p0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p1, Ll/gog0;->d:Ljava/lang/String;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v2, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_2
    iget-object v0, p1, Ll/gog0;->d:Ljava/lang/String;

    .line 116
    .line 117
    const-string v4, "text"

    .line 118
    .line 119
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-eqz v0, :cond_3

    .line 124
    .line 125
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 126
    .line 127
    iget-object v0, v0, Ltech/sud/gip/asr/base/model/InitASRParamModel;->supportTextLanguageList:Lorg/json/JSONArray;

    .line 128
    .line 129
    iget-object v4, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v0, v4}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isValidLanguage(Lorg/json/JSONArray;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_3

    .line 136
    .line 137
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 138
    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object v3, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    new-instance p0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {v2, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_3
    iget-object v0, p1, Ll/gog0;->d:Ljava/lang/String;

    .line 175
    .line 176
    const-string v4, "number"

    .line 177
    .line 178
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 185
    .line 186
    iget-object v0, v0, Ltech/sud/gip/asr/base/model/InitASRParamModel;->supportNumberLanguageList:Lorg/json/JSONArray;

    .line 187
    .line 188
    iget-object v4, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {p0, v0, v4}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isValidLanguage(Lorg/json/JSONArray;Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_4

    .line 195
    .line 196
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 197
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object v3, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    new-instance p0, Ljava/lang/StringBuilder;

    .line 216
    .line 217
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object p1, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {v2, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :cond_4
    iput-boolean v3, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isIntentRunning:Z

    .line 234
    .line 235
    iget-object p1, p1, Ll/gog0;->c:Ljava/lang/String;

    .line 236
    .line 237
    iput-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->mLanguage:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {p0, p1}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->startASR(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_5
    iput-boolean v1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isIntentRunning:Z

    .line 244
    .line 245
    invoke-virtual {p0, v3}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->stopASR(Z)V

    .line 246
    .line 247
    .line 248
    return-void
.end method

.method public isSupportWordType(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string p0, "text"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const-string p0, "number"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    return v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public isValidLanguage(Lorg/json/JSONArray;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge v0, v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :catch_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return p0
.end method

.method public notifyAppCommonSelfTextHit(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/kkg0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/kkg0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-boolean p1, v0, Ll/kkg0;->a:Z

    .line 7
    .line 8
    iput-object p2, v0, Ll/kkg0;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p3, v0, Ll/kkg0;->c:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p4, v0, Ll/kkg0;->d:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p5, v0, Ll/kkg0;->e:Ljava/util/List;

    .line 15
    .line 16
    iput-object p6, v0, Ll/kkg0;->f:Ljava/util/List;

    .line 17
    .line 18
    iget-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_paramModel:Ltech/sud/gip/asr/base/model/InitASRParamModel;

    .line 19
    .line 20
    iget-object p1, p1, Ltech/sud/gip/asr/base/model/InitASRParamModel;->iSudFSTAPP:Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ltech/sud/gip/core/ISudFSTAPP;

    .line 27
    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/kkg0;->a()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string p3, "app_common_self_text_hit"

    .line 35
    .line 36
    const/4 p4, 0x0

    .line 37
    invoke-interface {p1, p3, p2, p4}, Ltech/sud/gip/core/ISudFSTAPP;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_TAG:Ljava/lang/String;

    .line 41
    .line 42
    new-instance p1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p2, "hit:"

    .line 45
    .line 46
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ll/kkg0;->a()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {p0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance p0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ll/kkg0;->a()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const-string p1, "BaseRealSudASRImpl"

    .line 80
    .line 81
    invoke-static {p1, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public onRecognizingResult(Ljava/lang/String;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_matchASRInfoEvent:Ll/srg0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast v0, Ll/rwg0;

    .line 6
    .line 7
    iget-object v1, v0, Ll/rwg0;->d:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 17
    .line 18
    iput-object v1, v0, Ll/rwg0;->d:Ljava/lang/Boolean;

    .line 19
    .line 20
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 21
    .line 22
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v2, "type"

    .line 26
    .line 27
    iget v3, v0, Ll/rwg0;->a:I

    .line 28
    .line 29
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 30
    .line 31
    .line 32
    const-string v2, "date"

    .line 33
    .line 34
    iget-object v3, v0, Ll/rwg0;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    iget-object v2, v0, Ll/rwg0;->b:Ll/ukg0;

    .line 40
    .line 41
    const-string v3, "matchASR"

    .line 42
    .line 43
    iget-object v2, v2, Ll/ukg0;->j:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    iget-object v1, v0, Ll/rwg0;->b:Ll/ukg0;

    .line 49
    .line 50
    invoke-static {v1}, Ll/fug0;->b(Ll/ukg0;)V

    .line 51
    .line 52
    .line 53
    const-string v1, "TechSudMGPGlobal.sp"

    .line 54
    .line 55
    invoke-static {v1}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-string v2, "key_sud_mgp_match_asr_last_date"

    .line 60
    .line 61
    iget-object v0, v0, Ll/rwg0;->c:Ljava/lang/String;

    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    invoke-virtual {v1, v2, v0, v3}, Ll/kjg0;->c(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    move-exception v0

    .line 69
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 70
    .line 71
    .line 72
    :cond_1
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    iget-object v0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->mgCommonGameASR:Ll/gog0;

    .line 80
    .line 81
    if-eqz v0, :cond_7

    .line 82
    .line 83
    iget-boolean v1, v0, Ll/gog0;->a:Z

    .line 84
    .line 85
    if-nez v1, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object v1, v0, Ll/gog0;->d:Ljava/lang/String;

    .line 89
    .line 90
    const-string v2, "text"

    .line 91
    .line 92
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    iget-boolean v1, v0, Ll/gog0;->e:Z

    .line 99
    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    invoke-direct {p0, p1, v0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->textMatch(Ljava/lang/String;Ll/gog0;)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-boolean v1, v0, Ll/gog0;->f:Z

    .line 106
    .line 107
    if-eqz v1, :cond_7

    .line 108
    .line 109
    iget-object v6, v0, Ll/gog0;->d:Ljava/lang/String;

    .line 110
    .line 111
    const/4 v7, 0x0

    .line 112
    const/4 v8, 0x0

    .line 113
    const/4 v3, 0x0

    .line 114
    const/4 v4, 0x0

    .line 115
    move-object v2, p0

    .line 116
    move-object v5, p1

    .line 117
    invoke-virtual/range {v2 .. v8}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->notifyAppCommonSelfTextHit(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_5
    move-object v2, p0

    .line 122
    move-object v5, p1

    .line 123
    iget-object p0, v0, Ll/gog0;->d:Ljava/lang/String;

    .line 124
    .line 125
    const-string p1, "number"

    .line 126
    .line 127
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-eqz p0, :cond_7

    .line 132
    .line 133
    iget-boolean p0, v0, Ll/gog0;->e:Z

    .line 134
    .line 135
    if-eqz p0, :cond_6

    .line 136
    .line 137
    invoke-direct {v2, v5, v0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->numberMatch(Ljava/lang/String;Ll/gog0;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    iget-boolean p0, v0, Ll/gog0;->f:Z

    .line 141
    .line 142
    if-eqz p0, :cond_7

    .line 143
    .line 144
    invoke-direct {v2, v5, v0}, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->numberConver(Ljava/lang/String;Ll/gog0;)V

    .line 145
    .line 146
    .line 147
    :cond_7
    :goto_1
    return-void
.end method

.method public abstract synthetic pushAudio(Ljava/nio/ByteBuffer;I)V
.end method

.method public setMatchASREvent(Ll/srg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->_matchASRInfoEvent:Ll/srg0;

    .line 2
    .line 3
    return-void
.end method

.method public startASR(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopASR(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-boolean p1, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->isIntentRunning:Z

    .line 5
    .line 6
    :cond_0
    iget-object p0, p0, Ltech/sud/gip/asr/base/BaseRealSudASRImpl;->hitKeywordSet:Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
