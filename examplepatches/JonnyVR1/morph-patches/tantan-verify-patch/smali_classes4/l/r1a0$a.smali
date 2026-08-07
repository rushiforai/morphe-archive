.class public Ll/r1a0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r1a0;->B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/r1a0;


# direct methods
.method public constructor <init>(Ll/r1a0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r1a0$a;->a:Ll/r1a0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/r1a0$a;->a:Ll/r1a0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/r1a0;->f:Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedBasicInfoRootLayout;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/r1a0$a;->a:Ll/r1a0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/dmf;->n()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    new-array p0, p0, [Ll/sfj0$a;

    .line 19
    .line 20
    const-string p1, "e_clone_profile_info_ads"

    .line 21
    .line 22
    const-string v0, "p_suggest_users_home_view"

    .line 23
    .line 24
    invoke-static {p1, v0, p0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method
