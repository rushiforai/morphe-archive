.class public Ll/hi00$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hi00;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/hi00;


# direct methods
.method public constructor <init>(Ll/hi00;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hi00$a;->i:Ll/hi00;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/hi00$a;->s(Lcom/p1/mobile/putong/feed/data/MomentMessage;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/MomentMessage;ILandroid/view/View;)V
    .locals 7

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 2
    .line 3
    const-string p3, "sticker"

    .line 4
    .line 5
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-eqz p3, :cond_0

    .line 10
    .line 11
    const-string p2, "gif"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string p3, "picture"

    .line 15
    .line 16
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    move-object p2, p3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    const-string p2, "text"

    .line 25
    .line 26
    :goto_0
    const-string p3, "comment_user_id"

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string p3, "comment_type"

    .line 35
    .line 36
    invoke-static {p3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object p2, p0, Ll/hi00$a;->i:Ll/hi00;

    .line 41
    .line 42
    iget-object p2, p2, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 43
    .line 44
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    const-string p3, "owner_id"

    .line 47
    .line 48
    invoke-static {p3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    iget-object p2, p0, Ll/hi00$a;->i:Ll/hi00;

    .line 53
    .line 54
    iget-object p2, p2, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 57
    .line 58
    const-string p3, "moment_id"

    .line 59
    .line 60
    invoke-static {p3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 65
    .line 66
    .line 67
    move-result-object p2

    .line 68
    iget-object p3, p0, Ll/hi00$a;->i:Ll/hi00;

    .line 69
    .line 70
    iget-object p3, p3, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    invoke-virtual {p2, p3}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string p3, "moment_type"

    .line 77
    .line 78
    invoke-static {p3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage;->isChildComment()Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    const-string p1, "reply"

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_2
    const-string p1, "comment"

    .line 92
    .line 93
    :goto_1
    const-string p2, "comment_detail"

    .line 94
    .line 95
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    const-string p2, "e_user_comment"

    .line 104
    .line 105
    const-string p3, "p_user_moment_interactions_details_view"

    .line 106
    .line 107
    invoke-static {p2, p3, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/hi00$a;->i:Ll/hi00;

    .line 111
    .line 112
    iget-object p0, p0, Ll/hi00;->s:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 113
    .line 114
    invoke-static {p0, p3}, Ll/j9h;->d(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method
