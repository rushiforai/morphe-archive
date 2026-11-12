.class public final Lmu6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lydn;

.field public final b:Lhd;


# direct methods
.method public constructor <init>(Lydn;Lk6l;Lhd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmu6;->a:Lydn;

    iput-object p3, p0, Lmu6;->b:Lhd;

    new-instance p1, Lw43;

    new-instance v0, Luk6;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Luk6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, p3, v0}, Lw43;-><init>(Lk6l;Lhd;Luk6;)V

    return-void
.end method


# virtual methods
.method public final a(Lb2l;Ljava/lang/String;)Z
    .registers 4

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_c

    return v0

    :cond_c
    iget-object p0, p0, Lmu6;->a:Lydn;

    iget-object p1, p0, Lydn;->d:Lvdn;

    invoke-virtual {p1}, Lvdn;->a()Z

    move-result p1

    if-eqz p1, :cond_26

    iget-object p1, p0, Lydn;->c:Lgfn;

    invoke-interface {p1}, Lgfn;->isEnabled()Z

    move-result p1

    if-nez p1, :cond_25

    if-eqz p2, :cond_26

    invoke-virtual {p0, p2}, Lydn;->t(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_25
    return v0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final b(Ljava/lang/String;Lb2l;Ljo0;)V
    .registers 8

    invoke-virtual {p0, p2, p1}, Lmu6;->a(Lb2l;Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_63

    iget-object p0, p0, Lmu6;->b:Lhd;

    iget-boolean p2, p0, Lhd;->b:Z

    if-eqz p2, :cond_63

    invoke-static {p1}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_18

    move-object p2, v1

    :cond_18
    :try_start_18
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v1
    :try_end_21
    .catch Ljava/net/MalformedURLException; {:try_start_18 .. :try_end_21} :catch_21

    :catch_21
    if-eqz p2, :cond_63

    if-eqz v1, :cond_63

    iget-object p1, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p1, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v0

    new-instance v2, Lbk0;

    invoke-direct {v2, p1, v0}, Lbk0;-><init>(Ln9a;Lw56;)V

    new-instance p1, Ljkc;

    const/16 v3, 0x1d

    invoke-direct {p1, v1, p3, v3}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, p2, p1}, Lbk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v0}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-nez p1, :cond_63

    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance p2, Lrml;

    sget-object p3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p2, p3, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 p3, 0x12

    invoke-direct {p1, p0, p3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_63
    return-void
.end method
