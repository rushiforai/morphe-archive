.class public final Lcca;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lyl2;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcca;->a:Ljava/lang/String;

    iput p3, p0, Lcca;->c:I

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_14

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcca;->b:Ljava/lang/String;

    return-void

    :cond_14
    invoke-static {p2}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_29

    invoke-static {p2}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcca;->b:Ljava/lang/String;

    return-void

    :cond_29
    iput-object p1, p0, Lcca;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/CharSequence;
    .registers 1

    iget-object p0, p0, Lcca;->b:Ljava/lang/String;

    return-object p0
.end method

.method public final f()F
    .registers 1

    iget p0, p0, Lcca;->c:I

    int-to-float p0, p0

    return p0
.end method

.method public final g(Ljava/lang/String;)Z
    .registers 4

    iget-object p0, p0, Lcca;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eq v0, v1, :cond_14

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcca;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final j(Ljava/lang/String;)Z
    .registers 2

    iget-object p0, p0, Lcca;->b:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
