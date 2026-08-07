.class public Ll/m2i$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m2i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/data/BubbleInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/m2i;


# direct methods
.method public constructor <init>(Ll/m2i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m2i$a;->i:Ll/m2i;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/m2i$a;->s(Lcom/p1/mobile/putong/data/BubbleInfo;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/BubbleInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2i$a;->i:Ll/m2i;

    .line 2
    .line 3
    invoke-static {p0}, Ll/m2i;->G(Ll/m2i;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 10
    .line 11
    const-string p2, "state_id"

    .line 12
    .line 13
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-interface {p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    const-string p3, "owner_id"

    .line 28
    .line 29
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "e_other_state_avartar"

    .line 38
    .line 39
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
