.class public Ll/mu4$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/mu4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Ll/mu4;


# direct methods
.method public constructor <init>(Ll/mu4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mu4$a;->i:Ll/mu4;

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
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/mu4$a;->s(Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Ljava/lang/String;I)V
    .locals 0

    .line 1
    const-string p0, "problem"

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "e_problem_guide"

    .line 12
    .line 13
    const-string p2, "p_moment_post"

    .line 14
    .line 15
    invoke-static {p1, p2, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
