.class public final synthetic Landroidx/activity/u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La0/a;
.implements Ljava/io/Serializable;


# instance fields
.field public transient a:Landroidx/activity/u;

.field public final b:Ljava/lang/Object;

.field public final c:Z

.field public final d:I

.field public final synthetic e:I


# direct methods
.method public constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Landroidx/activity/u;->e:I

    const/4 p1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Landroidx/activity/u;->b:Ljava/lang/Object;

    iput-boolean p1, p0, Landroidx/activity/u;->c:Z

    iput p1, p0, Landroidx/activity/u;->d:I

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 1

    iget v0, p0, Landroidx/activity/u;->e:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Landroidx/activity/u;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/v;

    invoke-virtual {v0}, Landroidx/activity/v;->c()V

    sget-object v0, LU/c;->c:LU/c;

    return-object v0

    :pswitch_0
    iget-object v0, p0, Landroidx/activity/u;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/activity/v;

    invoke-virtual {v0}, Landroidx/activity/v;->c()V

    sget-object v0, LU/c;->c:LU/c;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b()Lb0/a;
    .locals 2

    iget-boolean v0, p0, Landroidx/activity/u;->c:Z

    if-eqz v0, :cond_0

    sget-object v0, Lb0/f;->a:Lb0/g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lb0/e;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    return-object v0

    :cond_0
    sget-object v0, Lb0/f;->a:Lb0/g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lb0/b;

    const-class v1, Landroidx/activity/v;

    invoke-direct {v0, v1}, Lb0/b;-><init>(Ljava/lang/Class;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    if-ne p1, p0, :cond_0

    goto :goto_0

    :cond_0
    instance-of v0, p1, Landroidx/activity/u;

    if-eqz v0, :cond_1

    check-cast p1, Landroidx/activity/u;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Landroidx/activity/u;->d:I

    iget v1, p1, Landroidx/activity/u;->d:I

    if-ne v0, v1, :cond_3

    iget-object v0, p0, Landroidx/activity/u;->b:Ljava/lang/Object;

    iget-object v1, p1, Landroidx/activity/u;->b:Ljava/lang/Object;

    invoke-static {v0, v1}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Landroidx/activity/u;->b()Lb0/a;

    move-result-object v0

    invoke-virtual {p1}, Landroidx/activity/u;->b()Lb0/a;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    instance-of v0, p1, Landroidx/activity/u;

    if-eqz v0, :cond_3

    iget-object v0, p0, Landroidx/activity/u;->a:Landroidx/activity/u;

    if-nez v0, :cond_2

    sget-object v0, Lb0/f;->a:Lb0/g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p0, p0, Landroidx/activity/u;->a:Landroidx/activity/u;

    move-object v0, p0

    :cond_2
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public final hashCode()I
    .locals 2

    invoke-virtual {p0}, Landroidx/activity/u;->b()Lb0/a;

    invoke-virtual {p0}, Landroidx/activity/u;->b()Lb0/a;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    const v1, 0x3ad06176

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    const v1, 0x3f7e3e3f    # 0.9931373f

    add-int/2addr v0, v1

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Landroidx/activity/u;->a:Landroidx/activity/u;

    if-nez v0, :cond_0

    sget-object v0, Lb0/f;->a:Lb0/g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p0, p0, Landroidx/activity/u;->a:Landroidx/activity/u;

    move-object v0, p0

    :cond_0
    if-eq v0, p0, :cond_1

    invoke-virtual {v0}, Landroidx/activity/u;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "function updateEnabledCallbacks (Kotlin reflection is not available)"

    return-object v0
.end method
