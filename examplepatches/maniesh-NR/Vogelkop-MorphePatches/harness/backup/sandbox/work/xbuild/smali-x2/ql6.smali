.class public final Lql6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Leq6;


# direct methods
.method public constructor <init>(Leq6;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lql6;->a:Leq6;

    return-void
.end method


# virtual methods
.method public final a()Landroid/net/Uri;
    .registers 3

    iget-object p0, p0, Lql6;->a:Leq6;

    iget-object p0, p0, Leq6;->a:Ljava/lang/Object;

    check-cast p0, Ljv1;

    invoke-virtual {p0}, Ljv1;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc3j;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    if-eqz p0, :cond_25

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_25

    const-string v0, "https://"

    const-string v1, "/"

    invoke-static {v0, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_29

    :cond_25
    sget-object p0, Lu88;->a:[Lu88;

    const-string p0, "https://esim.operacdn.com/"

    :goto_29
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method
