.class public final La8l;
.super Lb8l;
.source "SourceFile"


# instance fields
.field public final a:Lm7l;


# direct methods
.method public constructor <init>(Lm7l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La8l;->a:Lm7l;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, La8l;

    if-eqz v0, :cond_12

    check-cast p1, La8l;

    iget-object p0, p0, La8l;->a:Lm7l;

    iget-object p1, p1, La8l;->a:Lm7l;

    invoke-virtual {p0, p1}, Lm7l;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_14

    :cond_12
    const/4 p0, 0x0

    return p0

    :cond_14
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, La8l;->a:Lm7l;

    invoke-virtual {p0}, Lm7l;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
