.class public final Llre;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltff;


# instance fields
.field public final a:Lx5f;

.field public b:Lta7;


# direct methods
.method public constructor <init>(Lx5f;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Llre;->a:Lx5f;

    return-void
.end method


# virtual methods
.method public final b(Lz7;Lt9f;)Lsff;
    .registers 5

    new-instance v0, Lkre;

    iget-object v1, p0, Llre;->a:Lx5f;

    iget-object p0, p0, Llre;->b:Lta7;

    invoke-direct {v0, p1, p2, v1, p0}, Lkre;-><init>(Lz7;Lt9f;Lx5f;Lta7;)V

    return-object v0
.end method
