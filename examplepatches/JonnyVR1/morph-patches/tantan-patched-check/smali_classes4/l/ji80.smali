.class public Ll/ji80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

.field public b:Lcom/p1/mobile/putong/data/User;

.field public c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public d:Lcom/p1/mobile/putong/data/BubbleInfo;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/BubbleInfo;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 5
    .line 6
    iput-object p2, p0, Ll/ji80;->c:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ji80;->d:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 9
    .line 10
    iput-object p4, p0, Ll/ji80;->a:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    sget-object v0, Ll/ji80$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_UP:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 20
    .line 21
    iput-object p1, p0, Ll/ji80;->a:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 25
    .line 26
    iput-object p1, p0, Ll/ji80;->a:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 30
    .line 31
    iput-object p1, p0, Ll/ji80;->a:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 32
    .line 33
    return-void
.end method
