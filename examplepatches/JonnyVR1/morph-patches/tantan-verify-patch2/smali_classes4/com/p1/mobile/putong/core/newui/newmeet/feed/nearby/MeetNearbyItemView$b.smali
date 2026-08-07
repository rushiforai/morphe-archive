.class public Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public b(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/android/app/Frag;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const-string v1, "right"

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v1, "left"

    .line 17
    .line 18
    :goto_0
    const-string v2, "direction"

    .line 19
    .line 20
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "other_user_id"

    .line 25
    .line 26
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "e_meet_nearby_card"

    .line 37
    .line 38
    invoke-static {v2, v0, v1}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 51
    .line 52
    iget-object v8, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 53
    .line 54
    const/4 v5, 0x0

    .line 55
    const/4 v6, 0x0

    .line 56
    const/4 v7, 0x0

    .line 57
    move-object v9, p1

    .line 58
    move v4, p2

    .line 59
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->m(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;ZZZILjava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_1

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 72
    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->M3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->i(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/android/app/Frag;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->pageId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    const-string p2, "right"

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const-string p2, "left"

    .line 23
    .line 24
    :goto_0
    const-string v1, "direction"

    .line 25
    .line 26
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string v1, "other_user_id"

    .line 31
    .line 32
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    filled-new-array {p2, p1}, [Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string p2, "e_meet_nearby_card"

    .line 43
    .line 44
    invoke-static {p2, v0, p1}, Ll/i4g0;->w(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 56
    .line 57
    invoke-static {p2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->l(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->k(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    const-string v0, "p_navigation,nearby_module"

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    const-string v0, "p_meet,e_meet_nearby_card,click"

    .line 73
    .line 74
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->nearby_people:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 75
    .line 76
    invoke-interface {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 80
    .line 81
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->h(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/b;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView$b;->a:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->j(Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method
