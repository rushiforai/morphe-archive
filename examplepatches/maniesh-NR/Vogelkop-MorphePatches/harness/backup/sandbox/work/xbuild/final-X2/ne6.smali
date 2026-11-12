.class public final Lne6;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lne6;->a:I

    iput-object p2, p0, Lne6;->b:Ljava/lang/String;

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

    if-eqz p1, :cond_18

    const-class v2, Lne6;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_18

    check-cast p1, Lne6;

    iget p1, p1, Lne6;->a:I

    iget p0, p0, Lne6;->a:I

    if-ne p0, p1, :cond_18

    return v0

    :cond_18
    return v1
.end method

.method public final hashCode()I
    .registers 1

    iget p0, p0, Lne6;->a:I

    return p0
.end method
