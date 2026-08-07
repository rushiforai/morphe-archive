.class public final Ll/hgy$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hgy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\t\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/hgy$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/FragmentActivity;",
        "fragmentActivity",
        "<init>",
        "(Ll/hgy;Landroidx/fragment/app/FragmentActivity;)V",
        "",
        "position",
        "Landroidx/fragment/app/Fragment;",
        "A",
        "(I)Landroidx/fragment/app/Fragment;",
        "getItemCount",
        "()I",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic j:Ll/hgy;


# direct methods
.method public constructor <init>(Ll/hgy;Landroidx/fragment/app/FragmentActivity;)V
    .locals 0
    .param p1    # Ll/hgy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/FragmentActivity;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A(I)Landroidx/fragment/app/Fragment;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->Companion:Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;

    .line 7
    .line 8
    invoke-static {p1}, Ll/hgy;->l(Ll/hgy;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-string v2, "from_meet"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;->a(ZLjava/lang/String;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ll/hgy;->I(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hgy;->u()Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    iget-object v0, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 32
    .line 33
    const/4 v1, 0x2

    .line 34
    if-ne p1, v1, :cond_1

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;->Companion:Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag$a;

    .line 37
    .line 38
    const-string v1, "nearby_meet"

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag$a;->a(Ljava/lang/String;)Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, p1}, Ll/hgy;->H(Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/hgy;->s()Lcom/p1/mobile/putong/core/newui/nearby/NearbyFrag;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 54
    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/newui/meet/likers/MeetLikersFrag;

    .line 58
    .line 59
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/meet/likers/MeetLikersFrag;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p1}, Ll/hgy;->G(Lcom/p1/mobile/putong/core/newui/meet/likers/MeetLikersFrag;)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/hgy$a;->j:Ll/hgy;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/hgy;->q()Lcom/p1/mobile/putong/core/newui/meet/likers/MeetLikersFrag;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 72
    .line 73
    .line 74
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method
