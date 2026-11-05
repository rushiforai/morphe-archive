.class public final Le/e/a/ModernComments$Worker;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public model:Le/e/a/d0;


# direct methods
.method public constructor <init>(Le/e/a/d0;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ModernComments$Worker;->model:Le/e/a/d0;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Le/e/a/ModernComments$Worker;->model:Le/e/a/d0;

    invoke-static {v0}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    return-void
.end method
