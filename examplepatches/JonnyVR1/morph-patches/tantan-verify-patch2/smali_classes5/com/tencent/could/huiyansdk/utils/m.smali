.class public Lcom/tencent/could/huiyansdk/utils/m;
.super Ljava/util/ArrayList;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/tencent/could/huiyansdk/utils/n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->OPEN_MOUTH_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SILENCE_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->BLINK_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->NOD_HEAD_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;->SHAKE_HEAD_CHECK_DONE:Lcom/tencent/could/huiyansdk/enums/HuiYanAuthEvent;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    return-void
.end method
