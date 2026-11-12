.class public final Ljt5;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lkotlin/text/Regex;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lkotlin/text/Regex;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljt5;->a:Lkotlin/text/Regex;

    iput-object p2, p0, Ljt5;->b:Ljava/lang/String;

    iput-object p3, p0, Ljt5;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_25

    instance-of v0, p1, Ljt5;

    const/4 v1, 0x0

    if-eqz v0, :cond_24

    check-cast p1, Ljt5;

    iget-object v0, p0, Ljt5;->a:Lkotlin/text/Regex;

    iget-object v2, p1, Ljt5;->a:Lkotlin/text/Regex;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object v0, p0, Ljt5;->b:Ljava/lang/String;

    iget-object v2, p1, Ljt5;->b:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object p0, p0, Ljt5;->c:Ljava/lang/String;

    iget-object p1, p1, Ljt5;->c:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_25

    :cond_24
    return v1

    :cond_25
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Ljt5;->a:Lkotlin/text/Regex;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Ljt5;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Ljt5;->c:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
