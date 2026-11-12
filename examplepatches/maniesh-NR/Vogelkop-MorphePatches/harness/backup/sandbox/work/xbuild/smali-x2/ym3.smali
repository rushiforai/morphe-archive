.class public final Lym3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lml3;

.field public final b:Landroid/util/SparseArray;


# direct methods
.method public constructor <init>(Lml3;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lym3;->b:Landroid/util/SparseArray;

    iput-object p1, p0, Lym3;->a:Lml3;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p0, p1, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_4
    instance-of v0, p1, Lym3;

    if-nez v0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    check-cast p1, Lym3;

    iget-object p0, p0, Lym3;->a:Lml3;

    iget-object p1, p1, Lym3;->a:Lml3;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lym3;->a:Lml3;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method
