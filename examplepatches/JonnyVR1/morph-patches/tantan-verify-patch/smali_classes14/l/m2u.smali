.class public final Ll/m2u;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\t\u0010\nJ\u001f\u0010\u000b\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000c\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Ll/m2u;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;",
        "liveSquareTab",
        "Lcom/tantan/live/home/eventbus/LiveHomeEventBus;",
        "eventBus",
        "Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;",
        "d",
        "(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;",
        "c",
        "tab",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "b",
        "(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/m2u;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/m2u;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/m2u;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/m2u;->INSTANCE:Ll/m2u;

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

.method public static a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getTabId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->getPageId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 24
    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 26
    .line 27
    return-object p0
.end method

.method public final c(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sparse-switch v1, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v1, "square-teen-mode"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/teenmodeTab/LiveSquareTeenModeFrag;-><init>()V

    .line 27
    .line 28
    .line 29
    goto/16 :goto_1

    .line 30
    .line 31
    :sswitch_1
    const-string v1, "square-curated"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/livevideo/LiveSquareLiveVideoFrag;-><init>()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :sswitch_2
    const-string v1, "square-live-circle"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;

    .line 56
    .line 57
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/dynamic/LiveSquareDynamicFragment;-><init>()V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :sswitch_3
    const-string v1, "videoChat"

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    const-string v0, "source_live_square"

    .line 71
    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->m5(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :sswitch_4
    const-string v1, "square-nearby"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_4

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_4
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;

    .line 90
    .line 91
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;-><init>()V

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :sswitch_5
    const-string v1, "square-multi-call"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_5

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_5
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;

    .line 105
    .line 106
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;-><init>()V

    .line 107
    .line 108
    .line 109
    goto :goto_1

    .line 110
    :sswitch_6
    const-string v1, "square-suggested"

    .line 111
    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-nez v0, :cond_6

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_6
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;

    .line 120
    .line 121
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;-><init>()V

    .line 122
    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_7
    :goto_0
    new-instance v0, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;

    .line 126
    .line 127
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/internal/live/square/LiveSquareCommonFeedFrag;-><init>()V

    .line 128
    .line 129
    .line 130
    :goto_1
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    if-nez v1, :cond_8

    .line 135
    .line 136
    new-instance v1, Landroid/os/Bundle;

    .line 137
    .line 138
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 139
    .line 140
    .line 141
    :cond_8
    iget-boolean v2, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->infinitePull:Z

    .line 142
    .line 143
    iput-boolean v2, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableFilterRepeat:Z

    .line 144
    .line 145
    iput-boolean v2, p1, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableReplaceStopped:Z

    .line 146
    .line 147
    const-string v2, "TAB_INFO_BEAN"

    .line 148
    .line 149
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 150
    .line 151
    .line 152
    const-string v2, "live_square_tab_info"

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Ll/m2u;->b(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 162
    .line 163
    .line 164
    new-instance p0, Ll/l2u;

    .line 165
    .line 166
    invoke-direct {p0, p2}, Ll/l2u;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/external/square/fragments/LiveSquareBaseFrag;->i5(Ll/pcj;)V

    .line 170
    .line 171
    .line 172
    return-object v0

    .line 173
    :sswitch_data_0
    .sparse-switch
        -0x388c198d -> :sswitch_6
        0x27585122 -> :sswitch_5
        0x36da312f -> :sswitch_4
        0x4f6b6673 -> :sswitch_3
        0x66627c21 -> :sswitch_2
        0x7abd09a2 -> :sswitch_1
        0x7cb30c06 -> :sswitch_0
    .end sparse-switch
.end method

.method public final d(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/m2u;->c(Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Lcom/p1/mobile/putong/live/external/square/fragments/LiveVPagerBaseFrag;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
