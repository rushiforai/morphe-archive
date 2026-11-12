.class public final Lw9g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Llag;


# direct methods
.method public constructor <init>(Ljava/lang/String;Llag;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw9g;->a:Ljava/lang/String;

    iput-object p2, p0, Lw9g;->b:Llag;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_22

    const-class v2, Lw9g;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_22

    check-cast p1, Lw9g;

    iget-object v2, p0, Lw9g;->a:Ljava/lang/String;

    iget-object v3, p1, Lw9g;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_22

    iget-object p0, p0, Lw9g;->b:Llag;

    iget-object p1, p1, Lw9g;->b:Llag;

    if-ne p0, p1, :cond_22

    return v0

    :cond_22
    return v1
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lw9g;->a:Ljava/lang/String;

    iget-object p0, p0, Lw9g;->b:Llag;

    filled-new-array {v0, p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
