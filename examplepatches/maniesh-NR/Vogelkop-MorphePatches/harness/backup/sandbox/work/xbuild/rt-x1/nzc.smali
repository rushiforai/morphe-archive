.class public abstract Lnzc;
.super Landroid/app/job/JobService;
.source "SourceFile"


# static fields
.field public static a:Lmlf;


# virtual methods
.method public a(Landroid/app/job/JobParameters;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final onStopJob(Landroid/app/job/JobParameters;)Z
    .registers 3

    sget-object v0, Lnzc;->a:Lmlf;

    if-eqz v0, :cond_7

    invoke-virtual {v0, p1}, Lmlf;->g(Landroid/app/job/JobParameters;)V

    :cond_7
    invoke-virtual {p0, p1}, Lnzc;->a(Landroid/app/job/JobParameters;)Z

    move-result p0

    return p0
.end method
