.class public final Ll/cfo$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/cfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0017\u0010\u0008\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\n\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "Ll/cfo$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/Fragment;",
        "fragment",
        "<init>",
        "(Ll/cfo;Landroidx/fragment/app/Fragment;)V",
        "",
        "position",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final synthetic j:Ll/cfo;


# direct methods
.method public constructor <init>(Ll/cfo;Landroidx/fragment/app/Fragment;)V
    .locals 0
    .param p1    # Ll/cfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/fragment/app/Fragment;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cfo$a;->j:Ll/cfo;

    .line 5
    .line 6
    invoke-direct {p0, p2}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/Fragment;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public A(I)Landroidx/fragment/app/Fragment;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 8
    .line 9
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/cfo$a;->j:Ll/cfo;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/cfo;->z(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V

    .line 15
    .line 16
    .line 17
    return-object p1

    .line 18
    :cond_0
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;

    .line 19
    .line 20
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/cfo$a;->j:Ll/cfo;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/cfo;->B(Lcom/p1/mobile/putong/core/newui/intlmeet/visitor/IntlMeetVisitorFrag;)V

    .line 26
    .line 27
    .line 28
    return-object p1

    .line 29
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/cfo$a;->j:Ll/cfo;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/cfo;->y(Lcom/p1/mobile/putong/core/newui/intlmeet/ilike/IntlILikeFrag;)V

    .line 37
    .line 38
    .line 39
    return-object p1
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    return p0
.end method
