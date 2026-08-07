.class public Lcom/p1/mobile/putong/core/util/DebugUtil$d1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Bk(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/b;


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ActionToastStyle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "2"

    .line 12
    .line 13
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->styleId:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 16
    .line 17
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v2, "online"

    .line 21
    .line 22
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;->miniIcon:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->icons:Lcom/p1/mobile/putong/core/data/ActionToastStyleIcons;

    .line 25
    .line 26
    const-string v1, ""

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->toastLink:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "XXXX"

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->title:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "\u5f53\u524d\u5728\u7ebf\uff0c\u6253\u4e2a\u62db\u547c\u5427"

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->message:Ljava/lang/String;

    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showClose:Z

    .line 40
    .line 41
    new-instance v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;

    .line 42
    .line 43
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-boolean v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->showButton:Z

    .line 47
    .line 48
    const-string v1, "YYYYY"

    .line 49
    .line 50
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonMessage:Ljava/lang/String;

    .line 51
    .line 52
    const-string v1, "orange"

    .line 53
    .line 54
    iput-object v1, v2, Lcom/p1/mobile/putong/core/data/ActionToastStyleButton;->buttonBackground:Ljava/lang/String;

    .line 55
    .line 56
    new-instance v1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->buttons:Ljava/util/List;

    .line 65
    .line 66
    new-instance v1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    const-string v2, "swipe"

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->scenes:Ljava/util/List;

    .line 77
    .line 78
    const/16 v1, 0x1388

    .line 79
    .line 80
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->showTime:I

    .line 81
    .line 82
    const-string v1, "666"

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->business:Ljava/lang/String;

    .line 85
    .line 86
    const-string v1, "123456"

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ActionToastStyle;->localReportId:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ActionData;->new_()Lcom/p1/mobile/putong/core/data/ActionData;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/ActionData;->toastStyle:Lcom/p1/mobile/putong/core/data/ActionToastStyle;

    .line 95
    .line 96
    invoke-static {}, Ll/y2h0;->g()Ll/y2h0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 101
    .line 102
    invoke-virtual {v0, v2, v1}, Ll/y2h0;->k(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/core/data/ActionData;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$d1;->a:Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method
