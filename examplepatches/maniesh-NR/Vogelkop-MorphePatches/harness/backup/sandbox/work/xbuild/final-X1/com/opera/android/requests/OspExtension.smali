.class public final Lcom/opera/android/requests/OspExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Lcom/opera/android/requests/OspExtension;


# instance fields
.field public final a:Lhd;

.field public final b:Lydn;


# direct methods
.method public constructor <init>(Lhd;Lydn;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/requests/OspExtension;->a:Lhd;

    iput-object p2, p0, Lcom/opera/android/requests/OspExtension;->b:Lydn;

    sput-object p0, Lcom/opera/android/requests/OspExtension;->c:Lcom/opera/android/requests/OspExtension;

    return-void
.end method

.method public static a(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-lez v0, :cond_20

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_20

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_20
    const/4 p0, 0x0

    return-object p0
.end method

.method public static increment(Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/requests/OspExtension;->c:Lcom/opera/android/requests/OspExtension;

    if-eqz v0, :cond_43

    iget-object v1, v0, Lcom/opera/android/requests/OspExtension;->a:Lhd;

    iget-object v0, v0, Lcom/opera/android/requests/OspExtension;->b:Lydn;

    iget-object v2, v0, Lydn;->d:Lvdn;

    iget-boolean v3, v2, Lvdn;->a:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_15

    invoke-virtual {v2}, Lvdn;->a()Z

    move-result v2

    if-nez v2, :cond_17

    :cond_15
    move p0, v4

    goto :goto_1b

    :cond_17
    invoke-virtual {v0, p0}, Lydn;->t(Ljava/lang/String;)Z

    move-result p0

    :goto_1b
    if-eqz p0, :cond_43

    invoke-static {p1}, Lcom/opera/android/requests/OspExtension;->a(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_43

    aget-object p1, p0, v4

    const-string v0, "paywall_on"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_34

    aget-object p0, p0, v0

    invoke-virtual {v1, p0, v4}, Lhd;->r(Ljava/lang/String;Z)V

    return-void

    :cond_34
    aget-object p1, p0, v4

    const-string v2, "paywall_off"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_43

    aget-object p0, p0, v0

    invoke-virtual {v1, p0, v0}, Lhd;->r(Ljava/lang/String;Z)V

    :cond_43
    return-void
.end method

.method public static log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/opera/android/requests/OspExtension;->c:Lcom/opera/android/requests/OspExtension;

    if-eqz v0, :cond_4d

    iget-object v1, v0, Lcom/opera/android/requests/OspExtension;->b:Lydn;

    iget-object v2, v1, Lydn;->d:Lvdn;

    iget-boolean v3, v2, Lvdn;->a:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_13

    invoke-virtual {v2}, Lvdn;->a()Z

    move-result v2

    if-nez v2, :cond_15

    :cond_13
    move p0, v4

    goto :goto_19

    :cond_15
    invoke-virtual {v1, p0}, Lydn;->t(Ljava/lang/String;)Z

    move-result p0

    :goto_19
    if-eqz p0, :cond_4d

    invoke-static {p1}, Lcom/opera/android/requests/OspExtension;->a(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_4d

    iget-object p1, v0, Lcom/opera/android/requests/OspExtension;->a:Lhd;

    const/4 v0, 0x0

    aget-object v0, p0, v0

    aget-object p0, p0, v4

    iget-boolean v1, p1, Lhd;->b:Z

    if-eqz v1, :cond_4d

    iget-object v1, p1, Lhd;->d:Ljava/lang/Object;

    check-cast v1, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v2

    new-instance v3, Lbk0;

    invoke-direct {v3, v1, v2}, Lbk0;-><init>(Ln9a;Lw56;)V

    new-instance v1, Le5f;

    const/16 v4, 0x9

    invoke-direct {v1, p0, p2, v4}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-virtual {v3, v0, v1}, Lbk0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object p0, p1, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lmgh;

    invoke-virtual {p0, v2}, Lmgh;->c(Ljf0;)Z

    move-result p0

    if-eqz p0, :cond_4e

    :cond_4d
    return-void

    :cond_4e
    iget-object p0, p1, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance p2, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p2, v0, p0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p0, Lo5f;

    const/16 v0, 0x12

    invoke-direct {p0, p1, v0}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    iget-object p1, p1, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Lqie;

    invoke-virtual {p0, p1}, Lplk;->m(Lqie;)Lp1j;

    return-void
.end method
