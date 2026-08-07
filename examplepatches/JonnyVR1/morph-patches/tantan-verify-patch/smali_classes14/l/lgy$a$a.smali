.class public Ll/lgy$a$a;
.super Ll/d70;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/lgy$a;->b(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/lgy$a;


# direct methods
.method public constructor <init>(Ll/lgy$a;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lgy$a$a;->b:Ll/lgy$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lgy$a$a;->a:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/d70;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAdClicked()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d70;->onAdClicked()V

    .line 2
    .line 3
    .line 4
    const-string p0, "avatar_click_from"

    .line 5
    .line 6
    const-string v0, "visitor_ad"

    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    filled-new-array {p0}, [Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "e_intl_meet_avatar_click"

    .line 17
    .line 18
    const-string v1, "p_intl_meet_view"

    .line 19
    .line 20
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public x(Ll/jtv;)V
    .locals 2
    .param p1    # Ll/jtv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Ll/d70;->x(Ll/jtv;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/jtv;->toString()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/lgy$a$a;->a:Ll/gcg0;

    .line 8
    .line 9
    new-instance v0, Landroid/util/Pair;

    .line 10
    .line 11
    iget-object p0, p0, Ll/lgy$a$a;->b:Ll/lgy$a;

    .line 12
    .line 13
    iget-object p0, p0, Ll/lgy$a;->b:Ljava/lang/String;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, v1, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
