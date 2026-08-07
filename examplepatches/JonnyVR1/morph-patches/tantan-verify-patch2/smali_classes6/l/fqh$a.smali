.class public Ll/fqh$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fqh;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/data/Emotion;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/fqh;


# direct methods
.method public constructor <init>(Ll/fqh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fqh$a;->i:Ll/fqh;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/fqh$a;->s(Lcom/p1/mobile/putong/data/Emotion;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/Emotion;ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fqh$a;->i:Ll/fqh;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fqh;->F(Ll/fqh;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p2, "state_type_id"

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    filled-new-array {p1}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string p2, "e_set_my_state_type"

    .line 20
    .line 21
    invoke-static {p2, p0, p1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
