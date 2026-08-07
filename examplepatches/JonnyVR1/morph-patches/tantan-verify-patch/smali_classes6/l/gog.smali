.class public Ll/gog;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fog;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroidx/fragment/app/FragmentManager;ILandroid/os/Bundle;)Landroidx/fragment/app/Fragment;
    .locals 2

    .line 1
    const-string p0, "momentListInProfileFrag"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "user_id"

    .line 17
    .line 18
    invoke-virtual {p3, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p3

    .line 22
    invoke-static {p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;->d5(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/PersonalFeedInMineFrag;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, p2, p3, p0}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Landroidx/fragment/app/k;->l()V

    .line 35
    .line 36
    .line 37
    return-object p3
.end method
