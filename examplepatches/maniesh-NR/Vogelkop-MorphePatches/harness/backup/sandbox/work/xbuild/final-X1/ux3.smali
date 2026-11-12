.class public final synthetic Lux3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lvx3;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lvx3;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lux3;->a:Lvx3;

    iput-boolean p2, p0, Lux3;->b:Z

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lux3;->a:Lvx3;

    iget-object v0, v0, Lvx3;->p:Ljava/util/ArrayList;

    new-instance v1, Lyx3;

    iget-boolean p0, p0, Lux3;->b:Z

    invoke-direct {v1, p1, p0}, Lyx3;-><init>(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
