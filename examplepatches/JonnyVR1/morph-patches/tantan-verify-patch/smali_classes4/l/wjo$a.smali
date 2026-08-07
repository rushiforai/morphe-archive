.class public final Ll/wjo$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/wjo;
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
        "Ll/wjo$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/FragmentActivity;",
        "fragmentActivity",
        "<init>",
        "(Ll/wjo;Landroidx/fragment/app/FragmentActivity;)V",
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
.field public final synthetic j:Ll/wjo;


# direct methods
.method public constructor <init>(Ll/wjo;Landroidx/fragment/app/FragmentActivity;)V
    .locals 0
    .param p1    # Ll/wjo;
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
    iput-object p1, p0, Ll/wjo$a;->j:Ll/wjo;

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
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/wjo$a;->j:Ll/wjo;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne p1, v1, :cond_0

    .line 5
    .line 6
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ll/wjo;->v(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/wjo$a;->j:Ll/wjo;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/wjo;->i()Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 25
    .line 26
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ll/wjo;->s(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/wjo$a;->j:Ll/wjo;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/wjo;->f()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method
