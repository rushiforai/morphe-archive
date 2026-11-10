.class public final LQ/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:J

.field public final synthetic c:LR/h;


# direct methods
.method public constructor <init>(LR/h;Ljava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ/m;->c:LR/h;

    iput-object p2, p0, LQ/m;->a:Ljava/lang/String;

    iput-wide p3, p0, LQ/m;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 5

    iget-object v0, p0, LQ/m;->c:LR/h;

    iget-object v1, v0, LR/h;->a:LQ/r;

    iget-object v2, p0, LQ/m;->a:Ljava/lang/String;

    iget-wide v3, p0, LQ/m;->b:J

    invoke-virtual {v1, v2, v3, v4}, LQ/r;->a(Ljava/lang/String;J)V

    iget-object v1, v0, LR/h;->a:LQ/r;

    invoke-virtual {v0}, LR/h;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, LQ/r;->b(Ljava/lang/String;)V

    return-void
.end method
