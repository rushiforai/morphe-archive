.class public final Ltse;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lij0;

.field public final b:Ll0c;


# direct methods
.method public constructor <init>(Lij0;Ll0c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltse;->a:Lij0;

    iput-object p2, p0, Ltse;->b:Ll0c;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p0, p1, :cond_1b

    instance-of v0, p1, Ltse;

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    check-cast p1, Ltse;

    iget-object v0, p0, Ltse;->a:Lij0;

    iget-object v2, p1, Ltse;->a:Lij0;

    if-eq v0, v2, :cond_10

    return v1

    :cond_10
    iget-object p0, p0, Ltse;->b:Ll0c;

    iget-object p1, p1, Ltse;->b:Ll0c;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1b

    :cond_1a
    return v1

    :cond_1b
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Ltse;->a:Lij0;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Ltse;->b:Ll0c;

    invoke-virtual {p0}, Ll0c;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
