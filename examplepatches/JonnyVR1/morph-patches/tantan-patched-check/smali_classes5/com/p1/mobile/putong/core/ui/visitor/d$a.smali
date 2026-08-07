.class public Lcom/p1/mobile/putong/core/ui/visitor/d$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/visitor/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Ll/cfm0;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/core/ui/visitor/d;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/visitor/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/visitor/d$a;->i:Lcom/p1/mobile/putong/core/ui/visitor/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/cfm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/visitor/d$a;->s(Ll/cfm0;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic l(Ljava/lang/Object;IJ)V
    .locals 0

    .line 1
    check-cast p1, Ll/cfm0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/ui/visitor/d$a;->t(Ll/cfm0;IJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ll/cfm0;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/cfm0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "moment_visitor_type"

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/cfm0;->a()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p1, p1, Ll/cfm0;->b:Lcom/p1/mobile/putong/data/Visitor;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Visitor;->userId:Ljava/lang/String;

    .line 20
    .line 21
    const-string p2, "owner_id"

    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_moment_visitor_detail"

    .line 32
    .line 33
    const-string p2, "p_moment_visitor"

    .line 34
    .line 35
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public t(Ll/cfm0;IJ)V
    .locals 0

    .line 1
    return-void
.end method
