.class public final Lpnj;
.super Lonj;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Llnj;

.field public final c:Lkotlin/jvm/functions/Function1;


# direct methods
.method public constructor <init>(Ljava/lang/String;Llnj;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpnj;->a:Ljava/lang/String;

    iput-object p2, p0, Lpnj;->b:Llnj;

    iput-object p3, p0, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_28

    instance-of v0, p1, Lpnj;

    if-eqz v0, :cond_26

    check-cast p1, Lpnj;

    iget-object v0, p0, Lpnj;->a:Ljava/lang/String;

    iget-object v1, p1, Lpnj;->a:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Lpnj;->b:Llnj;

    iget-object v1, p1, Lpnj;->b:Llnj;

    invoke-virtual {v0, v1}, Llnj;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object p0, p0, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    iget-object p1, p1, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_28

    :cond_26
    const/4 p0, 0x0

    return p0

    :cond_28
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lpnj;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lpnj;->b:Llnj;

    invoke-virtual {v1}, Llnj;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-object p0, p0, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    if-nez p0, :cond_17

    const/4 p0, 0x0

    goto :goto_1b

    :cond_17
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_1b
    add-int/2addr v1, p0

    return v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
