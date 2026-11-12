.class public abstract Ld17;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:S

.field public b:Z

.field public final c:Lig;


# direct methods
.method public constructor <init>(J)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lig;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lig;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ld17;->c:Lig;

    long-to-int p1, p1

    iput-short p1, p0, Ld17;->a:S

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Ld17;->b:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Ld17;->b:Z

    iget-object p0, p0, Ld17;->c:Lig;

    invoke-static {p0}, Lvml;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public abstract b()V
.end method

.method public final c()V
    .registers 1

    invoke-virtual {p0}, Ld17;->a()V

    invoke-virtual {p0}, Ld17;->b()V

    return-void
.end method

.method public final d()V
    .registers 3

    iget-boolean v0, p0, Ld17;->b:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Ld17;->b:Z

    iget-short v0, p0, Ld17;->a:S

    int-to-long v0, v0

    iget-object p0, p0, Ld17;->c:Lig;

    invoke-static {p0, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    return-void
.end method
