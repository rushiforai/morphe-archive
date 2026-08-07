.class public Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dn4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->B()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ll/txl0;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;Z)Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$b;->a:[I

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    aget p2, v1, p2

    .line 10
    .line 11
    const/4 v1, 0x3

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x1

    .line 14
    if-eq p2, v3, :cond_1

    .line 15
    .line 16
    if-eq p2, v2, :cond_2

    .line 17
    .line 18
    if-eq p2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 25
    .line 26
    :cond_2
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 27
    .line 28
    :try_start_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 29
    .line 30
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->g:Ll/r2a;

    .line 31
    .line 32
    iget-object p1, p1, Ll/txl0;->a:Landroid/view/View;

    .line 33
    .line 34
    invoke-interface {p2, p1, v0, p3}, Ll/r2a;->d(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 35
    .line 36
    .line 37
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    goto :goto_1

    .line 39
    :catch_0
    move-exception p1

    .line 40
    sget-object p2, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 41
    .line 42
    new-instance p3, Ljava/lang/RuntimeException;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v4, "\u5212\u5361\u5f02\u5e38\uff1a"

    .line 47
    .line 48
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v4, ","

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$a;->a:Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack;->f:Ll/px2;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/mx2;->b()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-direct {p3, p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p3}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 82
    .line 83
    .line 84
    move-object p0, p2

    .line 85
    :goto_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/myinterestpeople/CoreMyInterestPeopleCardStack$b;->b:[I

    .line 86
    .line 87
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    aget p0, p1, p0

    .line 92
    .line 93
    if-eq p0, v3, :cond_5

    .line 94
    .line 95
    if-eq p0, v2, :cond_4

    .line 96
    .line 97
    if-eq p0, v1, :cond_3

    .line 98
    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 100
    .line 101
    return-object p0

    .line 102
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->STAY:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->PASS:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;->BACK:Lcom/p1/mobile/putong/core/newui/home/opt/CardSwipeOutState;

    .line 109
    .line 110
    return-object p0
.end method
