.class public Ll/qhh$b;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/qhh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/feed/data/ViewersBox;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/qhh;


# direct methods
.method public constructor <init>(Ll/qhh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qhh$b;->i:Ll/qhh;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/ViewersBox;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/qhh$b;->s(Lcom/p1/mobile/putong/feed/data/ViewersBox;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/feed/data/ViewersBox;ILandroid/view/View;)V
    .locals 0

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const-string p2, "moments_user_id"

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/ViewersBox;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p2, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    filled-new-array {p0}, [Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string p1, "e_detail_visitor"

    .line 15
    .line 16
    const-string p2, "p_moment_visitor_popup"

    .line 17
    .line 18
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
