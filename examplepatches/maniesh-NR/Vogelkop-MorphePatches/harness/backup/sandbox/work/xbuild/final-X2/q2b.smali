.class public final Lq2b;
.super Ll7n;
.source "SourceFile"


# instance fields
.field public final b:Lu2b;

.field public final c:Lpde;


# direct methods
.method public constructor <init>(Lu2b;)V
    .registers 3

    invoke-direct {p0}, Ll7n;-><init>()V

    iput-object p1, p0, Lq2b;->b:Lu2b;

    new-instance p1, Lpde;

    sget-object v0, Ln3b;->d:Ln3b;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lq2b;->c:Lpde;

    return-void
.end method
