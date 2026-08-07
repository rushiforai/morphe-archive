.class public Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;
.super Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/npl;


# instance fields
.field public A:Ll/m520;

.field public B:Ljava/lang/String;

.field public C:Ljava/lang/String;

.field public z:Ll/d520;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M4(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "userId"

    .line 12
    .line 13
    invoke-virtual {v1, v2, p0}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "from"

    .line 17
    .line 18
    invoke-virtual {v1, p0, p1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method


# virtual methods
.method public d4()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongFrag;->d4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string v1, "userId"

    .line 12
    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->B:Ljava/lang/String;

    .line 20
    .line 21
    const-string v1, "from"

    .line 22
    .line 23
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->C:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->B:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    :goto_0
    return-void

    .line 38
    :cond_1
    new-instance v0, Ll/d520;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->B:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->C:Ljava/lang/String;

    .line 43
    .line 44
    invoke-direct {v0, p0, v1, v2}, Ll/d520;-><init>(Ll/ner;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->z:Ll/d520;

    .line 48
    .line 49
    new-instance v0, Ll/m520;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/m520;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->A:Ll/m520;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->z:Ll/d520;

    .line 57
    .line 58
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->z:Ll/d520;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/d520;->Z()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->A:Ll/m520;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/m520;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/MyRoomInProfileFrag;->z:Ll/d520;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/d520;->i0(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
