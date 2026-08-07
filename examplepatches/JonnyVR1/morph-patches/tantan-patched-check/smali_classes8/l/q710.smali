.class public Ll/q710;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->userId:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->userId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v1, "\u6211"

    .line 60
    .line 61
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->text:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    return-object p0

    .line 78
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 83
    .line 84
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 85
    .line 86
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->userId:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_1

    .line 97
    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v2, "\""

    .line 101
    .line 102
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->text:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0

    .line 127
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->text:Ljava/lang/String;

    .line 132
    .line 133
    return-object p0

    .line 134
    :cond_2
    const-string p0, ""

    .line 135
    .line 136
    return-object p0
.end method
