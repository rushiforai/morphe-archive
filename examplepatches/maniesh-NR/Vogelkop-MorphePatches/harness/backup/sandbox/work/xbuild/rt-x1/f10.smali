.class public final Lf10;
.super Ln00;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf10;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final c(Lyz;)Ljava/lang/String;
    .registers 2

    check-cast p1, Lw10;

    iget-object p0, p1, Lw10;->u:Lcie;

    iget-object p0, p0, Lcie;->q:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final f(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    const-string p0, ""

    return-object p0
.end method

.method public final g(Lyz;)Ljava/lang/CharSequence;
    .registers 2

    check-cast p1, Lw10;

    iget-object p0, p1, Lw10;->u:Lcie;

    iget-object p0, p0, Lcie;->r:Ljava/lang/String;

    sget-object p1, Laik;->a:[Ljava/lang/String;

    if-nez p0, :cond_c

    const-string p0, ""

    :cond_c
    return-object p0
.end method

.method public final h(Lyz;)Ljava/lang/CharSequence;
    .registers 4

    check-cast p1, Lw10;

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-object v0, p1, Lbzo;->d:Lw06;

    sget-object v1, Lw06;->f:Lw06;

    if-ne v0, v1, :cond_d

    const-string p0, ""

    return-object p0

    :cond_d
    iget-object p0, p0, Lf10;->a:Landroid/view/View;

    invoke-static {p1, p0}, Lg10;->o0(Lcie;Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method
