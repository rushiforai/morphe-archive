.class public final Lmam;
.super Lqyn;
.source "SourceFile"


# instance fields
.field public final j:Lbhi;

.field public final k:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lbhi;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmam;->j:Lbhi;

    iput-object p2, p0, Lmam;->k:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final S(I)V
    .registers 5

    sget-object v0, Lt0i;->b:Lp0i;

    new-instance v0, Llv0;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Loading of \'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lmam;->k:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\' font failed with "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " error code"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    iget-object p0, p0, Lmam;->j:Lbhi;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public final T(Landroid/graphics/Typeface;)V
    .registers 3

    sget-object v0, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lmam;->j:Lbhi;

    invoke-virtual {p0, p1}, Lbhi;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method
