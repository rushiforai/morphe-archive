.class public final Lwap;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzcf;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwap;->a:Ljava/lang/Runnable;

    iput-object p2, p0, Lwap;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a(Lcm;)V
    .registers 2

    iget-object p0, p0, Lwap;->b:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final onSuccess()V
    .registers 1

    iget-object p0, p0, Lwap;->a:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method
