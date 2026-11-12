.class public final Ln1c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/LinkedHashSet;

.field public final b:Ll0c;

.field public final c:Z


# direct methods
.method public constructor <init>(Ljava/util/LinkedHashSet;Ll0c;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln1c;->a:Ljava/util/LinkedHashSet;

    iput-object p2, p0, Ln1c;->b:Ll0c;

    iput-boolean p3, p0, Ln1c;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    instance-of v0, p1, Ln1c;

    if-eqz v0, :cond_27

    check-cast p1, Ln1c;

    iget-object v0, p1, Ln1c;->b:Ll0c;

    iget-object v1, p0, Ln1c;->a:Ljava/util/LinkedHashSet;

    iget-object v2, p1, Ln1c;->a:Ljava/util/LinkedHashSet;

    invoke-interface {v1, v2}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object v1, p0, Ln1c;->b:Ll0c;

    if-nez v1, :cond_19

    if-eqz v0, :cond_1f

    goto :goto_27

    :cond_19
    invoke-virtual {v1, v0}, Ll0c;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    :cond_1f
    iget-boolean p0, p0, Ln1c;->c:Z

    iget-boolean p1, p1, Ln1c;->c:Z

    if-ne p0, p1, :cond_27

    const/4 p0, 0x1

    return p0

    :cond_27
    :goto_27
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Ln1c;->a:Ljava/util/LinkedHashSet;

    invoke-interface {v0}, Ljava/util/Set;->hashCode()I

    move-result v0

    iget-object v1, p0, Ln1c;->b:Ll0c;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Ll0c;->hashCode()I

    move-result v1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    add-int/2addr v0, v1

    iget-boolean p0, p0, Ln1c;->c:Z

    add-int/2addr v0, p0

    return v0
.end method
