.class public final Ld0d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lv3g;


# direct methods
.method public constructor <init>(Lv3g;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld0d;->a:Lv3g;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_14

    instance-of v0, p1, Ld0d;

    if-eqz v0, :cond_12

    check-cast p1, Ld0d;

    iget-object p0, p0, Ld0d;->a:Lv3g;

    iget-object p1, p1, Ld0d;->a:Lv3g;

    invoke-virtual {p0, p1}, Lv3g;->equals(Ljava/lang/Object;)Z

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

    iget-object p0, p0, Ld0d;->a:Lv3g;

    invoke-virtual {p0}, Lv3g;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
