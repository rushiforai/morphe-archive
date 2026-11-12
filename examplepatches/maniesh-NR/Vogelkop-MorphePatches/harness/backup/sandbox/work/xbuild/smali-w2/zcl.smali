.class public final Lzcl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:I

.field public b:Landroid/os/PersistableBundle;


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Lzcl;->a:I

    return-void
.end method

.method public constructor <init>(Lzcl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget v0, p1, Lzcl;->a:I

    iput v0, p0, Lzcl;->a:I

    iget-object p1, p1, Lzcl;->b:Landroid/os/PersistableBundle;

    if-nez p1, :cond_10

    new-instance p1, Landroid/os/PersistableBundle;

    invoke-direct {p1}, Landroid/os/PersistableBundle;-><init>()V

    :cond_10
    iput-object p1, p0, Lzcl;->b:Landroid/os/PersistableBundle;

    return-void
.end method
