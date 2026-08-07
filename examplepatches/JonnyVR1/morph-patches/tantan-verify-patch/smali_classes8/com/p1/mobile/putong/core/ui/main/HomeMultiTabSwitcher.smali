.class public Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;
.super Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher$b;
    }
.end annotation


# static fields
.field public static p:Ljava/lang/String; = "PlayTogetherTitleBubbleKey"

.field public static q:Ljava/lang/String; = "SupremePartnerTitleBubbleKey"

.field public static r:Ljava/lang/String; = "OnlineZoneBubbleKey"

.field public static s:Ljava/lang/String; = "PrivateCustomTitleBubbleKey"


# instance fields
.field public final f:Ll/byd0;

.field public final g:Ll/vxd0;

.field public final h:Ll/byd0;

.field public final i:Ll/jxd0;

.field public final j:Ll/vxd0;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/byd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "last_play_together_title_guide_show_time_"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v1, -0x1

    .line 29
    .line 30
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->f:Ll/byd0;

    .line 38
    .line 39
    new-instance p1, Ll/vxd0;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v2, "love_buzz_show_count_"

    .line 44
    .line 45
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v2, 0x0

    .line 64
    invoke-direct {p1, v0, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->g:Ll/vxd0;

    .line 68
    .line 69
    new-instance p1, Ll/byd0;

    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v3, "last_love_buzz_title_guide_show_time_"

    .line 74
    .line 75
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->h:Ll/byd0;

    .line 97
    .line 98
    new-instance p1, Ll/jxd0;

    .line 99
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v1, "last_supreme_partner_customize_guide_tips_shown_"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 123
    .line 124
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 125
    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->i:Ll/jxd0;

    .line 128
    .line 129
    new-instance p1, Ll/vxd0;

    .line 130
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    const-string v1, "online_zone_guide_tips_show_time_"

    .line 134
    .line 135
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-direct {p1, v0, v2}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 154
    .line 155
    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->j:Ll/vxd0;

    .line 157
    .line 158
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->k:Z

    .line 159
    .line 160
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->l:Z

    .line 161
    .line 162
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m:Z

    .line 163
    .line 164
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n:Z

    .line 165
    .line 166
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o:Z

    .line 167
    .line 168
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 169
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 170
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "last_play_together_title_guide_show_time_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->f:Ll/byd0;

    .line 172
    new-instance p1, Ll/vxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "love_buzz_show_count_"

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x0

    invoke-direct {p1, p2, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->g:Ll/vxd0;

    .line 174
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "last_love_buzz_title_guide_show_time_"

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v2

    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->h:Ll/byd0;

    .line 176
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "last_supreme_partner_customize_guide_tips_shown_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 178
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->i:Ll/jxd0;

    .line 179
    new-instance p1, Ll/vxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "online_zone_guide_tips_show_time_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, v1}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->j:Ll/vxd0;

    .line 181
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->k:Z

    .line 182
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->l:Z

    .line 183
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m:Z

    .line 184
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n:Z

    .line 185
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 186
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 187
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "last_play_together_title_guide_show_time_"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p3

    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-wide/16 v0, -0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-direct {p1, p2, p3}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->f:Ll/byd0;

    .line 189
    new-instance p1, Ll/vxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "love_buzz_show_count_"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 190
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->g:Ll/vxd0;

    .line 191
    new-instance p1, Ll/byd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v1, "last_love_buzz_title_guide_show_time_"

    invoke-direct {p2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object v1

    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, p3}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->h:Ll/byd0;

    .line 193
    new-instance p1, Ll/jxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "last_supreme_partner_customize_guide_tips_shown_"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 194
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p3

    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 195
    sget-object p3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p1, p2, p3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->i:Ll/jxd0;

    .line 196
    new-instance p1, Ll/vxd0;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "online_zone_guide_tips_show_time_"

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    move-result-object p3

    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->j:Ll/vxd0;

    .line 198
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->k:Z

    .line 199
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->l:Z

    .line 200
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m:Z

    .line 201
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n:Z

    .line 202
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o:Z

    return-void
.end method

.method public static synthetic j(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic k(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->w()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->s()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->v()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->u()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->x()V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public B(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v0, Ll/adc0;->sb:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public C(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->YOUTH_VIP:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v1, Ll/adc0;->sb:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m:Z

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public D()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_7

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->e:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 17
    .line 18
    invoke-static {v2}, Ll/jj40;->b(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Ll/ij40;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    goto/16 :goto_3

    .line 25
    .line 26
    :cond_0
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    sget-object v4, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->HOME:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 35
    .line 36
    invoke-virtual {v4, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    sget v5, Ll/adc0;->Fd:I

    .line 47
    .line 48
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    check-cast v4, Landroid/widget/ImageView;

    .line 53
    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->e:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 57
    .line 58
    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_1

    .line 63
    .line 64
    sget v1, Ll/dbc0;->i8:I

    .line 65
    .line 66
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_2

    .line 70
    .line 71
    :cond_1
    sget v1, Ll/dbc0;->j8:I

    .line 72
    .line 73
    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    goto/16 :goto_2

    .line 77
    .line 78
    :cond_2
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    sget v5, Ll/adc0;->Ed:I

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Lv/VText;

    .line 89
    .line 90
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->e:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 91
    .line 92
    invoke-virtual {v5, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-eqz v5, :cond_4

    .line 97
    .line 98
    iget v3, v2, Ll/ij40;->e:I

    .line 99
    .line 100
    invoke-static {v4, v3}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    iget v5, v2, Ll/ij40;->c:I

    .line 108
    .line 109
    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    .line 115
    .line 116
    iget-object v3, v2, Ll/ij40;->g:Landroid/graphics/Typeface;

    .line 117
    .line 118
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    if-eqz v3, :cond_3

    .line 123
    .line 124
    iget-object v2, v2, Ll/ij40;->g:Landroid/graphics/Typeface;

    .line 125
    .line 126
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 127
    .line 128
    .line 129
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 130
    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->e:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-eqz v2, :cond_5

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const/high16 v2, 0x3f800000    # 1.0f

    .line 144
    .line 145
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 146
    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_4
    iget v5, v2, Ll/ij40;->f:I

    .line 150
    .line 151
    invoke-static {v4, v5}, Ll/msi0;->o(Landroid/widget/TextView;I)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    iget v2, v2, Ll/ij40;->d:I

    .line 159
    .line 160
    invoke-virtual {v5, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 165
    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-eqz v2, :cond_5

    .line 174
    .line 175
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const v2, 0x3e99999a    # 0.3f

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 183
    .line 184
    .line 185
    :cond_5
    :goto_1
    invoke-static {}, Ll/gra;->z()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-eqz v1, :cond_6

    .line 190
    .line 191
    const/high16 v1, 0x41a00000    # 20.0f

    .line 192
    .line 193
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 194
    .line 195
    .line 196
    :cond_6
    :goto_2
    add-int/lit8 v0, v0, 0x1

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :cond_7
    :goto_3
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->p()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->h(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->i(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->TOP_PICKS:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 5
    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Ll/r5j0;->INSTANCE:Ll/r5j0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/r5j0;->e()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PLAY_TOGETHER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 15
    .line 16
    const-string v0, "p_suggest_users_home_view"

    .line 17
    .line 18
    if-ne p1, p0, :cond_1

    .line 19
    .line 20
    const-string p0, "e_suggest_offline_party"

    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->MOMENT_THEME_CARD:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 27
    .line 28
    if-ne p1, p0, :cond_2

    .line 29
    .line 30
    const-string p0, "e_activity_momentcard"

    .line 31
    .line 32
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->ALREADY_AUTH:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 37
    .line 38
    if-ne p1, p0, :cond_3

    .line 39
    .line 40
    const-string p0, "from_top_tab"

    .line 41
    .line 42
    const-string p1, "verified"

    .line 43
    .line 44
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    filled-new-array {p0}, [Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const-string p1, "e_suggest_verified_tab"

    .line 53
    .line 54
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->WEBVIEW_CONFIG:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 59
    .line 60
    if-ne p1, p0, :cond_5

    .line 61
    .line 62
    const-string p0, "source"

    .line 63
    .line 64
    const-string p1, "homepage"

    .line 65
    .line 66
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 75
    .line 76
    const-string v1, "title_name"

    .line 77
    .line 78
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {}, Ll/v4j0;->f()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-eqz v1, :cond_4

    .line 87
    .line 88
    const-string v1, "1"

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    const-string v1, "0"

    .line 92
    .line 93
    :goto_0
    const-string v2, "red_dot"

    .line 94
    .line 95
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    filled-new-array {p0, p1, v1}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    const-string p1, "e_choose"

    .line 104
    .line 105
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 106
    .line 107
    .line 108
    invoke-static {}, Ll/v4j0;->f()Z

    .line 109
    .line 110
    .line 111
    move-result p0

    .line 112
    if-eqz p0, :cond_8

    .line 113
    .line 114
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 119
    .line 120
    const-string p1, "tab_name"

    .line 121
    .line 122
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    filled-new-array {p0}, [Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    const-string p1, "e_second_red_dot"

    .line 131
    .line 132
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->SUPREME_PARTNER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 137
    .line 138
    if-ne p1, p0, :cond_6

    .line 139
    .line 140
    const-string p0, "e_nearby_tab"

    .line 141
    .line 142
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->YOUTH_VIP:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 147
    .line 148
    if-ne p1, p0, :cond_7

    .line 149
    .line 150
    const-string p0, "e_youthvip_entrance"

    .line 151
    .line 152
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_7
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PRIVATE_CUSTOM:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 157
    .line 158
    if-ne p1, p0, :cond_8

    .line 159
    .line 160
    const-string p0, "e_customized_tab"

    .line 161
    .line 162
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    :cond_8
    return-void
.end method

.method public final m()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->s:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-ne p1, v1, :cond_0

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const/4 p0, 0x0

    .line 57
    return-object p0
.end method

.method public o()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yna;->E3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/yna;->T3()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->y(Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/core/ui/main/TitleSwitcher;->onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 13
    .line 14
    invoke-static {p1}, Ll/jj40;->i(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Ll/jj40;->h(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->D()V

    .line 25
    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher$a;->a:[I

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    aget p1, v0, p1

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    const-string v1, "p_suggest_users_home_view"

    .line 37
    .line 38
    packed-switch p1, :pswitch_data_0

    .line 39
    .line 40
    .line 41
    goto/16 :goto_1

    .line 42
    .line 43
    :pswitch_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o:Z

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/yna;->a4()V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-static {}, Ll/z5h0;->u()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->y(Z)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m()V

    .line 61
    .line 62
    .line 63
    const-string p0, "e_customized_tab"

    .line 64
    .line 65
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :pswitch_1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->m:Z

    .line 70
    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/tqb;->o3()V

    .line 78
    .line 79
    .line 80
    :cond_1
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->C(Z)V

    .line 81
    .line 82
    .line 83
    const-string p0, "e_youthvip_entrance"

    .line 84
    .line 85
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :pswitch_2
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f2:Ll/y6b;

    .line 92
    .line 93
    invoke-virtual {p1}, Ll/y6b;->s3()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->z(Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->r()V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->q()V

    .line 103
    .line 104
    .line 105
    const-string p0, "e_nearby_tab"

    .line 106
    .line 107
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :pswitch_3
    const-string p0, "source"

    .line 112
    .line 113
    const-string p1, "homepage"

    .line 114
    .line 115
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 124
    .line 125
    const-string v0, "title_name"

    .line 126
    .line 127
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {}, Ll/v4j0;->f()Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_2

    .line 136
    .line 137
    const-string v0, "1"

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_2
    const-string v0, "0"

    .line 141
    .line 142
    :goto_0
    const-string v2, "red_dot"

    .line 143
    .line 144
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    const-string p1, "e_choose"

    .line 153
    .line 154
    invoke-static {p1, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 155
    .line 156
    .line 157
    invoke-static {}, Ll/v4j0;->f()Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-eqz p0, :cond_3

    .line 162
    .line 163
    invoke-static {}, Ll/v4j0;->c()Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-nez p0, :cond_3

    .line 168
    .line 169
    invoke-static {}, Ll/gra;->h0()Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/HomeTopItemWebConfig;->title:Ljava/lang/String;

    .line 174
    .line 175
    const-string p1, "tab_name"

    .line 176
    .line 177
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    filled-new-array {p0}, [Ll/pf60;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    const-string p1, "e_second_red_dot"

    .line 186
    .line 187
    invoke-static {p1, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 188
    .line 189
    .line 190
    :cond_3
    :goto_1
    return-void

    .line 191
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 192
    .line 193
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    const-string p1, "verified"

    .line 200
    .line 201
    if-eqz p0, :cond_4

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 204
    .line 205
    if-eqz p0, :cond_4

    .line 206
    .line 207
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 208
    .line 209
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_4

    .line 214
    .line 215
    const/4 v0, 0x1

    .line 216
    :cond_4
    const-string p0, "from_top_tab"

    .line 217
    .line 218
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    const-string p1, "avatar_verified_status"

    .line 223
    .line 224
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    const-string p1, "e_suggest_verified_tab"

    .line 237
    .line 238
    invoke-static {p1, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :pswitch_5
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    sget-object p1, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->p:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :pswitch_6
    const-string p0, "e_activity_momentcard"

    .line 253
    .line 254
    invoke-static {p0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    nop

    .line 259
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public p()V
    .locals 1

    .line 1
    invoke-static {}, Ll/s7a;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/tqb;->l3()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g2:Ll/tqb;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/tqb;->m3()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->C(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    invoke-static {}, Ll/rs9;->e()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->r:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final r()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->i:Ll/jxd0;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->q:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final s()Z
    .locals 3

    .line 1
    invoke-static {}, Ll/rs9;->e()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->j:Ll/vxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x3

    .line 22
    if-ge v0, v2, :cond_1

    .line 23
    .line 24
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n:Z

    .line 25
    .line 26
    if-nez p0, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_1
    return v1
.end method

.method public setTabShow(Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher$b;)V
    .locals 0

    return-void
.end method

.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public u()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/yna;->E3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->l:Z

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/yna;->r3()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_1
    return v1
.end method

.method public final v()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->SUPREME_PARTNER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/c17;->u0()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    const-string v3, "\u4ed6"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string v3, "\u5979"

    .line 33
    .line 34
    :goto_0
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, "\u9644\u8fd1\u7684%s\u4e0a\u7ebf\u5566!"

    .line 39
    .line 40
    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    sget v4, Ll/c9c0;->I:I

    .line 53
    .line 54
    invoke-static {v3, v4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    filled-new-array {v3}, [I

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    sget v3, Ll/c9c0;->N:I

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const/4 v3, 0x1

    .line 73
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    const/high16 v4, 0x41500000    # 13.0f

    .line 78
    .line 79
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    new-instance v5, Ll/cbl;

    .line 89
    .line 90
    invoke-direct {v5}, Ll/cbl;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    const-wide/16 v4, 0xbb8

    .line 102
    .line 103
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    sget v4, Ll/zvk;->A:I

    .line 108
    .line 109
    sget v5, Ll/zvk;->E:I

    .line 110
    .line 111
    or-int/2addr v4, v5

    .line 112
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    sget-object v4, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->r:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1, v2, v0, v4}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n:Z

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->j:Ll/vxd0;

    .line 124
    .line 125
    invoke-virtual {p0, v3}, Ll/vxd0;->a(I)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final w()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->SUPREME_PARTNER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    const-string v3, "\u70b9\u51fb\u5f00\u542f\u5168\u65b0\u5b9a\u5236\u793e\u4ea4\u4f53\u9a8c"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    sget v4, Ll/c9c0;->I:I

    .line 34
    .line 35
    invoke-static {v3, v4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    filled-new-array {v3}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget v3, Ll/c9c0;->N:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const/4 v3, 0x1

    .line 54
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const/high16 v4, 0x41500000    # 13.0f

    .line 59
    .line 60
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const/4 v4, 0x0

    .line 65
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    new-instance v5, Ll/dbl;

    .line 70
    .line 71
    invoke-direct {v5}, Ll/dbl;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const-wide/16 v4, 0xbb8

    .line 83
    .line 84
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v4, Ll/zvk;->A:I

    .line 89
    .line 90
    sget v5, Ll/zvk;->E:I

    .line 91
    .line 92
    or-int/2addr v4, v5

    .line 93
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sget-object v4, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->q:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v1, v2, v0, v4}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->k:Z

    .line 103
    .line 104
    return-void
.end method

.method public final x()V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PRIVATE_CUSTOM:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 21
    .line 22
    .line 23
    const-string v3, "\u70b9\u51fb\u5f00\u542f\u5168\u65b0\u5b9a\u5236\u793e\u4ea4\u4f53\u9a8c"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    sget v4, Ll/c9c0;->I:I

    .line 34
    .line 35
    invoke-static {v3, v4}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    filled-new-array {v3}, [I

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    sget v3, Ll/c9c0;->N:I

    .line 48
    .line 49
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const/4 v3, 0x1

    .line 54
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    const/high16 v4, 0x41500000    # 13.0f

    .line 59
    .line 60
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const/4 v4, 0x0

    .line 65
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    new-instance v5, Ll/ebl;

    .line 70
    .line 71
    invoke-direct {v5}, Ll/ebl;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2, v5}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    const-wide/16 v4, 0xbb8

    .line 83
    .line 84
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    sget v4, Ll/zvk;->A:I

    .line 89
    .line 90
    sget v5, Ll/zvk;->E:I

    .line 91
    .line 92
    or-int/2addr v4, v5

    .line 93
    invoke-virtual {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sget-object v4, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->s:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v1, v2, v0, v4}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->l:Z

    .line 103
    .line 104
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->y2:Ll/yna;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/yna;->C3()V

    .line 109
    .line 110
    .line 111
    const-string p0, "e_customized_bubble"

    .line 112
    .line 113
    const-string v0, "p_suggest_users_home_view"

    .line 114
    .line 115
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method public y(Z)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->PRIVATE_CUSTOM:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v1, Ll/adc0;->sb:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->o:Z

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public z(Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;->SUPREME_PARTNER:Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/main/HomeMultiTabSwitcher;->n(Lcom/p1/mobile/putong/core/newui/home/frag/base/NewTanFragTag;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v0, Ll/adc0;->sb:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-nez p0, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
