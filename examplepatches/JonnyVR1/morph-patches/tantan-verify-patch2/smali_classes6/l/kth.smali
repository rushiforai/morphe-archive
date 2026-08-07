.class public Ll/kth;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = ""

.field public static b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/kth;->b:Ljava/util/List;

    .line 7
    .line 8
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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 4
    .line 5
    const-string v0, "immediatelyShowFrequency"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic b(ILcom/p1/mobile/putong/feed/data/PostBasePopWindow;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->readCount:I

    .line 4
    .line 5
    if-gt v0, p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->type:Lcom/p1/mobile/putong/feed/data/OccasionType;

    .line 8
    .line 9
    const-string p1, "readFrequency"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static c(Ll/byd0;Ll/vxd0;III)Z
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Long;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    const-wide/16 v2, 0x0

    .line 22
    .line 23
    cmp-long p0, v0, v2

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    return v2

    .line 29
    :cond_0
    const p0, 0x5265c00

    .line 30
    .line 31
    .line 32
    if-lez p2, :cond_1

    .line 33
    .line 34
    invoke-static {}, Ll/pzi0;->o()J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    sub-long/2addr v3, v0

    .line 39
    mul-int/2addr p2, p0

    .line 40
    int-to-long v5, p2

    .line 41
    cmp-long p2, v3, v5

    .line 42
    .line 43
    if-lez p2, :cond_1

    .line 44
    .line 45
    return v2

    .line 46
    :cond_1
    if-lez p3, :cond_2

    .line 47
    .line 48
    invoke-static {}, Ll/pzi0;->o()J

    .line 49
    .line 50
    .line 51
    move-result-wide v3

    .line 52
    sub-long/2addr v3, v0

    .line 53
    mul-int/2addr p0, p3

    .line 54
    int-to-long v0, p0

    .line 55
    cmp-long p0, v3, v0

    .line 56
    .line 57
    if-lez p0, :cond_2

    .line 58
    .line 59
    if-ge p1, p4, :cond_2

    .line 60
    .line 61
    return v2

    .line 62
    :cond_2
    if-nez p3, :cond_3

    .line 63
    .line 64
    if-ge p1, p4, :cond_3

    .line 65
    .line 66
    return v2

    .line 67
    :cond_3
    const/4 p0, 0x0

    .line 68
    return p0
.end method

.method public static d(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jka;->x7(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    new-instance v0, Ll/ith;

    .line 16
    .line 17
    invoke-direct {v0}, Ll/ith;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    move v2, v0

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    if-ge v2, v3, :cond_4

    .line 38
    .line 39
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    check-cast v3, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 44
    .line 45
    new-instance v4, Ll/byd0;

    .line 46
    .line 47
    new-instance v5, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v6, "immediately_show_dialog_time_"

    .line 50
    .line 51
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v6, v3, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 55
    .line 56
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v6

    .line 69
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    const-wide/16 v6, 0x0

    .line 77
    .line 78
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    invoke-direct {v4, v5, v6}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 83
    .line 84
    .line 85
    new-instance v5, Ll/vxd0;

    .line 86
    .line 87
    new-instance v6, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v7, "immediately_show_dialog_count_"

    .line 90
    .line 91
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v7, v3, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 95
    .line 96
    iget-object v7, v7, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-interface {v7}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v6

    .line 116
    invoke-direct {v5, v6, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 117
    .line 118
    .line 119
    iget-object v6, v3, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 120
    .line 121
    iget v7, v6, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 122
    .line 123
    iget v8, v6, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 124
    .line 125
    iget v6, v6, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 126
    .line 127
    invoke-static {v4, v5, v7, v8, v6}, Ll/kth;->c(Ll/byd0;Ll/vxd0;III)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    if-nez v4, :cond_2

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    if-eqz v4, :cond_3

    .line 139
    .line 140
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 141
    .line 142
    iget v4, v4, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 143
    .line 144
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 145
    .line 146
    iget v5, v5, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 147
    .line 148
    if-lt v4, v5, :cond_3

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_3
    move-object v1, v3

    .line 152
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_4
    return-object v1
.end method

.method public static e(Ljava/lang/String;I)Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/jka;->x7(Ljava/lang/String;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    new-instance v0, Ll/jth;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Ll/jth;-><init>(I)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    move v0, p1

    .line 33
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-ge v0, v2, :cond_4

    .line 38
    .line 39
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;

    .line 44
    .line 45
    new-instance v3, Ll/byd0;

    .line 46
    .line 47
    new-instance v4, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v5, "read_count_show_dialog_time_"

    .line 50
    .line 51
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 55
    .line 56
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    const-wide/16 v5, 0x0

    .line 77
    .line 78
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-direct {v3, v4, v5}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 83
    .line 84
    .line 85
    new-instance v4, Ll/vxd0;

    .line 86
    .line 87
    new-instance v5, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v6, "read_count_show_dialog_count_"

    .line 90
    .line 91
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    iget-object v6, v2, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 95
    .line 96
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->name:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    invoke-interface {v6}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-direct {v4, v5, p1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 117
    .line 118
    .line 119
    iget-object v5, v2, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->occasion:Lcom/p1/mobile/putong/feed/data/OccasionComponent;

    .line 120
    .line 121
    iget v6, v5, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->days:I

    .line 122
    .line 123
    iget v7, v5, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->intervalDays:I

    .line 124
    .line 125
    iget v5, v5, Lcom/p1/mobile/putong/feed/data/OccasionComponent;->showTimes:I

    .line 126
    .line 127
    invoke-static {v3, v4, v6, v7, v5}, Ll/kth;->c(Ll/byd0;Ll/vxd0;III)Z

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    if-nez v3, :cond_2

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_3

    .line 139
    .line 140
    iget-object v3, v1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 141
    .line 142
    iget v3, v3, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 143
    .line 144
    iget-object v4, v2, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->basic:Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;

    .line 145
    .line 146
    iget v4, v4, Lcom/p1/mobile/putong/feed/data/BasicInfoComponent;->priority:I

    .line 147
    .line 148
    if-lt v3, v4, :cond_3

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_3
    move-object v1, v2

    .line 152
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_4
    return-object v1
.end method

.method public static f(Ljava/lang/String;)V
    .locals 0

    .line 1
    sput-object p0, Ll/kth;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public static g(Ll/byd0;Ll/vxd0;III)V
    .locals 10

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    check-cast v2, Ljava/lang/Integer;

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Ljava/lang/Long;

    .line 21
    .line 22
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide v3

    .line 26
    const-wide/16 v5, 0x0

    .line 27
    .line 28
    cmp-long v5, v3, v5

    .line 29
    .line 30
    if-nez v5, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide p2

    .line 36
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const v5, 0x5265c00

    .line 48
    .line 49
    .line 50
    if-lez p2, :cond_1

    .line 51
    .line 52
    invoke-static {}, Ll/pzi0;->o()J

    .line 53
    .line 54
    .line 55
    move-result-wide v6

    .line 56
    sub-long/2addr v6, v3

    .line 57
    mul-int/2addr p2, v5

    .line 58
    int-to-long v8, p2

    .line 59
    cmp-long p2, v6, v8

    .line 60
    .line 61
    if-lez p2, :cond_1

    .line 62
    .line 63
    invoke-static {}, Ll/pzi0;->o()J

    .line 64
    .line 65
    .line 66
    move-result-wide p2

    .line 67
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    if-lez p3, :cond_2

    .line 79
    .line 80
    invoke-static {}, Ll/pzi0;->o()J

    .line 81
    .line 82
    .line 83
    move-result-wide v6

    .line 84
    sub-long/2addr v6, v3

    .line 85
    mul-int/2addr v5, p3

    .line 86
    int-to-long v3, v5

    .line 87
    cmp-long p2, v6, v3

    .line 88
    .line 89
    if-lez p2, :cond_2

    .line 90
    .line 91
    if-ge v2, p4, :cond_2

    .line 92
    .line 93
    invoke-static {}, Ll/pzi0;->o()J

    .line 94
    .line 95
    .line 96
    move-result-wide p2

    .line 97
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    add-int/2addr v2, v0

    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    if-nez p3, :cond_3

    .line 114
    .line 115
    if-ge v2, p4, :cond_3

    .line 116
    .line 117
    invoke-static {}, Ll/pzi0;->o()J

    .line 118
    .line 119
    .line 120
    move-result-wide p2

    .line 121
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p0, p2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    add-int/2addr v2, v0

    .line 129
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    :cond_3
    return-void
.end method
