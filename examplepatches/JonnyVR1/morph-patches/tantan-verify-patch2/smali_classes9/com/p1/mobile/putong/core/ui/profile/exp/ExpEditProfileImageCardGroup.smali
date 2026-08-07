.class public Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;
.super Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/core/ui/profile/VReorderCards<",
        "Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;",
        ">;"
    }
.end annotation


# instance fields
.field public C:Ll/okf;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public p()Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/kec0;->w2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;->C:Ll/okf;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCard;->setUploadDataCallback(Ll/okf;)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public setUploadDataCallback(Ll/okf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/exp/ExpEditProfileImageCardGroup;->C:Ll/okf;

    .line 2
    .line 3
    return-void
.end method
