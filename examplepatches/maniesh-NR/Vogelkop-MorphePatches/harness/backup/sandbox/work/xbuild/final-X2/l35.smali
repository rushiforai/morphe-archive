.class public final Ll35;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lid;


# instance fields
.field public final synthetic a:B

.field public final b:Lfd;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Ldt3;Lkze;Lfd;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Ll35;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ll35;->c:Ljava/lang/Object;

    iput-object p3, p0, Ll35;->d:Ljava/lang/Object;

    iput-object p4, p0, Ll35;->b:Lfd;

    new-instance p2, Ltu7;

    const/16 p4, 0x1d

    invoke-direct {p2, p0, p4}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    invoke-direct {p0, p2, p4}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lfd;Lzu3;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Ll35;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Ll35;->c:Ljava/lang/Object;

    .line 30
    iput-object p2, p0, Ll35;->b:Lfd;

    .line 31
    iput-object p3, p0, Ll35;->d:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Lyk5;Lpc;)Ljf;
    .registers 15

    iget-byte v0, p0, Ll35;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_a0

    iget-boolean v0, p1, Lyk5;->d:Z

    iget-object v2, p0, Ll35;->c:Ljava/lang/Object;

    check-cast v2, Ldt3;

    iget-object v2, v2, Ldt3;->b:Ljt3;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v4, 0x5

    iget-object v5, p0, Ll35;->b:Lfd;

    if-eq v3, v4, :cond_53

    const/16 v4, 0x1c

    if-ne v3, v4, :cond_7e

    iget-object v2, v2, Ljt3;->h:Lb2l;

    if-eqz v2, :cond_7e

    sget-object v3, Lpc;->m:Lpc;

    invoke-virtual {v5, v3}, Lfd;->b(Lpc;)Z

    move-result v10

    if-nez v0, :cond_35

    invoke-virtual {p0, v2}, Ll35;->b(Lb2l;)Z

    move-result p0

    if-eqz p0, :cond_35

    sget-object p0, Lpc;->h:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object p0

    :goto_33
    move-object v6, p0

    goto :goto_47

    :cond_35
    iget-boolean p0, p1, Lyk5;->c:Z

    if-nez p0, :cond_40

    if-eqz v10, :cond_40

    invoke-virtual {v5, v3, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object p0

    goto :goto_33

    :cond_40
    sget-object p0, Lpc;->i:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object p0

    goto :goto_33

    :goto_47
    if-eqz v6, :cond_7e

    const/4 v9, 0x0

    const/16 v11, 0x1f

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v6 .. v11}, Ljf;->a(Ljf;Lg9;Lxc;Lpc;ZI)Ljf;

    move-result-object v1

    goto :goto_7e

    :cond_53
    iget-object v2, v2, Ljt3;->h:Lb2l;

    if-eqz v2, :cond_7e

    iget-boolean p1, p1, Lyk5;->a:Z

    if-ne v0, p1, :cond_6f

    invoke-virtual {p0, v2}, Ll35;->b(Lb2l;)Z

    move-result p0

    if-eqz p0, :cond_68

    sget-object p0, Lpc;->h:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v1

    goto :goto_7e

    :cond_68
    sget-object p0, Lpc;->j:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v1

    goto :goto_7e

    :cond_6f
    if-eqz v0, :cond_78

    sget-object p0, Lpc;->j:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v1

    goto :goto_7e

    :cond_78
    sget-object p0, Lpc;->h:Lpc;

    invoke-virtual {v5, p0, p2}, Lfd;->f(Lpc;Lpc;)Ljf;

    move-result-object v1

    :cond_7e
    :goto_7e
    return-object v1

    :pswitch_7f
    sget-object p1, Lk35;->a:[I

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    aget p1, p1, p2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_9f

    new-instance v2, Ljf;

    new-instance v3, Lj35;

    const/4 p1, 0x0

    invoke-direct {v3, p0, p1}, Lj35;-><init>(Ll35;B)V

    new-instance v4, Lj35;

    invoke-direct {v4, p0, p2}, Lj35;-><init>(Ll35;B)V

    const/4 v6, 0x0

    const/16 v7, 0x3c

    const/4 v5, 0x0

    invoke-direct/range {v2 .. v7}, Ljf;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;ZZI)V

    move-object v1, v2

    :cond_9f
    return-object v1

    :pswitch_data_a0
    .packed-switch 0x0
        :pswitch_7f
    .end packed-switch
.end method

.method public final b(Lb2l;)Z
    .registers 3

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->m()Z

    move-result p1

    if-nez p1, :cond_20

    iget-object p0, p0, Ll35;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-nez p0, :cond_22

    :cond_20
    const/4 p0, 0x0

    return p0

    :cond_22
    const/4 p0, 0x1

    return p0
.end method
