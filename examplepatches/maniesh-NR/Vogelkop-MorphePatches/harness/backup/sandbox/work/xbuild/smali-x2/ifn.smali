.class public final Lifn;
.super Ljava/lang/Throwable;
.source "SourceFile"


# instance fields
.field public final a:Lhfn;

.field public final b:Z


# direct methods
.method public constructor <init>(Lhfn;Ljava/lang/Throwable;Z)V
    .registers 5

    iget-object v0, p1, Lhfn;->b:Ljava/lang/String;

    invoke-direct {p0, v0, p2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object p1, p0, Lifn;->a:Lhfn;

    iput-boolean p3, p0, Lifn;->b:Z

    return-void
.end method
