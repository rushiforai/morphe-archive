.class public abstract Lphf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lx79;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lx79;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lmhk;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Lmhk;-><init>(B)V

    iput-object v1, v0, Lx79;->b:Ljava/lang/Object;

    new-instance v1, Ltfp;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Lx79;->c:Ljava/lang/Object;

    sput-object v0, Lphf;->a:Lx79;

    return-void
.end method
