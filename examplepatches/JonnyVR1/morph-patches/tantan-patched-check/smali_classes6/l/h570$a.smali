.class public Ll/h570$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h570;
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
.field public final synthetic i:Ll/h570;


# direct methods
.method public constructor <init>(Ll/h570;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h570$a;->i:Ll/h570;

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
    invoke-virtual {p0, p1, p2}, Ll/h570$a;->s(Lcom/p1/mobile/putong/feed/data/MomentActivity;I)V

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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/h570$a;->t(Lcom/p1/mobile/putong/feed/data/MomentActivity;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/MomentActivity;I)V
    .locals 1

    .line 1
    invoke-static {}, Ll/cmg;->W()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/photoalbumactivities/PhotoAlbumActivitiesAct;->j:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Ll/h570$a;->i:Ll/h570;

    .line 10
    .line 11
    iget-object v0, v0, Ll/elh;->a:Ll/umh;

    .line 12
    .line 13
    iget-object v0, v0, Ll/umh;->a:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    const-string p0, "user_id"

    .line 22
    .line 23
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->actors:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 32
    .line 33
    const-string p2, "moment_id"

    .line 34
    .line 35
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "e_likes_list"

    .line 44
    .line 45
    const-string p2, "p_content_likes"

    .line 46
    .line 47
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 52
    .line 53
    const-string v0, "comment_reply"

    .line 54
    .line 55
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    if-nez p2, :cond_2

    .line 60
    .line 61
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->action:Lcom/p1/mobile/putong/feed/data/ActivityActionApi;

    .line 62
    .line 63
    const-string v0, "comment"

    .line 64
    .line 65
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    return-void

    .line 73
    :cond_2
    :goto_0
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 74
    .line 75
    iget-object p2, p2, Ll/jka;->i0:Ljava/util/Map;

    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->reference:Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentIdBoxed;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 88
    .line 89
    iget-object v0, v0, Ll/jka;->H0:Ljava/util/Map;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->messageid:Ljava/lang/String;

    .line 92
    .line 93
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 98
    .line 99
    iget-object p0, p0, Ll/h570$a;->i:Ll/h570;

    .line 100
    .line 101
    invoke-static {p0, p2, p1}, Ll/h570;->M(Ll/h570;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentMessage;)Ljava/util/List;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    const/4 p1, 0x0

    .line 106
    new-array p1, p1, [Ll/pf60;

    .line 107
    .line 108
    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    check-cast p0, [Ll/pf60;

    .line 113
    .line 114
    const-string p1, "e_comment"

    .line 115
    .line 116
    const-string p2, "p_activity"

    .line 117
    .line 118
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/feed/data/MomentActivity;IJ)V
    .locals 0

    .line 1
    return-void
.end method
