.class public final Li78;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lh78;

.field public final b:Lm78;

.field public final c:Z


# direct methods
.method public constructor <init>(Lh78;Lm78;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li78;->a:Lh78;

    iput-object p2, p0, Li78;->b:Lm78;

    iput-boolean p3, p0, Li78;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Li78;

    if-eqz v0, :cond_22

    check-cast p1, Li78;

    iget-object v0, p0, Li78;->a:Lh78;

    iget-object v1, p1, Li78;->a:Lh78;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-object v0, p0, Li78;->b:Lm78;

    iget-object v1, p1, Li78;->b:Lm78;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-boolean p0, p0, Li78;->c:Z

    iget-boolean p1, p1, Li78;->c:Z

    if-eq p0, p1, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Li78;->a:Lh78;

    invoke-virtual {v0}, Lh78;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Li78;->b:Lm78;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    add-int/2addr v1, v0

    mul-int/lit8 v1, v1, 0x1f

    iget-boolean p0, p0, Li78;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
