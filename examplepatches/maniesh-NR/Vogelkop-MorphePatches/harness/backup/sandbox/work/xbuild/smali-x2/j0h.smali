.class public final Lj0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcz3;


# instance fields
.field public final synthetic a:Lk0h;


# direct methods
.method public constructor <init>(Lk0h;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lj0h;->a:Lk0h;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lj0h;->a:Lk0h;

    iget-object p0, p0, Lk0h;->a:Llz3;

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object p0, p0, Lj0h;->a:Lk0h;

    iget-object p0, p0, Lk0h;->a:Llz3;

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Llz3;->b(Lhjm;)Z

    return-void
.end method
