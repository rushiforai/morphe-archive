.class public final Lcom/vivo/push/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/vivo/push/IPushClientFactory;


# instance fields
.field private a:Lcom/vivo/push/d/ag;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/vivo/push/d/ag;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/vivo/push/d/ag;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/vivo/push/d;->a:Lcom/vivo/push/d/ag;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final createReceiveTask(Lcom/vivo/push/o;)Lcom/vivo/push/d/z;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/vivo/push/d/ag;->b(Lcom/vivo/push/o;)Lcom/vivo/push/d/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final createReceiverCommand(Landroid/content/Intent;)Lcom/vivo/push/o;
    .locals 1

    .line 1
    const-string p0, "command"

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-gez p0, :cond_0

    .line 9
    .line 10
    const-string p0, "method"

    .line 11
    .line 12
    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    :cond_0
    const/16 v0, 0x14

    .line 17
    .line 18
    if-eq p0, v0, :cond_2

    .line 19
    .line 20
    const/16 v0, 0x7e0

    .line 21
    .line 22
    if-eq p0, v0, :cond_1

    .line 23
    .line 24
    packed-switch p0, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    goto :goto_1

    .line 29
    :pswitch_0
    new-instance p0, Lcom/vivo/push/b/j;

    .line 30
    .line 31
    invoke-direct {p0}, Lcom/vivo/push/b/j;-><init>()V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :pswitch_1
    new-instance v0, Lcom/vivo/push/b/i;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Lcom/vivo/push/b/i;-><init>(I)V

    .line 38
    .line 39
    .line 40
    :goto_0
    move-object p0, v0

    .line 41
    goto :goto_1

    .line 42
    :pswitch_2
    new-instance p0, Lcom/vivo/push/b/k;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/vivo/push/b/k;-><init>()V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :pswitch_3
    new-instance p0, Lcom/vivo/push/b/m;

    .line 49
    .line 50
    invoke-direct {p0}, Lcom/vivo/push/b/m;-><init>()V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :pswitch_4
    new-instance p0, Lcom/vivo/push/b/n;

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/vivo/push/b/n;-><init>()V

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :pswitch_5
    new-instance p0, Lcom/vivo/push/b/r;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/vivo/push/b/r;-><init>()V

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :pswitch_6
    new-instance p0, Lcom/vivo/push/b/p;

    .line 67
    .line 68
    invoke-direct {p0}, Lcom/vivo/push/b/p;-><init>()V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :pswitch_7
    new-instance p0, Lcom/vivo/push/b/q;

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/vivo/push/b/q;-><init>()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :pswitch_8
    new-instance p0, Lcom/vivo/push/b/o;

    .line 79
    .line 80
    invoke-direct {p0}, Lcom/vivo/push/b/o;-><init>()V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :pswitch_9
    new-instance v0, Lcom/vivo/push/b/t;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Lcom/vivo/push/b/t;-><init>(I)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    new-instance p0, Lcom/vivo/push/b/l;

    .line 91
    .line 92
    invoke-direct {p0}, Lcom/vivo/push/b/l;-><init>()V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    new-instance p0, Lcom/vivo/push/b/u;

    .line 97
    .line 98
    invoke-direct {p0}, Lcom/vivo/push/b/u;-><init>()V

    .line 99
    .line 100
    .line 101
    :goto_1
    if-eqz p0, :cond_4

    .line 102
    .line 103
    invoke-static {p1}, Lcom/vivo/push/a;->a(Landroid/content/Intent;)Lcom/vivo/push/a;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    if-nez p1, :cond_3

    .line 108
    .line 109
    const-string p1, "PushCommand"

    .line 110
    .line 111
    const-string v0, "bundleWapper is null"

    .line 112
    .line 113
    invoke-static {p1, v0}, Lcom/vivo/push/util/p;->b(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return-object p0

    .line 117
    :cond_3
    invoke-virtual {p0, p1}, Lcom/vivo/push/o;->b(Lcom/vivo/push/a;)V

    .line 118
    .line 119
    .line 120
    :cond_4
    return-object p0

    .line 121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final createTask(Lcom/vivo/push/o;)Lcom/vivo/push/l;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/vivo/push/d/ag;->a(Lcom/vivo/push/o;)Lcom/vivo/push/l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
