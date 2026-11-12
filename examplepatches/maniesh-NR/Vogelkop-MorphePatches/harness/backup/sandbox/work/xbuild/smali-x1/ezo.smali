.class public abstract Lezo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;

.field public static final b:Lygo;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "omsdk_v1.js"

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lezo;->a:Ljava/util/List;

    new-instance v0, Lygo;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lygo;-><init>(B)V

    sput-object v0, Lezo;->b:Lygo;

    return-void
.end method

.method public static a()V
    .registers 3

    sget-object v0, Lezo;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_6
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lgxo;->c:Lgxo;

    const/4 v2, 0x2

    invoke-static {v2, v1}, Lsjo;->c(ILjava/lang/String;)Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    goto :goto_6

    :cond_25
    return-void
.end method
