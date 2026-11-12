.class public final Lqja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvja;


# instance fields
.field public final a:Lsja;


# direct methods
.method public constructor <init>(Lsja;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqja;->a:Lsja;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 4

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, ""

    const-string v2, "reason"

    invoke-static {v2, v1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v1

    iget-object p0, p0, Lqja;->a:Lsja;

    iget-object p0, p0, Lsja;->a:Lrja;

    sget-object v2, Lrja;->b:Lrja;

    if-eq p0, v2, :cond_22

    iget-object p0, p0, Lrja;->a:Ljava/lang/String;

    const-string v2, "codes"

    invoke-virtual {v1, p0, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "error"

    invoke-virtual {v0, v1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_22
    const-string p0, "Undefined"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
