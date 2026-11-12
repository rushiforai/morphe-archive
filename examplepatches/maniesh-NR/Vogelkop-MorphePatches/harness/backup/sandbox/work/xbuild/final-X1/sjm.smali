.class public abstract Lsjm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:Lqjm;


# instance fields
.field public final a:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lqjm;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lsjm;-><init>(Z)V

    sput-object v0, Lsjm;->b:Lqjm;

    return-void
.end method

.method public constructor <init>(Z)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lsjm;->a:Z

    return-void
.end method


# virtual methods
.method public a()Z
    .registers 1

    iget-boolean p0, p0, Lsjm;->a:Z

    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_16

    if-eqz p1, :cond_18

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-ne v0, v1, :cond_18

    check-cast p1, Lsjm;

    iget-boolean p0, p0, Lsjm;->a:Z

    iget-boolean p1, p1, Lsjm;->a:Z

    if-ne p0, p1, :cond_18

    :cond_16
    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public hashCode()I
    .registers 1

    iget-boolean p0, p0, Lsjm;->a:Z

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method
