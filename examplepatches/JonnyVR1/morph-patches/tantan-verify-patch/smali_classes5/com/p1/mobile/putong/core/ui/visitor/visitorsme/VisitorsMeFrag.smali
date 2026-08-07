.class public final Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;
.super Lcom/p1/mobile/putong/app/PutongMvpFrag;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/app/PutongMvpFrag<",
        "Ll/mim0;",
        "Ll/vim0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u0000 \u00182\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0019B\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u000f\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0005R\u0018\u0010\u0013\u001a\u0004\u0018\u00010\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0011\u0010\u0012R\u0016\u0010\u0017\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;",
        "Lcom/p1/mobile/putong/app/PutongMvpFrag;",
        "Ll/mim0;",
        "Ll/vim0;",
        "<init>",
        "()V",
        "Landroid/os/Bundle;",
        "sis",
        "",
        "n4",
        "(Landroid/os/Bundle;)V",
        "P4",
        "()Ll/mim0;",
        "Q4",
        "()Ll/vim0;",
        "f4",
        "",
        "B",
        "Ljava/lang/String;",
        "from",
        "Ll/l4g0;",
        "C",
        "Ll/l4g0;",
        "myVisitorPageHelper",
        "Companion",
        "a",
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


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public B:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public C:Ll/l4g0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->Companion:Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag$a;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/l4g0;

    .line 5
    .line 6
    const-class v1, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "p_my_visitor"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/l4g0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 18
    .line 19
    return-void
.end method

.method public static O4(Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/c;->g:Lcom/p1/mobile/android/app/c;

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/l4g0;->c()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 15
    .line 16
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 29
    .line 30
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/l4g0;->g()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 43
    .line 44
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/l4g0;->e()V

    .line 53
    .line 54
    .line 55
    :cond_3
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/ar2;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->P4()Ll/mim0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/iam;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->Q4()Ll/vim0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P4()Ll/mim0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/mim0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p0}, Ll/mim0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Q4()Ll/vim0;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ll/vim0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/vim0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public f4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongMvpFrag;->f4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->B:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, "from_meet_diamond"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-string v1, "source_page_id"

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 17
    .line 18
    const-string v2, "p_diamond_tab"

    .line 19
    .line 20
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    filled-new-array {v1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->B:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "p_see_who_likes_me_view_membership"

    .line 35
    .line 36
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->C:Ll/l4g0;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->B:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    filled-new-array {v1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->lifecycle()Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/uhm0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/uhm0;-><init>(Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public n4(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->n4(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string v0, "from"

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x0

    .line 18
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/visitorsme/VisitorsMeFrag;->B:Ljava/lang/String;

    .line 19
    .line 20
    return-void
.end method
