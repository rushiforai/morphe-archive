.class public final Ll0a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Lv08;

.field public final c:Ll08;


# direct methods
.method public constructor <init>(ZLv08;Ll08;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll0a;->a:Z

    iput-object p2, p0, Ll0a;->b:Lv08;

    iput-object p3, p0, Ll0a;->c:Ll08;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ll0a;

    if-eqz v1, :cond_24

    check-cast p1, Ll0a;

    iget-boolean v1, p0, Ll0a;->a:Z

    iget-boolean v2, p1, Ll0a;->a:Z

    if-ne v1, v2, :cond_24

    iget-object v1, p0, Ll0a;->b:Lv08;

    iget-object v2, p1, Ll0a;->b:Lv08;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_24

    iget-object p0, p0, Ll0a;->c:Ll08;

    iget-object p1, p1, Ll0a;->c:Ll08;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    return v0
.end method

.method public final hashCode()I
    .registers 3

    iget-boolean v0, p0, Ll0a;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const v1, 0x12b960

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    add-int/lit16 v0, v0, 0x4d5

    iget-object v1, p0, Ll0a;->b:Lv08;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    mul-int/lit16 v0, v0, 0x3c1

    iget-object p0, p0, Ll0a;->c:Ll08;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x1

    add-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    mul-int/lit8 p0, p0, 0x1f

    add-int/lit16 p0, p0, 0x4d5

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
