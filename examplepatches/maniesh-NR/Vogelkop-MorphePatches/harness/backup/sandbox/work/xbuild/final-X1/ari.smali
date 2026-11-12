.class public final Lari;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyl2;


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lari;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final d()Ljava/lang/CharSequence;
    .registers 1

    iget-object p0, p0, Lari;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final f()F
    .registers 1

    const/high16 p0, 0x3e800000    # 0.25f

    return p0
.end method

.method public final g(Ljava/lang/String;)Z
    .registers 5

    iget-object p0, p0, Lari;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_15

    invoke-static {p0, p1, v2}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_15

    const/4 p0, 0x1

    return p0

    :cond_15
    return v2
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lari;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final j(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Lari;->a:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
