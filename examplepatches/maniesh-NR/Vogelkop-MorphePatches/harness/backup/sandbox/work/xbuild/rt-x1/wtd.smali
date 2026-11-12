.class public final synthetic Lwtd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Le6e;Lek6;ZLjava/lang/String;Le6g;)V
    .registers 7

    const/4 v0, 0x2

    iput-byte v0, p0, Lwtd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwtd;->c:Ljava/lang/Object;

    iput-object p2, p0, Lwtd;->d:Ljava/lang/Object;

    iput-boolean p3, p0, Lwtd;->b:Z

    iput-object p4, p0, Lwtd;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwtd;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;ZLyhe;Lg4i;Lkotlin/jvm/functions/Function0;)V
    .registers 7

    .line 17
    const/4 v0, 0x1

    iput-byte v0, p0, Lwtd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwtd;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lwtd;->b:Z

    iput-object p3, p0, Lwtd;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwtd;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwtd;->f:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(ZLcfe;Lafe;Lw2m;Lw2m;)V
    .registers 7

    .line 18
    const/4 v0, 0x0

    iput-byte v0, p0, Lwtd;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lwtd;->b:Z

    iput-object p2, p0, Lwtd;->c:Ljava/lang/Object;

    iput-object p3, p0, Lwtd;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwtd;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwtd;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-byte v0, p0, Lwtd;->a:B

    iget-boolean v1, p0, Lwtd;->b:Z

    iget-object v2, p0, Lwtd;->f:Ljava/lang/Object;

    iget-object v3, p0, Lwtd;->e:Ljava/lang/Object;

    iget-object v4, p0, Lwtd;->d:Ljava/lang/Object;

    iget-object v5, p0, Lwtd;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_e4

    check-cast v5, Le6e;

    move-object v8, v4

    check-cast v8, Lek6;

    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    move-object v11, v2

    check-cast v11, Le6g;

    move-object v7, p1

    check-cast v7, Lae5;

    iget-object p1, v5, Le6e;->a:Lpqh;

    iget-object p1, p1, Lpqh;->a:Ljava/lang/Object;

    const/4 v0, 0x0

    if-nez p1, :cond_26

    move-object p1, v0

    goto :goto_28

    :cond_26
    check-cast p1, Lmxb;

    :goto_28
    new-instance v6, Ld6e;

    iget-boolean v9, p0, Lwtd;->b:Z

    invoke-direct/range {v6 .. v11}, Ld6e;-><init>(Lae5;Lek6;ZLjava/lang/String;Le6g;)V

    iget-object p0, p1, Lmxb;->c:Lc37;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Lini;

    const-class p1, Lj7i;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p1

    invoke-virtual {p0, p1, v0, v6}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj7i;

    return-object p0

    :pswitch_42
    check-cast v5, Lkotlin/jvm/functions/Function0;

    check-cast v4, Lyhe;

    check-cast v3, Lg4i;

    check-cast v2, Lkotlin/jvm/functions/Function0;

    check-cast p1, Lm4i;

    iget-boolean p0, p1, Lm4i;->a:Z

    if-eqz p0, :cond_60

    const/4 p1, 0x1

    if-ne p0, p1, :cond_63

    if-eqz v1, :cond_5c

    iget-object p0, v4, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-virtual {p0, v3}, Lgjm;->b(Ln37;)Z

    :cond_5c
    invoke-interface {v2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_63

    :cond_60
    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_63
    :goto_63
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_66
    check-cast v5, Lcfe;

    iget-object p0, v5, Lcfe;->c:Lt0g;

    check-cast v4, Lafe;

    check-cast v3, Lw2m;

    check-cast v2, Lw2m;

    check-cast p1, Lm1i;

    const v0, 0x3f4ccccd    # 0.8f

    const/high16 v5, 0x3f800000    # 1.0f

    if-nez v1, :cond_86

    iget-object v6, v3, Lw2m;->h:Lt0g;

    invoke-virtual {v6}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->floatValue()F

    move-result v6

    goto :goto_95

    :cond_86
    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_94

    move v6, v5

    goto :goto_95

    :cond_94
    move v6, v0

    :goto_95
    invoke-virtual {p1, v6}, Lm1i;->g(F)V

    if-nez v1, :cond_a7

    iget-object v0, v3, Lw2m;->h:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    move-result v0

    goto :goto_b4

    :cond_a7
    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_b4

    move v0, v5

    :cond_b4
    :goto_b4
    invoke-virtual {p1, v0}, Lm1i;->h(F)V

    if-nez v1, :cond_c6

    iget-object p0, v2, Lw2m;->h:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    move-result v5

    goto :goto_d3

    :cond_c6
    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_d3

    const/4 v5, 0x0

    :cond_d3
    :goto_d3
    invoke-virtual {p1, v5}, Lm1i;->c(F)V

    invoke-interface {v4}, Liak;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La2m;

    iget-wide v0, p0, La2m;->a:J

    invoke-virtual {p1, v0, v1}, Lm1i;->r(J)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_e4
    .packed-switch 0x0
        :pswitch_66
        :pswitch_42
    .end packed-switch
.end method
