.class public final Lqll;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lrll;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lrll;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqll;->a:Lrll;

    invoke-interface {p1}, Lrll;->getValue()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lqll;->b:Ljava/lang/Object;

    return-void
.end method
