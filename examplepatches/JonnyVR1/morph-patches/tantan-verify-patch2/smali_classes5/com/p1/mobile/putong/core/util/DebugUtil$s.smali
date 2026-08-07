.class public Lcom/p1/mobile/putong/core/util/DebugUtil$s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$s;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartners;->new_()Lcom/p1/mobile/putong/core/data/ChatPartners;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->users:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "11111111111111111"

    .line 33
    .line 34
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v3, "22222222222222222"

    .line 41
    .line 42
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    const-string v4, "3333333333333333"

    .line 49
    .line 50
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->new_()Lcom/p1/mobile/putong/core/data/ChatPartnerText;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    const-string v5, "44444444444444"

    .line 57
    .line 58
    iput-object v5, v4, Lcom/p1/mobile/putong/core/data/ChatPartnerText;->value:Ljava/lang/String;

    .line 59
    .line 60
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatPartners;->texts:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    new-instance v1, Ll/y2g0;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/DebugUtil$s;->a:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-direct {v1, p0}, Ll/y2g0;-><init>(Landroid/content/Context;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v0}, Ll/y2g0;->W(Lcom/p1/mobile/putong/core/data/ChatPartners;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method
