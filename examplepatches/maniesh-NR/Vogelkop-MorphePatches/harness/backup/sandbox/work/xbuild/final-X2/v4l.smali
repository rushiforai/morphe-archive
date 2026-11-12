.class public final Lv4l;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final d:Lv4l;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Z

.field public final c:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lv4l;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lv4l;-><init>(Ljava/lang/String;ZZ)V

    sput-object v0, Lv4l;->d:Lv4l;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZZ)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv4l;->a:Ljava/lang/String;

    iput-boolean p2, p0, Lv4l;->b:Z

    iput-boolean p3, p0, Lv4l;->c:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_20

    instance-of v0, p1, Lv4l;

    if-eqz v0, :cond_1e

    check-cast p1, Lv4l;

    iget-object v0, p0, Lv4l;->a:Ljava/lang/String;

    iget-object v1, p1, Lv4l;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-boolean v0, p0, Lv4l;->b:Z

    iget-boolean v1, p1, Lv4l;->b:Z

    if-ne v0, v1, :cond_1e

    iget-boolean p0, p0, Lv4l;->c:Z

    iget-boolean p1, p1, Lv4l;->c:Z

    if-eq p0, p1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return p0

    :cond_20
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lv4l;->a:Ljava/lang/String;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_a

    :cond_6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_a
    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-boolean v2, p0, Lv4l;->b:Z

    invoke-static {v0, v1, v2}, Lfki;->k(IIZ)I

    move-result v0

    iget-boolean p0, p0, Lv4l;->c:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
