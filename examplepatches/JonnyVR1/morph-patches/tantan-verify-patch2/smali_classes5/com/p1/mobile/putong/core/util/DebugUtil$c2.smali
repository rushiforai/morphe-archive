.class public Lcom/p1/mobile/putong/core/util/DebugUtil$c2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/util/DebugUtil;->Ui(Ljava/util/ArrayList;Lcom/p1/mobile/putong/core/newui/home/b;)V
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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartners;->new_()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    :goto_0
    const/16 v2, 0x14

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    new-instance v3, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v4, "\u8fd9\u662f\u4e00\u6761\u6587\u6848\uff0c\u666e\u901a\u7684\u6587\u6848"

    .line 17
    .line 18
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    add-int/lit8 v1, v1, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 v1, 0x0

    .line 43
    :goto_1
    const/16 v2, 0x9

    .line 44
    .line 45
    if-ge v1, v2, :cond_1

    .line 46
    .line 47
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    add-int/lit8 v1, v1, 0x1

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    new-instance v1, Ll/t05;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-direct {v1, p0, v0}, Ll/t05;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1}, Ll/t05;->show()V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 9
    .line 10
    new-instance v2, Ll/mhd;

    .line 11
    .line 12
    invoke-direct {v2, v1}, Ll/mhd;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 13
    .line 14
    .line 15
    const-string v1, "\u5f39\u51fa\u5e95\u90e8\u534a\u5c4f\u5f39\u7a97"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 25
    .line 26
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$c2$a;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$c2$a;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$c2;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "\u6e05\u695a\u5ba2\u6237\u7aef1\u5c0f\u65f6\u8bf7\u6c42\u9891\u63a7"

    .line 32
    .line 33
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/core/util/DebugUtil$c2$b;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/util/DebugUtil$c2$b;-><init>(Lcom/p1/mobile/putong/core/util/DebugUtil$c2;)V

    .line 45
    .line 46
    .line 47
    const-string v2, "\u6e05\u695a\u534a\u5c4f\u5f39\u7a97\u5c55\u793a\u9891\u63a7"

    .line 48
    .line 49
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$c2;->a:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->showDebugMenu(Ljava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
