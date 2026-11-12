.class public abstract Llze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Lt7j;

.field public b:Z


# direct methods
.method public constructor <init>(Lt7j;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llze;->a:Lt7j;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Llze;->b:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x0

    iput-boolean v0, p0, Llze;->b:Z

    iget-object v0, p0, Llze;->a:Lt7j;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    :cond_c
    return-void
.end method

.method public abstract b(Ljava/lang/Object;)V
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 2

    if-nez p1, :cond_6

    const/4 p1, 0x1

    iput-boolean p1, p0, Llze;->b:Z

    return-void

    :cond_6
    invoke-virtual {p0, p1}, Llze;->b(Ljava/lang/Object;)V

    return-void
.end method
