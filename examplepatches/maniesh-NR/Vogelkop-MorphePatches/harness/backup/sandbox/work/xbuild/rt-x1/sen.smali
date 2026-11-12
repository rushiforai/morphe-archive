.class public final Lsen;
.super Ljava/lang/Throwable;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Z


# direct methods
.method public constructor <init>(ILjava/lang/Throwable;Z)V
    .registers 5

    const-string v0, "error "

    invoke-static {p1, v0}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput p1, p0, Lsen;->a:I

    iput-boolean p3, p0, Lsen;->b:Z

    return-void
.end method
