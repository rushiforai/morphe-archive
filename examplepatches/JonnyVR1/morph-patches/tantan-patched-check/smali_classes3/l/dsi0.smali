.class public Ll/dsi0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "<(\\w+)>(.*?)</\\1>"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/dsi0;->a:Ljava/util/regex/Pattern;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Landroid/app/Activity;Lcom/p1/mobile/putong/data/OMSResourceContent;Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;
    .locals 1

    .line 1
    new-instance v0, Ll/dsi0$a;

    .line 2
    .line 3
    invoke-direct {v0, p3, p0, p2, p1}, Ll/dsi0$a;-><init>(Ljava/lang/String;Landroid/app/Activity;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSResourceContent;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLanguageContent;->style:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    new-instance p0, Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSResourceContent;-><init>()V

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSResourceContent;->clone()Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iput-object p2, p0, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0
.end method

.method public static c(Ljava/lang/String;I)Ljava/util/regex/Matcher;
    .locals 1

    .line 1
    sget-object v0, Ll/dsi0;->a:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/regex/Matcher;->find(I)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/data/OMSDialogInfo;Lcom/p1/mobile/putong/data/OMSDialog;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/OMSDialogInfo;",
            "Lcom/p1/mobile/putong/data/OMSDialog;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSResourceContent;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_5

    .line 7
    .line 8
    if-eqz p1, :cond_5

    .line 9
    .line 10
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSLanguageContent;->value:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_0
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSLanguageContent;->value:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/dsi0;->e(Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_1

    .line 37
    .line 38
    :cond_1
    move-object v1, p0

    .line 39
    :goto_0
    const/4 v2, 0x0

    .line 40
    invoke-static {v1, v2}, Ll/dsi0;->c(Ljava/lang/String;I)Ljava/util/regex/Matcher;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    const-string v4, "base"

    .line 45
    .line 46
    if-nez v3, :cond_2

    .line 47
    .line 48
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-nez p0, :cond_5

    .line 53
    .line 54
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 55
    .line 56
    invoke-static {p0, v4, v1}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    return-object v0

    .line 64
    :cond_2
    const/4 v5, 0x1

    .line 65
    invoke-virtual {v3, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    const/4 v6, 0x2

    .line 70
    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->start()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->end()I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-nez v7, :cond_3

    .line 83
    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 85
    .line 86
    invoke-static {v2, v5, v6}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    goto :goto_0

    .line 98
    :cond_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result v8

    .line 102
    iget-object v9, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 103
    .line 104
    if-ne v3, v8, :cond_4

    .line 105
    .line 106
    invoke-virtual {v1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-static {v9, v4, v1}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    iget-object v1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 118
    .line 119
    invoke-static {v1, v5, v6}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    const-string v1, ""

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_4
    invoke-virtual {v1, v2, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v9, v4, v2}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->languageContent:Lcom/p1/mobile/putong/data/OMSLanguageContent;

    .line 141
    .line 142
    invoke-static {v2, v5, v6}, Ll/dsi0;->b(Lcom/p1/mobile/putong/data/OMSLanguageContent;Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    goto :goto_0

    .line 154
    :cond_5
    :goto_1
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/data/OMSDialogInfo;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/api/api/Network;->language()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->content:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/util/Map;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    const-string v1, "ru"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    iget-object v1, v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->content:Ljava/util/Map;

    .line 28
    .line 29
    const-string v2, "en"

    .line 30
    .line 31
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/util/Map;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v1, v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->content:Ljava/util/Map;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->defaultLang:Ljava/lang/String;

    .line 41
    .line 42
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/util/Map;

    .line 47
    .line 48
    :cond_1
    :goto_0
    if-nez v1, :cond_2

    .line 49
    .line 50
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v2, "localLang:"

    .line 53
    .line 54
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v0, " defaultLang:"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->defaultLang:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v0, " contentSize:"

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSDialogInfo;->languages:Lcom/p1/mobile/putong/data/OMSLanguageInfo;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSLanguageInfo;->content:Ljava/util/Map;

    .line 80
    .line 81
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    new-instance v0, Ljava/lang/RuntimeException;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/16 p0, 0x64

    .line 98
    .line 99
    invoke-static {v0, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 100
    .line 101
    .line 102
    return-object p1

    .line 103
    :cond_2
    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    check-cast p0, Ljava/lang/String;

    .line 108
    .line 109
    return-object p0
.end method

.method public static f(Landroid/app/Activity;Ljava/util/List;DLl/pf60;)Ll/pf60;
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSResourceContent;",
            ">;D",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/pf60<",
            "Landroid/text/SpannableStringBuilder;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-eqz v5, :cond_f

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    check-cast v5, Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 25
    .line 26
    iget-object v6, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->value:Ljava/lang/String;

    .line 27
    .line 28
    move-object/from16 v7, p4

    .line 29
    .line 30
    invoke-static {v6, v7}, Ll/dsi0;->h(Ljava/lang/String;Ll/pf60;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    iget-object v8, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    const-string v14, "bold_italic"

    .line 41
    .line 42
    const-wide/high16 v16, 0x3ff0000000000000L    # 1.0

    .line 43
    .line 44
    const-string v9, "italic"

    .line 45
    .line 46
    const-string v10, "bold"

    .line 47
    .line 48
    const-wide/16 v18, 0x0

    .line 49
    .line 50
    const/4 v11, 0x1

    .line 51
    const/16 v12, 0x21

    .line 52
    .line 53
    if-nez v8, :cond_5

    .line 54
    .line 55
    new-instance v8, Landroid/text/SpannableString;

    .line 56
    .line 57
    new-instance v13, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v15, " "

    .line 66
    .line 67
    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v13

    .line 74
    invoke-direct {v8, v13}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 75
    .line 76
    .line 77
    iget-object v13, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 78
    .line 79
    invoke-static {v13, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v10

    .line 83
    if-eqz v10, :cond_0

    .line 84
    .line 85
    move/from16 v24, v11

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_0
    iget-object v10, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 89
    .line 90
    invoke-static {v10, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    if-eqz v9, :cond_1

    .line 95
    .line 96
    const/16 v24, 0x2

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_1
    iget-object v9, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 100
    .line 101
    invoke-static {v9, v14}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v9

    .line 105
    if-eqz v9, :cond_2

    .line 106
    .line 107
    const/16 v24, 0x3

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_2
    move/from16 v24, v3

    .line 111
    .line 112
    :goto_1
    iget v9, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->size:I

    .line 113
    .line 114
    if-lez v9, :cond_3

    .line 115
    .line 116
    cmpl-double v10, p2, v18

    .line 117
    .line 118
    if-lez v10, :cond_3

    .line 119
    .line 120
    cmpg-double v10, p2, v16

    .line 121
    .line 122
    if-gez v10, :cond_3

    .line 123
    .line 124
    int-to-double v9, v9

    .line 125
    mul-double v9, v9, p2

    .line 126
    .line 127
    double-to-int v9, v9

    .line 128
    goto :goto_2

    .line 129
    :cond_3
    move v9, v3

    .line 130
    :goto_2
    iget-object v10, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 133
    .line 134
    .line 135
    move-result v10

    .line 136
    if-nez v10, :cond_4

    .line 137
    .line 138
    iget-object v10, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v10

    .line 144
    :goto_3
    move/from16 v23, v10

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_4
    const/4 v10, -0x1

    .line 148
    goto :goto_3

    .line 149
    :goto_4
    new-instance v20, Ll/smd0;

    .line 150
    .line 151
    const/high16 v10, 0x40400000    # 3.0f

    .line 152
    .line 153
    invoke-static {v0, v10}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 154
    .line 155
    .line 156
    move-result v21

    .line 157
    iget-object v10, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->bgColor:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v22

    .line 163
    int-to-float v9, v9

    .line 164
    move/from16 v25, v9

    .line 165
    .line 166
    invoke-direct/range {v20 .. v25}, Ll/smd0;-><init>(IIIIF)V

    .line 167
    .line 168
    .line 169
    move-object/from16 v9, v20

    .line 170
    .line 171
    invoke-virtual {v8}, Landroid/text/SpannableString;->length()I

    .line 172
    .line 173
    .line 174
    move-result v10

    .line 175
    sub-int/2addr v10, v11

    .line 176
    const/16 v13, 0x12

    .line 177
    .line 178
    invoke-virtual {v8, v9, v3, v10, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 179
    .line 180
    .line 181
    move v15, v11

    .line 182
    move v13, v12

    .line 183
    goto/16 :goto_6

    .line 184
    .line 185
    :cond_5
    new-instance v8, Landroid/text/SpannableString;

    .line 186
    .line 187
    invoke-direct {v8, v6}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 188
    .line 189
    .line 190
    iget-object v13, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 193
    .line 194
    .line 195
    move-result v13

    .line 196
    if-nez v13, :cond_6

    .line 197
    .line 198
    new-instance v13, Landroid/text/style/ForegroundColorSpan;

    .line 199
    .line 200
    iget-object v15, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->color:Ljava/lang/String;

    .line 201
    .line 202
    invoke-static {v15}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 203
    .line 204
    .line 205
    move-result v15

    .line 206
    invoke-direct {v13, v15}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 210
    .line 211
    .line 212
    move-result v15

    .line 213
    invoke-virtual {v8, v13, v3, v15, v12}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 214
    .line 215
    .line 216
    :cond_6
    iget v13, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->size:I

    .line 217
    .line 218
    if-lez v13, :cond_8

    .line 219
    .line 220
    int-to-float v13, v13

    .line 221
    invoke-static {v0, v13}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 222
    .line 223
    .line 224
    move-result v13

    .line 225
    cmpl-double v15, p2, v18

    .line 226
    .line 227
    if-lez v15, :cond_7

    .line 228
    .line 229
    cmpg-double v15, p2, v16

    .line 230
    .line 231
    if-gez v15, :cond_7

    .line 232
    .line 233
    int-to-double v11, v13

    .line 234
    mul-double v11, v11, p2

    .line 235
    .line 236
    double-to-int v13, v11

    .line 237
    :cond_7
    new-instance v11, Landroid/text/style/AbsoluteSizeSpan;

    .line 238
    .line 239
    invoke-direct {v11, v13, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 243
    .line 244
    .line 245
    move-result v12

    .line 246
    const/16 v13, 0x21

    .line 247
    .line 248
    invoke-virtual {v8, v11, v3, v12, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 249
    .line 250
    .line 251
    goto :goto_5

    .line 252
    :cond_8
    move v13, v12

    .line 253
    :goto_5
    iget-boolean v11, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->strikethrough:Z

    .line 254
    .line 255
    if-eqz v11, :cond_9

    .line 256
    .line 257
    new-instance v11, Landroid/text/style/StrikethroughSpan;

    .line 258
    .line 259
    invoke-direct {v11}, Landroid/text/style/StrikethroughSpan;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 263
    .line 264
    .line 265
    move-result v12

    .line 266
    invoke-virtual {v8, v11, v3, v12, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 267
    .line 268
    .line 269
    :cond_9
    iget-boolean v11, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->underline:Z

    .line 270
    .line 271
    if-eqz v11, :cond_a

    .line 272
    .line 273
    new-instance v11, Landroid/text/style/UnderlineSpan;

    .line 274
    .line 275
    invoke-direct {v11}, Landroid/text/style/UnderlineSpan;-><init>()V

    .line 276
    .line 277
    .line 278
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 279
    .line 280
    .line 281
    move-result v12

    .line 282
    invoke-virtual {v8, v11, v3, v12, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 283
    .line 284
    .line 285
    :cond_a
    iget-object v11, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 286
    .line 287
    invoke-static {v11, v10}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v10

    .line 291
    if-eqz v10, :cond_b

    .line 292
    .line 293
    new-instance v9, Landroid/text/style/StyleSpan;

    .line 294
    .line 295
    const/4 v15, 0x1

    .line 296
    invoke-direct {v9, v15}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 300
    .line 301
    .line 302
    move-result v10

    .line 303
    invoke-virtual {v8, v9, v3, v10, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 304
    .line 305
    .line 306
    goto :goto_6

    .line 307
    :cond_b
    const/4 v15, 0x1

    .line 308
    iget-object v10, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 309
    .line 310
    invoke-static {v10, v9}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 311
    .line 312
    .line 313
    move-result v9

    .line 314
    if-eqz v9, :cond_c

    .line 315
    .line 316
    new-instance v9, Landroid/text/style/StyleSpan;

    .line 317
    .line 318
    const/4 v10, 0x2

    .line 319
    invoke-direct {v9, v10}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 323
    .line 324
    .line 325
    move-result v10

    .line 326
    invoke-virtual {v8, v9, v3, v10, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 327
    .line 328
    .line 329
    goto :goto_6

    .line 330
    :cond_c
    iget-object v9, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->font:Lcom/p1/mobile/putong/data/OMSFontStyle;

    .line 331
    .line 332
    invoke-static {v9, v14}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 333
    .line 334
    .line 335
    move-result v9

    .line 336
    if-eqz v9, :cond_d

    .line 337
    .line 338
    new-instance v9, Landroid/text/style/StyleSpan;

    .line 339
    .line 340
    const/4 v10, 0x3

    .line 341
    invoke-direct {v9, v10}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 345
    .line 346
    .line 347
    move-result v10

    .line 348
    invoke-virtual {v8, v9, v3, v10, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 349
    .line 350
    .line 351
    :cond_d
    :goto_6
    iget-object v9, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 352
    .line 353
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 354
    .line 355
    .line 356
    move-result v9

    .line 357
    if-nez v9, :cond_e

    .line 358
    .line 359
    iget-object v4, v5, Lcom/p1/mobile/putong/data/OMSResourceContent;->url:Ljava/lang/String;

    .line 360
    .line 361
    invoke-static {v4}, Ll/dsi0;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object v4

    .line 365
    invoke-static {v0, v5, v6, v4}, Ll/dsi0;->a(Landroid/app/Activity;Lcom/p1/mobile/putong/data/OMSResourceContent;Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 370
    .line 371
    .line 372
    move-result v5

    .line 373
    invoke-virtual {v8, v4, v3, v5, v13}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 374
    .line 375
    .line 376
    move v4, v15

    .line 377
    :cond_e
    invoke-virtual {v1, v8}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 378
    .line 379
    .line 380
    goto/16 :goto_0

    .line 381
    .line 382
    :cond_f
    new-instance v0, Ll/pf60;

    .line 383
    .line 384
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    invoke-direct {v0, v1, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 389
    .line 390
    .line 391
    return-object v0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/dsi0;->h(Ljava/lang/String;Ll/pf60;)Ljava/lang/String;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static h(Ljava/lang/String;Ll/pf60;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-object v1

    .line 10
    :cond_0
    const-string v0, "(\\{\\{.*?\\}\\})"

    .line 11
    .line 12
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    const-string v3, "{{"

    .line 31
    .line 32
    invoke-virtual {v2, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    const-string v4, "}}"

    .line 37
    .line 38
    invoke-virtual {v3, v4, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4}, Ll/pk50;->o()Ll/dxv;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-virtual {v4, v3}, Ll/dxv;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    if-eqz v5, :cond_1

    .line 59
    .line 60
    iget-object v5, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast v5, Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-eqz v3, :cond_1

    .line 69
    .line 70
    iget-object v3, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 71
    .line 72
    move-object v4, v3

    .line 73
    check-cast v4, Ljava/lang/String;

    .line 74
    .line 75
    :cond_1
    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    goto :goto_0

    .line 80
    :cond_2
    return-object p0
.end method
