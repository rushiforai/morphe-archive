.class public abstract Letg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lnx1;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnx1;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lnx1;-><init>(B)V

    sput-object v0, Letg;->a:Lnx1;

    return-void
.end method

.method public static a(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    sget-object v0, Letg;->a:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lctg;

    if-eqz p0, :cond_d

    iget-object p0, p0, Lctg;->d:Ljava/lang/String;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static b(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    sget-object v0, Letg;->a:Lnx1;

    invoke-virtual {v0, p0}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lctg;

    if-eqz p0, :cond_d

    iget-object p0, p0, Lctg;->a:Ljava/lang/String;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method
