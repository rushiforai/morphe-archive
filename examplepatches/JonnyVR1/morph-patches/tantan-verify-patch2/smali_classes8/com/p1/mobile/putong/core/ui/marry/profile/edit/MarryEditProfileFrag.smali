.class public Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;
.super Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;
.source "SourceFile"

# interfaces
.implements Ll/ezw;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag<",
        "Ll/nzw;",
        "Ll/yzw;",
        ">;",
        "Ll/ezw;"
    }
.end annotation


# instance fields
.field public C:Ll/nyl;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic M4()Ll/czw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;->Q4()Ll/nzw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic N4()Ll/dzw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;->R4()Ll/yzw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public P4(Ll/nyl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;->C:Ll/nyl;

    .line 2
    .line 3
    return-void
.end method

.method public Q4()Ll/nzw;
    .locals 1

    .line 1
    new-instance v0, Ll/nzw;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nzw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public R4()Ll/yzw;
    .locals 1

    .line 1
    new-instance v0, Ll/yzw;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/yzw;-><init>(Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public S3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    check-cast p0, Ll/yzw;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/yzw;->E(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S4()Ll/nyl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryEditProfileFrag;->C:Ll/nyl;

    .line 2
    .line 3
    return-object p0
.end method

.method public l0(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/base/MarryEditProfileBaseFrag;->A:Ll/dzw;

    .line 2
    .line 3
    check-cast p0, Ll/yzw;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/yzw;->F(IILandroid/content/Intent;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
