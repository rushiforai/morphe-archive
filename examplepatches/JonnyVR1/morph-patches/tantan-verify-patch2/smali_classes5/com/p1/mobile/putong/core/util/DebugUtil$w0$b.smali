.class public Lcom/p1/mobile/putong/core/util/DebugUtil$w0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->call()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/DebugUtil$w0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/util/DebugUtil$w0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$w0;

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
    .locals 3

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
    const-string v1, ""

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "\u6797\u9752\u971e"

    .line 26
    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 32
    .line 33
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->mainImg:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "\u5f53\u524d\u5728\u7ebf\uff0c\u6253\u4e2a\u62db\u547c\u5427"

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 51
    .line 52
    new-instance v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 53
    .line 54
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-boolean v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->showButton:Z

    .line 58
    .line 59
    const-string v1, "[\u7231\u5fc3]\u65e9\u4e0a\u597d"

    .line 60
    .line 61
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "white"

    .line 64
    .line 65
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonBackground:Ljava/lang/String;

    .line 66
    .line 67
    const-string v1, "tantanapp://jumpChat?uid=137071&showKeyboard=true&appendMsg=\u65e9\u4e0a\u597d"

    .line 68
    .line 69
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonLink:Ljava/lang/String;

    .line 70
    .line 71
    new-instance v1, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 80
    .line 81
    new-instance v1, Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v2, "swipe"

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 92
    .line 93
    const/16 v1, 0x1388

    .line 94
    .line 95
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 96
    .line 97
    const-string v1, "666"

    .line 98
    .line 99
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionData;->new_()Lcom/p1/mobile/putong/core/data/ActionData;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 106
    .line 107
    invoke-static {}, Ll/y2h0;->g()Ll/y2h0;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0$b;->a:Lcom/p1/mobile/putong/core/util/DebugUtil$w0;

    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$w0;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 114
    .line 115
    invoke-virtual {v0, p0, v1}, Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 116
    .line 117
    .line 118
    return-void
.end method
