.class public Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->z(Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    const/4 p1, -0x1

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->r(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;->b:Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;->r(Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout;)Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;->d3()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->D2()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    instance-of p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 30
    .line 31
    if-eqz p2, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/insert/myself/SeeMyselfRootLayout$d;->a:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 36
    .line 37
    if-ne p0, p2, :cond_0

    .line 38
    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileListFragLocalEditImpl;->J3()V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method
