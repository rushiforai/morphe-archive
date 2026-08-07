.class public final Ll/tme0;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tme0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u0000 \r2\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u000eB\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J)\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/tme0;",
        "Ll/o2e0;",
        "Ll/zit;",
        "<init>",
        "()V",
        "liveRoomScheme",
        "Ll/gae0;",
        "plug",
        "Ll/bae0$b;",
        "extraInfo",
        "",
        "b",
        "(Ll/zit;Ll/gae0;Ll/bae0$b;)V",
        "Companion",
        "a",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/tme0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/tme0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/tme0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/tme0;->Companion:Ll/tme0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/tme0;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 4
    .param p1    # Ll/zit;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gae0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/bae0$b;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string p0, "giftId"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p2, "giftCount"

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string p3, "ignoreFirstSendAlert"

    .line 20
    .line 21
    invoke-virtual {p1, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    const-string v0, "sendConfirm"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "toUserId"

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "fromTag"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    const-string v3, "biz"

    .line 44
    .line 45
    invoke-virtual {p1, v3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_0

    .line 54
    .line 55
    const-string p3, "0"

    .line 56
    .line 57
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iput-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftId:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->toUserId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    iput p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->giftCount:I

    .line 73
    .line 74
    invoke-virtual {p3}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iput-object p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftFirstConfirmDialogFlag:Ljava/lang/String;

    .line 79
    .line 80
    const-string p0, "true"

    .line 81
    .line 82
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    iput-boolean p0, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->showSendGiftConfirmDialogFlag:Z

    .line 87
    .line 88
    iput-object v2, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->fromTag:Ljava/lang/String;

    .line 89
    .line 90
    iput-object p1, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->traceModule:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveSendActivityGiftTrace;->toJson()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string p2, "schema: sendGift. SendGiftAction: contentJson is "

    .line 99
    .line 100
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    const-string p2, "[live][schema]"

    .line 111
    .line 112
    invoke-static {p2, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    sget-object p1, Ll/htd0;->c:Ll/htd0;

    .line 116
    .line 117
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Ll/hiv;

    .line 122
    .line 123
    new-instance p2, Ll/tme0$b;

    .line 124
    .line 125
    invoke-direct {p2, p0}, Ll/tme0$b;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const-string p3, "sendGift"

    .line 129
    .line 130
    invoke-virtual {p1, p3, p0, p2}, Ll/hiv;->H(Ljava/lang/String;Ljava/lang/String;Ll/aiv$a$a;)V

    .line 131
    .line 132
    .line 133
    return-void
.end method
