.class public final Lqth;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmth;


# instance fields
.field public final a:Lh7f;

.field public final b:Lpth;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqth;->a:Lh7f;

    new-instance v0, Lpth;

    invoke-direct {v0, p0}, Lpth;-><init>(Lqth;)V

    iput-object v0, p0, Lqth;->b:Lpth;

    return-void
.end method
