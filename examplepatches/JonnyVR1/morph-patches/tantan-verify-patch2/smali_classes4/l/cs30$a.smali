.class public final Ll/cs30$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cs30;
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
        "Ll/cs30$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/FragmentActivity;",
        "fragmentActivity",
        "<init>",
        "(Ll/cs30;Landroidx/fragment/app/FragmentActivity;)V",
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
.field public final synthetic j:Ll/cs30;


# direct methods
.method public constructor <init>(Ll/cs30;Landroidx/fragment/app/FragmentActivity;)V
    .locals 0
    .param p1    # Ll/cs30;
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
    iput-object p1, p0, Ll/cs30$a;->j:Ll/cs30;

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
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cs30$a;->j:Ll/cs30;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;->Companion:Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/cs30;->k()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {p1, v1, v3, v2, v3}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;->b(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag$a;ZLjava/lang/String;ILjava/lang/Object;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v0, p1}, Ll/cs30;->z(Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/cs30$a;->j:Ll/cs30;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/cs30;->j()Lcom/p1/mobile/putong/core/newui/newmeet/frag/odiamond/ODiamondFrag;

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
    sget-object p1, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;->Companion:Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag$a;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/cs30;->e()Lcom/p1/mobile/putong/core/newui/newmeet/NewMeetAct;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag$a;->a(Landroid/content/Intent;)Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v0, p1}, Ll/cs30;->y(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/cs30$a;->j:Ll/cs30;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/cs30;->i()Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFrag;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    .line 56
    .line 57
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method
