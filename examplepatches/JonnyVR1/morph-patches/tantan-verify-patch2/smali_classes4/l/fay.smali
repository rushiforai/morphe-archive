.class public final Ll/fay;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0006\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0005H\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bR$\u0010\u0013\u001a\u0004\u0018\u00010\u000c8\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\r\u0010\u000e\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012\u00a8\u0006\u0014"
    }
    d2 = {
        "Ll/fay;",
        "",
        "<init>",
        "()V",
        "Lrx/c;",
        "Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;",
        "e",
        "()Lrx/c;",
        "svipWeeklyReport",
        "",
        "d",
        "(Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)V",
        "Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;",
        "a",
        "Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;",
        "c",
        "()Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;",
        "setSvipWeeklyItemData",
        "(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;)V",
        "svipWeeklyItemData",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;

    .line 6
    .line 7
    return-object p0
.end method

.method public static b(Ll/fay;Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fay;->d(Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)V

    .line 4
    .line 5
    .line 6
    return-object p1

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return-object p0
.end method


# virtual methods
.method public final c()Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fay;->a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;)V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/fay;->a:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->title:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;->title:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->subTitle:Ljava/lang/String;

    .line 13
    .line 14
    iput-object p0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;->subTitle:Ljava/lang/String;

    .line 15
    .line 16
    new-instance p0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p0, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;->svipWeeklyItems:Ljava/util/List;

    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;->statistics:Ljava/util/List;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    check-cast p0, Ljava/lang/Iterable;

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_5

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;

    .line 45
    .line 46
    new-instance v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;

    .line 47
    .line 48
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->type:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->itemType:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->count:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->numberValue:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v2, v0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData;->svipWeeklyItems:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->type:Ljava/lang/String;

    .line 65
    .line 66
    sget-object v3, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->ITEM_TYPE_VISITOR:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    const/4 v4, 0x1

    .line 73
    if-eqz v3, :cond_1

    .line 74
    .line 75
    sget p1, Ll/gbc0;->t5:I

    .line 76
    .line 77
    iput p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->iconRes:I

    .line 78
    .line 79
    const-string p1, "\u770b\u8fc7\u4e86\u6211"

    .line 80
    .line 81
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->lable:Ljava/lang/String;

    .line 82
    .line 83
    iput v4, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->svipWeeklyItemRenderType:I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->ITEM_TYPE_LIKERS:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    if-eqz v3, :cond_2

    .line 93
    .line 94
    sget p1, Ll/gbc0;->r5:I

    .line 95
    .line 96
    iput p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->iconRes:I

    .line 97
    .line 98
    const-string p1, "\u559c\u6b22\u4e86\u6211"

    .line 99
    .line 100
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->lable:Ljava/lang/String;

    .line 101
    .line 102
    iput v4, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->svipWeeklyItemRenderType:I

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    sget-object v3, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->ITEM_TYPE_NEW_MATCH:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_3

    .line 112
    .line 113
    sget p1, Ll/gbc0;->s5:I

    .line 114
    .line 115
    iput p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->iconRes:I

    .line 116
    .line 117
    const-string p1, "\u65b0\u914d\u5bf9"

    .line 118
    .line 119
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->lable:Ljava/lang/String;

    .line 120
    .line 121
    iput v4, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->svipWeeklyItemRenderType:I

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->ITEM_TYPE_CHATWITH:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    const/4 v4, 0x2

    .line 131
    if-eqz v3, :cond_4

    .line 132
    .line 133
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->otherUserID:Ljava/lang/String;

    .line 134
    .line 135
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->otherUserId:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->userImgUrl:Ljava/lang/String;

    .line 138
    .line 139
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->userImgUrl:Ljava/lang/String;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->userName:Ljava/lang/String;

    .line 142
    .line 143
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->userName:Ljava/lang/String;

    .line 144
    .line 145
    const-string p1, "\u7279\u522b\u597d\u53cb"

    .line 146
    .line 147
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->lable:Ljava/lang/String;

    .line 148
    .line 149
    iput v4, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->svipWeeklyItemRenderType:I

    .line 150
    .line 151
    goto :goto_0

    .line 152
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->ITEM_TYPE_CARE:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v2

    .line 158
    if-eqz v2, :cond_0

    .line 159
    .line 160
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->otherUserID:Ljava/lang/String;

    .line 161
    .line 162
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->otherUserId:Ljava/lang/String;

    .line 163
    .line 164
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->userImgUrl:Ljava/lang/String;

    .line 165
    .line 166
    iput-object v2, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->userImgUrl:Ljava/lang/String;

    .line 167
    .line 168
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SvipWeeklyReportItem;->userName:Ljava/lang/String;

    .line 169
    .line 170
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->userName:Ljava/lang/String;

    .line 171
    .line 172
    const-string p1, "\u6211\u6700\u5173\u5fc3"

    .line 173
    .line 174
    iput-object p1, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->lable:Ljava/lang/String;

    .line 175
    .line 176
    iput v4, v1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;->svipWeeklyItemRenderType:I

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_5
    return-void
.end method

.method public final e()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/SvipWeeklyReport;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->dh()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->M3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/s;->I5()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/day;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/day;-><init>(Ll/fay;)V

    .line 32
    .line 33
    .line 34
    new-instance p0, Ll/eay;

    .line 35
    .line 36
    invoke-direct {p0, v1}, Ll/eay;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    return-object p0
.end method
