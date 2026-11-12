.class public abstract Lrw1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Low1;->g:Low1;

    sget-object v1, Low1;->j:Low1;

    filled-new-array {v0, v1}, [Low1;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lrw1;->a:Ljava/util/List;

    return-void
.end method
