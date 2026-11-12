.class public final synthetic Lcln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Lvq8;

.field public final synthetic b:Z

.field public final synthetic c:Lgln;


# direct methods
.method public synthetic constructor <init>(Lvq8;ZLgln;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcln;->a:Lvq8;

    iput-boolean p2, p0, Lcln;->b:Z

    iput-object p3, p0, Lcln;->c:Lgln;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ljava/util/Set;

    iget-object v0, p0, Lcln;->a:Lvq8;

    invoke-virtual {v0, p1}, Lvq8;->d(Ljava/util/Set;)Lokhttp3/internal/connection/RealCall;

    move-result-object p1

    new-instance v1, Ldln;

    iget-boolean v2, p0, Lcln;->b:Z

    iget-object p0, p0, Lcln;->c:Lgln;

    invoke-direct {v1, v0, v2, p0}, Ldln;-><init>(Lvq8;ZLgln;)V

    new-instance p0, Ldln;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Ldln;-><init>(Lvq8;Lgln;Z)V

    invoke-interface {p1, p0}, Lv84;->enqueue(Lf94;)V

    return-void
.end method
