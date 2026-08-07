.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;)Ll/lp90;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/a;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->c()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc$ComboType;->getLayoutDesc()Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/b;->e(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/profilelist/buttons/LayoutDesc;)Ll/lp90;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
