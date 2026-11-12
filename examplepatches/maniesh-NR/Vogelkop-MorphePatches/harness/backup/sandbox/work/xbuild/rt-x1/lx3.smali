.class public abstract Llx3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    sput-object v0, Llx3;->a:Li7f;

    return-void
.end method

.method public static a(Ljava/lang/String;Z)V
    .registers 5

    new-instance v0, Lrl;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lrl;-><init>(B)V

    new-instance v1, Ljx3;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Ljx3;-><init>(Ljava/lang/String;Ljava/lang/Runnable;B)V

    invoke-static {p0, p1, v1}, LJ/N;->MO3$NI3G(Ljava/lang/Object;ZLjava/lang/Object;)V

    return-void
.end method
