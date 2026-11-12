.class public final Lwja;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzja;


# instance fields
.field public final a:Lxja;


# direct methods
.method public constructor <init>(Lxja;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwja;->a:Lxja;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 3

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    sget-object v1, Lxja;->b:Lxja;

    iget-object p0, p0, Lwja;->a:Lxja;

    if-eq p0, v1, :cond_13

    iget-object p0, p0, Lxja;->a:Ljava/lang/String;

    const-string v1, "error"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_13
    const-string p0, "Undefined"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method
