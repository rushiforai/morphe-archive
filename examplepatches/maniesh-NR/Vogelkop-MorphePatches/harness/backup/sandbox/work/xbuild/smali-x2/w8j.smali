.class public final synthetic Lw8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljk7;

.field public final synthetic c:Lj9j;

.field public final synthetic d:Lc9j;

.field public final synthetic e:Lj87;

.field public final synthetic f:Ly8j;

.field public final synthetic g:Lu8j;


# direct methods
.method public synthetic constructor <init>(JLjk7;Lj9j;Lc9j;Lj87;Ly8j;Lu8j;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lw8j;->a:J

    iput-object p3, p0, Lw8j;->b:Ljk7;

    iput-object p4, p0, Lw8j;->c:Lj9j;

    iput-object p5, p0, Lw8j;->d:Lc9j;

    iput-object p6, p0, Lw8j;->e:Lj87;

    iput-object p7, p0, Lw8j;->f:Ly8j;

    iput-object p8, p0, Lw8j;->g:Lu8j;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-object v0, p0, Lw8j;->b:Ljk7;

    iget-wide v1, v0, Ljk7;->b:J

    iget-wide v3, p0, Lw8j;->a:J

    cmp-long v1, v3, v1

    if-nez v1, :cond_28

    iget-object v1, p0, Lw8j;->c:Lj9j;

    iget-object v2, v1, Lj9j;->b:Ljava/util/List;

    iput-object v2, v0, Ljk7;->c:Ljava/lang/Object;

    iget-boolean v1, v1, Lj9j;->c:Z

    iput-boolean v1, v0, Ljk7;->a:Z

    sget-object v0, Lc9j;->w:[Lxtb;

    iget-object v0, p0, Lw8j;->d:Lc9j;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lc9j;->J0(Z)V

    iget-object v0, p0, Lw8j;->e:Lj87;

    iget-object v1, p0, Lw8j;->f:Ly8j;

    invoke-virtual {v0, v1}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    iget-object p0, p0, Lw8j;->g:Lu8j;

    invoke-virtual {p0}, Lu8j;->invoke()Ljava/lang/Object;

    :cond_28
    return-void
.end method
