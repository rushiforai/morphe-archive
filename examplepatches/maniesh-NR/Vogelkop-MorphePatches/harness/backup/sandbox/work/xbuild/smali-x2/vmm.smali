.class public final Lvmm;
.super Ls1g;
.source "SourceFile"


# instance fields
.field public final c:Lh1b;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcsh;)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2, v0, v1}, Ls1g;-><init>(Ljava/lang/String;Ljava/lang/Exception;ZI)V

    invoke-static {p2}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p1

    iput-object p1, p0, Lvmm;->c:Lh1b;

    return-void
.end method


# virtual methods
.method public final getMessage()Ljava/lang/String;
    .registers 3

    invoke-super {p0}, Ls1g;->getMessage()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lvmm;->c:Lh1b;

    invoke-virtual {p0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d

    return-object v0

    :cond_d
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "\nsniff failures: "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
