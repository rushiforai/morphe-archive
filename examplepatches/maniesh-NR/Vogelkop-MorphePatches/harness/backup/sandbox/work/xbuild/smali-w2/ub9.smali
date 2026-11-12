.class Lub9;
.super Lagc;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ltw2;


# direct methods
.method public constructor <init>(Ltw2;Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    iput-object p3, p0, Lub9;->e:Ljava/lang/String;

    iput-object p1, p0, Lub9;->f:Ltw2;

    invoke-direct {p0, p2}, Lagc;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-object p1, p0, Lub9;->f:Ltw2;

    iget-object p1, p1, Ltw2;->b:Ljava/lang/Object;

    check-cast p1, Lwb9;

    iget-object p1, p1, Lwb9;->n:Lvk2;

    iget-object p0, p0, Lub9;->e:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lvk2;->run(Ljava/lang/Object;)V

    return-void
.end method
