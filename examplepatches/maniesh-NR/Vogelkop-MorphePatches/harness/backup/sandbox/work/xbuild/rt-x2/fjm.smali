.class public final Lfjm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Loje;

.field public final b:Ldjm;


# direct methods
.method public constructor <init>(Loje;Ldjm;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfjm;->a:Loje;

    iput-object p2, p0, Lfjm;->b:Ldjm;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    instance-of v0, p1, Lfjm;

    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    iget-object p0, p0, Lfjm;->a:Loje;

    iget-object p0, p0, Loje;->a:Ljava/lang/String;

    check-cast p1, Lfjm;

    iget-object p1, p1, Lfjm;->a:Loje;

    iget-object p1, p1, Loje;->a:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lfjm;->a:Loje;

    iget-object p0, p0, Loje;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method
