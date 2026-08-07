.class public Ll/vb3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

.field public b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/lang/String;

.field public h:Z

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 5
    .line 6
    iput-object v0, p0, Ll/vb3;->a:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 9
    .line 10
    iput-object v0, p0, Ll/vb3;->c:Ljava/util/List;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 13
    .line 14
    iput-object v0, p0, Ll/vb3;->d:Ljava/util/List;

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 17
    .line 18
    iput-object v0, p0, Ll/vb3;->e:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 21
    .line 22
    iput-object v0, p0, Ll/vb3;->f:Ljava/util/List;

    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Ll/vb3;->g:Ljava/lang/String;

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/vb3;->h:Z

    .line 31
    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 33
    .line 34
    iput v0, p0, Ll/vb3;->i:I

    .line 35
    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/vb3;->j:Z

    .line 39
    .line 40
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/vb3;->k:Z

    .line 43
    .line 44
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 45
    .line 46
    iput-object v0, p0, Ll/vb3;->b:Ljava/util/List;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 49
    .line 50
    iput-object v0, p0, Ll/vb3;->m:Ljava/util/List;

    .line 51
    .line 52
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 53
    .line 54
    iput-boolean p1, p0, Ll/vb3;->l:Z

    .line 55
    .line 56
    return-void
.end method

.method public static a(Z)Ll/vb3;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    new-instance v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 12
    .line 13
    invoke-direct {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iput-object v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v4, ""

    .line 36
    .line 37
    iput-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v4, 0x0

    .line 40
    iput v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 41
    .line 42
    new-instance v5, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v5, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 45
    .line 46
    .line 47
    iput-object v5, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v5, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 55
    .line 56
    const/4 v1, 0x3

    .line 57
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 74
    .line 75
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 81
    .line 82
    const/4 v0, 0x4

    .line 83
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 93
    .line 94
    const/4 v0, 0x5

    .line 95
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->settingZone:Ljava/util/List;

    .line 105
    .line 106
    const/16 v0, 0x17

    .line 107
    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iput-boolean v4, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 116
    .line 117
    const-string p0, "layered"

    .line 118
    .line 119
    iput-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_0
    iget-object p0, v4, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    iget-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->quickZone:Ljava/util/List;

    .line 130
    .line 131
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    :goto_0
    new-instance p0, Ll/vb3;

    .line 135
    .line 136
    invoke-direct {p0, v3}, Ll/vb3;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;)V

    .line 137
    .line 138
    .line 139
    return-object p0
.end method
