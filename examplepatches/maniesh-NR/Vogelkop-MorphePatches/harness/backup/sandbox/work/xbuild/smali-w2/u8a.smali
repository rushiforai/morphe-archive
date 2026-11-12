.class public final Lu8a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lm4l;

.field public final b:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lm4l;->Companion:Ll4l;

    return-void
.end method

.method public constructor <init>(Lm4l;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu8a;->a:Lm4l;

    iput p2, p0, Lu8a;->b:I

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_1a

    instance-of v0, p1, Lu8a;

    if-eqz v0, :cond_18

    check-cast p1, Lu8a;

    iget-object v0, p0, Lu8a;->a:Lm4l;

    iget-object v1, p1, Lu8a;->a:Lm4l;

    invoke-virtual {v0, v1}, Lm4l;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget p0, p0, Lu8a;->b:I

    iget p1, p1, Lu8a;->b:I

    if-eq p0, p1, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lu8a;->a:Lm4l;

    invoke-virtual {v0}, Lm4l;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lu8a;->b:I

    invoke-static {p0}, Ljava/lang/Integer;->hashCode(I)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
