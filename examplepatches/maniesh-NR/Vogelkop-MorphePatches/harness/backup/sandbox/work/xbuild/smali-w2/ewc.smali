.class public abstract Lewc;
.super Lja2;
.source "SourceFile"


# instance fields
.field public final b:Late;

.field public c:Lhwc;


# direct methods
.method public constructor <init>(Late;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lewc;->b:Late;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const/4 p0, 0x0

    return p0

    :cond_18
    check-cast p1, Lewc;

    iget-object p0, p0, Lewc;->b:Late;

    iget-object p1, p1, Lewc;->b:Late;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget-object p0, p0, Lewc;->b:Late;

    invoke-virtual {p0}, Late;->hashCode()I

    move-result p0

    return p0
.end method
