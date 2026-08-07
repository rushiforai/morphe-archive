.class public Ll/qzg;
.super Ll/h9c;
.source "SourceFile"

# interfaces
.implements Ll/gq2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h9c;",
        "Ll/gq2<",
        "Lcom/p1/mobile/putong/feed/data/FeedData;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/cr00;

.field public d:Ll/kh00;

.field public e:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/wzh0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wzh0<",
            "Lcom/p1/mobile/putong/data/DbLinks;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/fi80;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h9c;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/pzg;

    .line 4
    .line 5
    invoke-direct {v0, p1, p2}, Ll/pzg;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 4
    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, 0x0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move v0, v2

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move v0, v1

    .line 21
    :goto_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 24
    .line 25
    if-nez v0, :cond_3

    .line 26
    .line 27
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 28
    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    move v1, v2

    .line 33
    :cond_3
    :goto_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 34
    .line 35
    :cond_4
    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p2, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p2, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Lcom/p1/mobile/putong/data/Envelope;Lcom/tantanapp/common/data/BaseData;ZZZ)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/qzg;->n(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/feed/data/FeedData;ZZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    const/16 p0, 0x12

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "feedDb"

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ll/wzh0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ll/h9c;->f()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/rrq;->e(Lcom/tantanapp/common/data/JsonAdapter;Ll/gq2;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h()V
    .locals 14

    .line 1
    new-instance v0, Ll/cr00;

    .line 2
    .line 3
    sget-object v3, Lcom/p1/mobile/putong/feed/data/Moment;->DB_ADAPTER:Ll/vzf0;

    .line 4
    .line 5
    new-instance v1, Lcom/tantanapp/common/data/orm/Index;

    .line 6
    .line 7
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Moment;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 8
    .line 9
    const/4 v4, 0x3

    .line 10
    new-array v4, v4, [Lcom/tantanapp/common/data/orm/Column;

    .line 11
    .line 12
    sget-object v5, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINUSERFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 13
    .line 14
    const/4 v6, 0x0

    .line 15
    aput-object v5, v4, v6

    .line 16
    .line 17
    sget-object v5, Lcom/p1/mobile/putong/feed/data/Moment;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    const/4 v7, 0x1

    .line 20
    aput-object v5, v4, v7

    .line 21
    .line 22
    const/4 v5, 0x2

    .line 23
    aput-object v2, v4, v5

    .line 24
    .line 25
    invoke-direct {v1, v4}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 26
    .line 27
    .line 28
    new-instance v4, Lcom/tantanapp/common/data/orm/Index;

    .line 29
    .line 30
    new-array v5, v5, [Lcom/tantanapp/common/data/orm/Column;

    .line 31
    .line 32
    sget-object v8, Lcom/p1/mobile/putong/feed/data/Moment;->LOCALINFEED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 33
    .line 34
    aput-object v8, v5, v6

    .line 35
    .line 36
    aput-object v2, v5, v7

    .line 37
    .line 38
    invoke-direct {v4, v5}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {v1, v4}, [Lcom/tantanapp/common/data/orm/Index;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-static {v1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    const/16 v5, 0x3e8

    .line 50
    .line 51
    const-string v2, "moments"

    .line 52
    .line 53
    move-object v1, p0

    .line 54
    invoke-direct/range {v0 .. v5}, Ll/cr00;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 55
    .line 56
    .line 57
    move-object v9, v1

    .line 58
    iput-object v0, v9, Ll/qzg;->c:Ll/cr00;

    .line 59
    .line 60
    new-instance v8, Ll/kh00;

    .line 61
    .line 62
    sget-object v11, Lcom/p1/mobile/putong/feed/data/MomentActivity;->DB_ADAPTER:Ll/vzf0;

    .line 63
    .line 64
    new-instance p0, Lcom/tantanapp/common/data/orm/Index;

    .line 65
    .line 66
    new-array v0, v7, [Lcom/tantanapp/common/data/orm/Column;

    .line 67
    .line 68
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 69
    .line 70
    aput-object v1, v0, v6

    .line 71
    .line 72
    invoke-direct {p0, v0}, Lcom/tantanapp/common/data/orm/Index;-><init>([Lcom/tantanapp/common/data/orm/Column;)V

    .line 73
    .line 74
    .line 75
    filled-new-array {p0}, [Lcom/tantanapp/common/data/orm/Index;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 80
    .line 81
    .line 82
    move-result-object v12

    .line 83
    const/16 v13, 0x3e8

    .line 84
    .line 85
    const-string v10, "activities"

    .line 86
    .line 87
    invoke-direct/range {v8 .. v13}, Ll/kh00;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 88
    .line 89
    .line 90
    iput-object v8, v9, Ll/qzg;->d:Ll/kh00;

    .line 91
    .line 92
    new-instance v8, Ll/wzh0;

    .line 93
    .line 94
    sget-object v11, Lcom/p1/mobile/putong/data/DbLinks;->DB_ADAPTER:Ll/vzf0;

    .line 95
    .line 96
    const/4 v12, 0x0

    .line 97
    const-string v10, "moment_links"

    .line 98
    .line 99
    invoke-direct/range {v8 .. v13}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 100
    .line 101
    .line 102
    iput-object v8, v9, Ll/qzg;->e:Ll/wzh0;

    .line 103
    .line 104
    new-instance v8, Ll/wzh0;

    .line 105
    .line 106
    sget-object v11, Lcom/p1/mobile/putong/data/DbLinks;->DB_ADAPTER:Ll/vzf0;

    .line 107
    .line 108
    const-string v10, "comment_links"

    .line 109
    .line 110
    invoke-direct/range {v8 .. v13}, Ll/wzh0;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 111
    .line 112
    .line 113
    iput-object v8, v9, Ll/qzg;->f:Ll/wzh0;

    .line 114
    .line 115
    new-instance v8, Ll/fi80;

    .line 116
    .line 117
    sget-object v11, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->DB_ADAPTER:Ll/vzf0;

    .line 118
    .line 119
    const/16 v13, 0x64

    .line 120
    .line 121
    const-string v10, "poi_mark_info"

    .line 122
    .line 123
    invoke-direct/range {v8 .. v13}, Ll/fi80;-><init>(Ll/h9c;Ljava/lang/String;Ll/vzf0;Ljava/util/List;I)V

    .line 124
    .line 125
    .line 126
    iput-object v8, v9, Ll/qzg;->g:Ll/fi80;

    .line 127
    .line 128
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/h9c;->i()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/rrq;->b()Ll/rrq;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 9
    .line 10
    invoke-virtual {v0, p0, v1}, Ll/rrq;->i(Ll/gq2;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(Lio/requery/android/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    .line 1
    const-string p3, "ALTER TABLE "

    .line 2
    .line 3
    packed-switch p2, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :pswitch_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 13
    .line 14
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v0, " ADD COLUMN hyperlink_c TEXT"

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :pswitch_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 37
    .line 38
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v0, " ADD COLUMN str_settings_visibility_c TEXT"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance p2, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 61
    .line 62
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v0, " ADD COLUMN str_dynamicType_c TEXT"

    .line 68
    .line 69
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    new-instance p2, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 85
    .line 86
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v0, " ADD COLUMN str_momentType_c TEXT"

    .line 92
    .line 93
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance p2, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 109
    .line 110
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, " ADD COLUMN str_settings_userSetVisibility_c TEXT"

    .line 116
    .line 117
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    new-instance p2, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Ll/qzg;->d:Ll/kh00;

    .line 133
    .line 134
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v0, " ADD COLUMN str_action_c TEXT"

    .line 140
    .line 141
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p2

    .line 148
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :pswitch_2
    new-instance p2, Ljava/lang/StringBuilder;

    .line 152
    .line 153
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 157
    .line 158
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v0, " ADD COLUMN userSetVisibility_c INTEGER"

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    new-instance p2, Ljava/lang/StringBuilder;

    .line 176
    .line 177
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 181
    .line 182
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const-string v0, " ADD COLUMN str_userSetVisibility_c TEXT"

    .line 188
    .line 189
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :pswitch_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 205
    .line 206
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 207
    .line 208
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v0, " ADD COLUMN simpleActivity_id_c TEXT"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    new-instance p2, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 229
    .line 230
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 231
    .line 232
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v0, " ADD COLUMN simpleActivity_name_c TEXT"

    .line 236
    .line 237
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p2

    .line 244
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    :pswitch_4
    new-instance p2, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 253
    .line 254
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    const-string v0, " ADD COLUMN additionalData_sendFrom_id_c TEXT DEFAULT \'\'"

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    new-instance p2, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 277
    .line 278
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 279
    .line 280
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v0, " ADD COLUMN additionalData_sendFrom_name_c TEXT DEFAULT \'\'"

    .line 284
    .line 285
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p2

    .line 292
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    new-instance p2, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 301
    .line 302
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 303
    .line 304
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    const-string v0, " ADD COLUMN additionalData_sendFrom_sourceType_c TEXT DEFAULT \'\'"

    .line 308
    .line 309
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 310
    .line 311
    .line 312
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    :pswitch_5
    new-instance p2, Ljava/lang/StringBuilder;

    .line 320
    .line 321
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/qzg;->d:Ll/kh00;

    .line 325
    .line 326
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 327
    .line 328
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    const-string v0, " ADD COLUMN parentMessageid_c TEXT"

    .line 332
    .line 333
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    .line 335
    .line 336
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p2

    .line 340
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 341
    .line 342
    .line 343
    :pswitch_6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 344
    .line 345
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 349
    .line 350
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 351
    .line 352
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    .line 354
    .line 355
    const-string v0, " ADD COLUMN group_id_c TEXT"

    .line 356
    .line 357
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p2

    .line 364
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    new-instance p2, Ljava/lang/StringBuilder;

    .line 368
    .line 369
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 373
    .line 374
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 375
    .line 376
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    const-string v0, " ADD COLUMN group_name_c TEXT"

    .line 380
    .line 381
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 382
    .line 383
    .line 384
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p2

    .line 388
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    new-instance p2, Ljava/lang/StringBuilder;

    .line 392
    .line 393
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 397
    .line 398
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 399
    .line 400
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    const-string v0, " ADD COLUMN group_lastJoined_c INTEGER"

    .line 404
    .line 405
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    .line 407
    .line 408
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 413
    .line 414
    .line 415
    new-instance p2, Ljava/lang/StringBuilder;

    .line 416
    .line 417
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 421
    .line 422
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v0, " ADD COLUMN additionalData_share_title_c TEXT DEFAULT \'\'"

    .line 428
    .line 429
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object p2

    .line 436
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    new-instance p2, Ljava/lang/StringBuilder;

    .line 440
    .line 441
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 445
    .line 446
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 447
    .line 448
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    const-string v0, " ADD COLUMN additionalData_share_description_c TEXT DEFAULT \'\'"

    .line 452
    .line 453
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    .line 455
    .line 456
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object p2

    .line 460
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 461
    .line 462
    .line 463
    new-instance p2, Ljava/lang/StringBuilder;

    .line 464
    .line 465
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 466
    .line 467
    .line 468
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 469
    .line 470
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 471
    .line 472
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    .line 474
    .line 475
    const-string v0, " ADD COLUMN additionalData_share_url_c TEXT DEFAULT \'\'"

    .line 476
    .line 477
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object p2

    .line 484
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    new-instance p2, Ljava/lang/StringBuilder;

    .line 488
    .line 489
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 493
    .line 494
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 495
    .line 496
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    const-string v0, " ADD COLUMN additionalData_share_landingPage_c TEXT DEFAULT \'\'"

    .line 500
    .line 501
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object p2

    .line 508
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    new-instance p2, Ljava/lang/StringBuilder;

    .line 512
    .line 513
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 517
    .line 518
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 519
    .line 520
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 521
    .line 522
    .line 523
    const-string v0, " ADD COLUMN additionalData_share_name_c TEXT DEFAULT \'\'"

    .line 524
    .line 525
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    .line 527
    .line 528
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object p2

    .line 532
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 533
    .line 534
    .line 535
    new-instance p2, Ljava/lang/StringBuilder;

    .line 536
    .line 537
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 538
    .line 539
    .line 540
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 541
    .line 542
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 543
    .line 544
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    const-string v0, " ADD COLUMN additionalData_share_shareFrom_c TEXT DEFAULT \'\'"

    .line 548
    .line 549
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    .line 551
    .line 552
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object p2

    .line 556
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    new-instance p2, Ljava/lang/StringBuilder;

    .line 560
    .line 561
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 565
    .line 566
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 567
    .line 568
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    const-string v0, " ADD COLUMN additionalData_share_testId_c TEXT DEFAULT \'\'"

    .line 572
    .line 573
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    .line 575
    .line 576
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object p2

    .line 580
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    :pswitch_7
    new-instance p2, Ljava/lang/StringBuilder;

    .line 584
    .line 585
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 586
    .line 587
    .line 588
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 589
    .line 590
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 591
    .line 592
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 593
    .line 594
    .line 595
    const-string v0, " ADD COLUMN deeplink_c TEXT"

    .line 596
    .line 597
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 598
    .line 599
    .line 600
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 601
    .line 602
    .line 603
    move-result-object p2

    .line 604
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 605
    .line 606
    .line 607
    :pswitch_8
    new-instance p2, Ljava/lang/StringBuilder;

    .line 608
    .line 609
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 610
    .line 611
    .line 612
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 613
    .line 614
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 615
    .line 616
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 617
    .line 618
    .line 619
    const-string v0, " ADD COLUMN thirdShareSource_sourceId_c TEXT"

    .line 620
    .line 621
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    .line 623
    .line 624
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object p2

    .line 628
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 629
    .line 630
    .line 631
    new-instance p2, Ljava/lang/StringBuilder;

    .line 632
    .line 633
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 634
    .line 635
    .line 636
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 637
    .line 638
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 639
    .line 640
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    .line 642
    .line 643
    const-string v0, " ADD COLUMN thirdShareSource_sourceType_c TEXT"

    .line 644
    .line 645
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 646
    .line 647
    .line 648
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object p2

    .line 652
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 653
    .line 654
    .line 655
    :pswitch_9
    new-instance p2, Ljava/lang/StringBuilder;

    .line 656
    .line 657
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 658
    .line 659
    .line 660
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 661
    .line 662
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 663
    .line 664
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 665
    .line 666
    .line 667
    const-string v0, " ADD COLUMN attitudeId_c INTEGER"

    .line 668
    .line 669
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 670
    .line 671
    .line 672
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object p2

    .line 676
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 677
    .line 678
    .line 679
    new-instance p2, Ljava/lang/StringBuilder;

    .line 680
    .line 681
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 682
    .line 683
    .line 684
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 685
    .line 686
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 687
    .line 688
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 689
    .line 690
    .line 691
    const-string v0, " ADD COLUMN attitudes_count_c INTEGER"

    .line 692
    .line 693
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 694
    .line 695
    .line 696
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 697
    .line 698
    .line 699
    move-result-object p2

    .line 700
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 701
    .line 702
    .line 703
    :pswitch_a
    new-instance p2, Ljava/lang/StringBuilder;

    .line 704
    .line 705
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 706
    .line 707
    .line 708
    iget-object v0, p0, Ll/qzg;->d:Ll/kh00;

    .line 709
    .line 710
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 711
    .line 712
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 713
    .line 714
    .line 715
    const-string v0, " ADD COLUMN replyMessageId_c TEXT"

    .line 716
    .line 717
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    .line 719
    .line 720
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object p2

    .line 724
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 725
    .line 726
    .line 727
    :pswitch_b
    new-instance p2, Ljava/lang/StringBuilder;

    .line 728
    .line 729
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 730
    .line 731
    .line 732
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 733
    .line 734
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 735
    .line 736
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 737
    .line 738
    .line 739
    const-string v0, " ADD COLUMN shareMyVote_c INTEGER"

    .line 740
    .line 741
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 742
    .line 743
    .line 744
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 745
    .line 746
    .line 747
    move-result-object p2

    .line 748
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 749
    .line 750
    .line 751
    :pswitch_c
    new-instance p2, Ljava/lang/StringBuilder;

    .line 752
    .line 753
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 754
    .line 755
    .line 756
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 757
    .line 758
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 759
    .line 760
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 761
    .line 762
    .line 763
    const-string v0, " ADD COLUMN simpleActivity_url_c TEXT"

    .line 764
    .line 765
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 766
    .line 767
    .line 768
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 769
    .line 770
    .line 771
    move-result-object p2

    .line 772
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 773
    .line 774
    .line 775
    :pswitch_d
    new-instance p2, Ljava/lang/StringBuilder;

    .line 776
    .line 777
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 778
    .line 779
    .line 780
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 781
    .line 782
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 783
    .line 784
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 785
    .line 786
    .line 787
    const-string v0, " ADD COLUMN allowForward_c TEXT"

    .line 788
    .line 789
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 790
    .line 791
    .line 792
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 793
    .line 794
    .line 795
    move-result-object p2

    .line 796
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 797
    .line 798
    .line 799
    new-instance p2, Ljava/lang/StringBuilder;

    .line 800
    .line 801
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 802
    .line 803
    .line 804
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 805
    .line 806
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 807
    .line 808
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 809
    .line 810
    .line 811
    const-string v0, " ADD COLUMN forwards_count_c INTEGER"

    .line 812
    .line 813
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 814
    .line 815
    .line 816
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 817
    .line 818
    .line 819
    move-result-object p2

    .line 820
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 821
    .line 822
    .line 823
    :pswitch_e
    new-instance p2, Ljava/lang/StringBuilder;

    .line 824
    .line 825
    const-string v0, "CREATE TABLE IF NOT EXISTS "

    .line 826
    .line 827
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 828
    .line 829
    .line 830
    iget-object v0, p0, Ll/qzg;->g:Ll/fi80;

    .line 831
    .line 832
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 833
    .line 834
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 835
    .line 836
    .line 837
    const-string v0, " (_id INTEGER PRIMARY KEY,id_c TEXT,poiName_c TEXT,latitude_c REAL,longitude_c REAL,address_c TEXT,triggerDate_c INTEGER,punchInDate_c INTEGER,triggerTimes_c INTEGER)"

    .line 838
    .line 839
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 840
    .line 841
    .line 842
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 843
    .line 844
    .line 845
    move-result-object p2

    .line 846
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 847
    .line 848
    .line 849
    :pswitch_f
    new-instance p2, Ljava/lang/StringBuilder;

    .line 850
    .line 851
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 852
    .line 853
    .line 854
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 855
    .line 856
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 857
    .line 858
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 859
    .line 860
    .line 861
    const-string v0, " ADD COLUMN isNewUserAIMoment_c INTEGER"

    .line 862
    .line 863
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 864
    .line 865
    .line 866
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 867
    .line 868
    .line 869
    move-result-object p2

    .line 870
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 871
    .line 872
    .line 873
    :pswitch_10
    new-instance p2, Ljava/lang/StringBuilder;

    .line 874
    .line 875
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 876
    .line 877
    .line 878
    iget-object v0, p0, Ll/qzg;->d:Ll/kh00;

    .line 879
    .line 880
    iget-object v0, v0, Ll/wzh0;->d:Ljava/lang/String;

    .line 881
    .line 882
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 883
    .line 884
    .line 885
    const-string v0, " ADD COLUMN userIds_c BLOB"

    .line 886
    .line 887
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 888
    .line 889
    .line 890
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 891
    .line 892
    .line 893
    move-result-object p2

    .line 894
    invoke-virtual {p1, p2}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 895
    .line 896
    .line 897
    new-instance p2, Ljava/lang/StringBuilder;

    .line 898
    .line 899
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 900
    .line 901
    .line 902
    iget-object p0, p0, Ll/qzg;->d:Ll/kh00;

    .line 903
    .line 904
    iget-object p0, p0, Ll/wzh0;->d:Ljava/lang/String;

    .line 905
    .line 906
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 907
    .line 908
    .line 909
    const-string p0, " ADD COLUMN count_c INTEGER"

    .line 910
    .line 911
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 912
    .line 913
    .line 914
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 915
    .line 916
    .line 917
    move-result-object p0

    .line 918
    invoke-virtual {p1, p0}, Lio/requery/android/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 919
    .line 920
    .line 921
    return-void

    .line 922
    nop

    .line 923
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
        :pswitch_f
        :pswitch_10
    .end packed-switch
.end method

.method public n(Lcom/p1/mobile/putong/data/Envelope;Lcom/p1/mobile/putong/feed/data/FeedData;ZZZ)V
    .locals 5

    .line 1
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p3

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    if-eqz p5, :cond_4

    .line 12
    .line 13
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p5

    .line 17
    check-cast p5, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v0, p5, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v0}, Ll/jyb;->a0(I)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v2, Ll/nzg;

    .line 35
    .line 36
    invoke-direct {v2, p2, p5}, Ll/nzg;-><init>(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v2}, Ll/jyb;->y(Ljava/util/Collection;Ll/qcj;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v2, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p5, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->K9(Ljava/lang/String;Ljava/util/List;Z)V

    .line 56
    .line 57
    .line 58
    new-instance v0, Lcom/p1/mobile/putong/data/DbLinks;

    .line 59
    .line 60
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DbLinks;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v2, p5, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 64
    .line 65
    iget v3, v2, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 66
    .line 67
    iput v3, v0, Lcom/p1/mobile/putong/data/DbLinks;->total:I

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 70
    .line 71
    iput-object v2, v0, Lcom/p1/mobile/putong/data/DbLinks;->links:Lcom/p1/mobile/putong/data/Links;

    .line 72
    .line 73
    iget-object v2, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v2, p0, Ll/qzg;->f:Ll/wzh0;

    .line 78
    .line 79
    invoke-virtual {v2, v0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v0, p5, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-interface {v2, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->dg(Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/HashMap;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/ListIterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_3

    .line 103
    .line 104
    invoke-interface {v0}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    check-cast v3, Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    check-cast v3, Ljava/lang/Boolean;

    .line 115
    .line 116
    if-eqz v3, :cond_2

    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_2

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/ListIterator;->remove()V

    .line 125
    .line 126
    .line 127
    iget-object v3, p5, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 128
    .line 129
    iget v4, v3, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 130
    .line 131
    add-int/lit8 v4, v4, -0x1

    .line 132
    .line 133
    iput v4, v3, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_3
    iget-object v0, p0, Ll/qzg;->c:Ll/cr00;

    .line 137
    .line 138
    new-instance v2, Ll/ozg;

    .line 139
    .line 140
    invoke-direct {v2}, Ll/ozg;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p5, v2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;Ll/z20;)Lcom/tantanapp/common/data/DbObject;

    .line 144
    .line 145
    .line 146
    iget-object v0, p5, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 147
    .line 148
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_0

    .line 153
    .line 154
    if-eqz p4, :cond_0

    .line 155
    .line 156
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 157
    .line 158
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_0

    .line 163
    .line 164
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 165
    .line 166
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    if-eqz v0, :cond_0

    .line 171
    .line 172
    iget-object v0, p2, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 173
    .line 174
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 181
    .line 182
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    if-nez v0, :cond_0

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    iget-object p5, p5, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 193
    .line 194
    invoke-interface {v0, p5}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->ps(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 200
    .line 201
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    if-eqz p2, :cond_5

    .line 210
    .line 211
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object p2

    .line 215
    check-cast p2, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 216
    .line 217
    iget-object p3, p0, Ll/qzg;->d:Ll/kh00;

    .line 218
    .line 219
    invoke-virtual {p3, p2}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 220
    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_5
    return-void
.end method
