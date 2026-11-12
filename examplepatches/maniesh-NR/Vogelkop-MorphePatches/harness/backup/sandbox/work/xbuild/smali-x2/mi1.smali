.class public final Lmi1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leeb;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Lwgb;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lwgb;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmi1;->a:Ljava/lang/String;

    iput-object p2, p0, Lmi1;->b:Lwgb;

    return-void
.end method


# virtual methods
.method public final intercept(Ldeb;)Lpzh;
    .registers 6

    invoke-interface {p1}, Ldeb;->request()Lkvh;

    move-result-object v0

    :try_start_4
    iget-object v1, p0, Lmi1;->b:Lwgb;

    invoke-interface {v1}, Lwgb;->get()Lpne;

    move-result-object v1
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_a} :catch_3c

    iget-object v2, v0, Lkvh;->a:Lhra;

    iget-object v2, v2, Lhra;->d:Ljava/lang/String;

    iget-object v3, v1, Lpne;->a:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    iget-object v2, v0, Lkvh;->a:Lhra;

    iget-object v2, v2, Lhra;->a:Ljava/lang/String;

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    invoke-virtual {v0}, Lkvh;->b()Lfvh;

    move-result-object v0

    iget-object p0, p0, Lmi1;->a:Ljava/lang/String;

    iget-object v1, v1, Lpne;->b:Ljava/lang/String;

    invoke-virtual {v0, p0, v1}, Lfvh;->a(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Lkvh;

    invoke-direct {p0, v0}, Lkvh;-><init>(Lfvh;)V

    invoke-interface {p1, p0}, Ldeb;->proceed(Lkvh;)Lpzh;

    move-result-object p0

    return-object p0

    :cond_37
    invoke-interface {p1, v0}, Ldeb;->proceed(Lkvh;)Lpzh;

    move-result-object p0

    return-object p0

    :catch_3c
    move-exception p0

    invoke-static {p0}, Lt3p;->r(Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    return-object p0
.end method
