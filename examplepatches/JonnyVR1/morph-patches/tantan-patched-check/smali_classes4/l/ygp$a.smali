.class public final Ll/ygp$a;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ygp;
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
        "Ll/ygp$a;",
        "Landroidx/viewpager2/adapter/FragmentStateAdapter;",
        "Landroidx/fragment/app/Fragment;",
        "fragment",
        "<init>",
        "(Ll/ygp;Landroidx/fragment/app/Fragment;)V",
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


# instance fields
.field public final synthetic j:Ll/ygp;


# direct methods
.method public constructor <init>(Ll/ygp;Landroidx/fragment/app/Fragment;)V
    .locals 0
    .param p1    # Ll/ygp;
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
    iput-object p1, p0, Ll/ygp$a;->j:Ll/ygp;

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
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Ll/ygp$a;->j:Ll/ygp;

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/ygp;->x(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/ygp$a;->j:Ll/ygp;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ygp;->j()Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetTribeFrag;

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
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object v0, p0, Ll/ygp$a;->j:Ll/ygp;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 33
    .line 34
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/ygp;->v(Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/ygp$a;->j:Ll/ygp;

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/ygp;->i()Lcom/p1/mobile/putong/core/newui/intlmeet/likers/IntlMeetLikersFrag;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    new-instance p1, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetFrag2;

    .line 51
    .line 52
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetFrag2;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ll/ygp;->u(Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetFrag2;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/ygp$a;->j:Ll/ygp;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/ygp;->f()Lcom/p1/mobile/putong/core/newui/intlmeet/tribe/IntlMeetFrag2;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    return-object p0
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method
