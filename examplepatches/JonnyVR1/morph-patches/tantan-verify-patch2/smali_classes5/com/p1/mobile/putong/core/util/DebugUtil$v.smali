.class public Lcom/p1/mobile/putong/core/util/DebugUtil$v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->xj(Lcom/p1/mobile/putong/core/newui/home/b;Ll/b240;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$v;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "1"

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "online"

    .line 16
    .line 17
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->miniIcon:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 20
    .line 21
    const-string v1, "tantanapp://sendMessage?uid=137071&msg=\u65e9\u4e0a\u597d"

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 24
    .line 25
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 28
    .line 29
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "\u6797\u9752\u971e"

    .line 42
    .line 43
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "\u5f53\u524d\u5728\u7ebf\uff0c\u6253\u4e2a\u62db\u547c\u5427"

    .line 46
    .line 47
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 51
    .line 52
    new-instance v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 53
    .line 54
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;-><init>()V

    .line 55
    .line 56
    .line 57
    const/4 v3, 0x1

    .line 58
    iput-boolean v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->showButton:Z

    .line 59
    .line 60
    const-string v3, "[\u7231\u5fc3]\u65e9\u4e0a\u597d"

    .line 61
    .line 62
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 63
    .line 64
    const-string v3, "white"

    .line 65
    .line 66
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonBackground:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonLink:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v1, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 79
    .line 80
    new-instance v1, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    const-string v2, "swipe"

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    const-string v2, "123456"

    .line 91
    .line 92
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 93
    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 95
    .line 96
    const/16 v1, 0x1388

    .line 97
    .line 98
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 99
    .line 100
    const-string v1, "female_online"

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionData;->new_()Lcom/p1/mobile/putong/core/data/ActionData;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 109
    .line 110
    invoke-static {}, Ll/y2h0;->g()Ll/y2h0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$v;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 115
    .line 116
    invoke-virtual {v0, p0, v1}, Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method
