.class public final synthetic Lv8j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/List;

.field public final synthetic b:I

.field public final synthetic c:Lj9j;

.field public final synthetic d:Z

.field public final synthetic e:Ljk7;

.field public final synthetic f:J

.field public final synthetic g:Lc9j;

.field public final synthetic h:Ly8j;

.field public final synthetic i:Lu8j;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;ILj9j;ILjk7;JLc9j;Ly8j;Lu8j;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv8j;->a:Ljava/util/List;

    iput p2, p0, Lv8j;->b:I

    iput-object p3, p0, Lv8j;->c:Lj9j;

    iput-boolean p4, p0, Lv8j;->d:Z

    iput-object p5, p0, Lv8j;->e:Ljk7;

    iput-wide p6, p0, Lv8j;->f:J

    iput-object p8, p0, Lv8j;->g:Lc9j;

    iput-object p9, p0, Lv8j;->h:Ly8j;

    iput-object p10, p0, Lv8j;->i:Lu8j;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    new-instance v0, Lx8j;

    iget-object v1, p0, Lv8j;->a:Ljava/util/List;

    iget v2, p0, Lv8j;->b:I

    iget-object v3, p0, Lv8j;->c:Lj9j;

    iget-boolean v4, p0, Lv8j;->d:Z

    iget-object v5, p0, Lv8j;->e:Ljk7;

    invoke-direct/range {v0 .. v5}, Lx8j;-><init>(Ljava/util/List;ILj9j;ILjk7;)V

    const/4 v1, 0x1

    invoke-static {v0, v1}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v9

    move-object v7, v3

    new-instance v3, Lw8j;

    move-object v6, v5

    iget-wide v4, p0, Lv8j;->f:J

    iget-object v8, p0, Lv8j;->g:Lc9j;

    iget-object v10, p0, Lv8j;->h:Ly8j;

    iget-object v11, p0, Lv8j;->i:Lu8j;

    invoke-direct/range {v3 .. v11}, Lw8j;-><init>(JLjk7;Lj9j;Lc9j;Lj87;Ly8j;Lu8j;)V

    invoke-static {v3}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method
