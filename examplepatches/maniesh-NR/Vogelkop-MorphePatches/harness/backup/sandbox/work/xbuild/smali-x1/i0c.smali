.class public final Li0c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lszb;

.field public final b:I


# direct methods
.method public constructor <init>(Lszb;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li0c;->a:Lszb;

    iput p2, p0, Li0c;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    if-eqz p1, :cond_1c

    const-class v0, Li0c;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_1c

    check-cast p1, Li0c;

    iget-object v0, p0, Li0c;->a:Lszb;

    iget-object v1, p1, Li0c;->a:Lszb;

    if-ne v0, v1, :cond_1c

    iget p0, p0, Li0c;->b:I

    iget p1, p1, Li0c;->b:I

    if-ne p0, p1, :cond_1c

    :cond_1a
    const/4 p0, 0x1

    return p0

    :cond_1c
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Li0c;->a:Lszb;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Li0c;->b:I

    add-int/2addr v0, p0

    return v0
.end method
