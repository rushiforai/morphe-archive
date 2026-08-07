.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->d4()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/android/app/c;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 6
    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->j2:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->V:Landroidx/recyclerview/widget/RecyclerView;

    .line 12
    .line 13
    const/4 v0, 0x4

    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->H:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->G:Lv/VProgressBar;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 34
    .line 35
    if-ne p1, v0, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->s8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$e;->a(Lcom/p1/mobile/android/app/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
