.class public final Ldw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqo3;


# instance fields
.field public final synthetic a:B

.field public final b:Lrlh;


# direct methods
.method public constructor <init>(Lmt3;La64;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Ldw;->a:B

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lqmb;

    const/4 v1, 0x0

    const/16 v2, 0x13

    invoke-direct {v0, v2, v1, p1}, Lqmb;-><init>(BLmt5;Ljava/lang/Object;)V

    .line 47
    invoke-static {v0}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object p1

    const/4 v0, -0x1

    .line 48
    invoke-static {p1, v0}, Lic4;->l(Lf99;I)Lf99;

    move-result-object p1

    .line 49
    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    .line 50
    sget-object v0, Laej;->b:Lauj;

    .line 51
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    invoke-static {p1, p2, v0, v1}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    .line 53
    iput-object p1, p0, Ldw;->b:Lrlh;

    return-void
.end method

.method public constructor <init>(Lpde;La64;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Ldw;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v1

    new-instance v2, Lcw;

    invoke-direct {v2, v1, p0, v0}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v1

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbtl;

    iget-object p1, p1, Lbtl;->a:Lb7j;

    sget-object v2, Lb7j;->d:Lb7j;

    if-ne p1, v2, :cond_20

    const/4 v0, 0x1

    :cond_20
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    sget-object v0, Laej;->b:Lauj;

    invoke-static {v1, p2, v0, p1}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Ldw;->b:Lrlh;

    return-void
.end method


# virtual methods
.method public final m()Llak;
    .registers 2

    iget-byte v0, p0, Ldw;->a:B

    iget-object p0, p0, Ldw;->b:Lrlh;

    return-object p0
.end method
