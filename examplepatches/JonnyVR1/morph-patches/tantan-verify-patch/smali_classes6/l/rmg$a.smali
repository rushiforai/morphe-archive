.class public Ll/rmg$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rmg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/MomentActivity;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/rmg;


# direct methods
.method public constructor <init>(Ll/rmg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rmg$a;->i:Ll/rmg;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/rmg$a;->s(Lcom/p1/mobile/putong/feed/data/MomentActivity;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rmg$a;->t(Lcom/p1/mobile/putong/feed/data/MomentActivity;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/MomentActivity;I)V
    .locals 3

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 2
    .line 3
    const-string v0, "comment_reply"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const-string v0, "p_activity"

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 14
    .line 15
    const-string v1, "comment"

    .line 16
    .line 17
    invoke-static {p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 24
    .line 25
    iget-object p2, p2, Ll/jka;->i0:Ljava/util/Map;

    .line 26
    .line 27
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 38
    .line 39
    iget-object v1, v1, Ll/jka;->H0:Ljava/util/Map;

    .line 40
    .line 41
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 48
    .line 49
    iget-object p0, p0, Ll/rmg$a;->i:Ll/rmg;

    .line 50
    .line 51
    invoke-static {p0, p2, v1}, Ll/rmg;->J(Ll/rmg;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const/4 p2, 0x0

    .line 56
    new-array p2, p2, [Ll/pf60;

    .line 57
    .line 58
    invoke-interface {p0, p2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    check-cast p0, [Ll/pf60;

    .line 63
    .line 64
    const-string p2, "e_comment"

    .line 65
    .line 66
    invoke-static {p2, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    invoke-static {}, Ll/cmg;->L()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    invoke-static {p1}, Ll/pfh;->c(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_4

    .line 80
    .line 81
    invoke-static {p1}, Ll/pfh;->e(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p0}, Ll/pfh;->b(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    const-string p0, "\u597d\u53cb"

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_2
    const-string p0, "\u4f60\u559c\u6b22\u7684\u4eba"

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_3
    const-string p0, ""

    .line 102
    .line 103
    :goto_0
    invoke-static {p1}, Ll/pfh;->a(Lcom/p1/mobile/putong/feed/data/MomentActivity;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_4

    .line 112
    .line 113
    const-string v1, "usertagname"

    .line 114
    .line 115
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string v1, "moments_user_id"

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    invoke-static {p2, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 132
    .line 133
    .line 134
    :cond_4
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/MomentActivity;IJ)V
    .locals 0

    .line 1
    return-void
.end method
