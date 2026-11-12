.class public final Lp65;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljh;


# direct methods
.method public constructor <init>(ZLr65;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljh;

    iget-object p2, p2, Lr65;->d:Lwv1;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, v0, Ljh;->a:Z

    iput-object p2, v0, Ljh;->c:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, v0, Ljh;->b:Z

    iput-object v0, p0, Lp65;->a:Ljh;

    return-void
.end method
