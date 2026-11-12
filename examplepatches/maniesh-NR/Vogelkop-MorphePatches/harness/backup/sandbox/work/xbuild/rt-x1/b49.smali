.class public final Lb49;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqo3;


# instance fields
.field public final synthetic a:B

.field public final b:Lrlh;


# direct methods
.method public constructor <init>(Lmt3;La64;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lb49;->a:B

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    invoke-virtual {p1}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lgbf;

    .line 40
    iget-object p1, p1, Lgbf;->v:Lkze;

    .line 41
    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p1

    .line 42
    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    .line 43
    sget-object v0, Laej;->b:Lauj;

    .line 44
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 45
    invoke-static {p1, p2, v0, v1}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    .line 46
    iput-object p1, p0, Lb49;->b:Lrlh;

    return-void
.end method

.method public constructor <init>(Lmt3;La64;B)V
    .registers 6

    const/4 p3, 0x1

    iput-byte p3, p0, Lb49;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p3, Lqmb;

    const/4 v0, 0x0

    const/16 v1, 0x14

    invoke-direct {p3, v1, v0, p1}, Lqmb;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {p3}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object p1

    const/4 p3, -0x1

    invoke-static {p1, p3}, Lic4;->l(Lf99;I)Lf99;

    move-result-object p1

    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    sget-object p3, Laej;->b:Lauj;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {p1, p2, p3, v0}, La26;->o0(Lf99;Lnx5;Lbej;Ljava/lang/Object;)Lrlh;

    move-result-object p1

    iput-object p1, p0, Lb49;->b:Lrlh;

    return-void
.end method


# virtual methods
.method public final m()Llak;
    .registers 2

    iget-byte v0, p0, Lb49;->a:B

    iget-object p0, p0, Lb49;->b:Lrlh;

    return-object p0
.end method
