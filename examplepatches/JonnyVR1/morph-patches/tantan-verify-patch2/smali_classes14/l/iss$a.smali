.class public Ll/iss$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/iss;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/iss;


# direct methods
.method public constructor <init>(Ll/iss;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/iss$a;->i:Ll/iss;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/iss$a;->i:Ll/iss;

    .line 2
    .line 3
    const-class v0, Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Ll/iss;->G(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lv/VPager;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Ll/iss$a$a;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Ll/iss$a$a;-><init>(Ll/iss$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/iss$a;->s(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;ILandroid/view/View;)V
    .locals 1

    .line 1
    const-string p0, "circle_detail_tab"

    .line 2
    .line 3
    const-string p2, "group"

    .line 4
    .line 5
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p2, "groupchat_id"

    .line 10
    .line 11
    const-string p3, ""

    .line 12
    .line 13
    invoke-static {p2, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "group_name"

    .line 18
    .line 19
    invoke-static {v0, p3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    const-string v0, "audio_id"

    .line 24
    .line 25
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p0, p2, p3, p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string p1, "e_start_audio_room_entrance"

    .line 36
    .line 37
    const-string p2, "p_circle_detail"

    .line 38
    .line 39
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
