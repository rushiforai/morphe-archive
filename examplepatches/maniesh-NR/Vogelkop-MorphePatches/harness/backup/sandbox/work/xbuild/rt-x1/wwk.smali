.class public final Lwwk;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Lwwk;->a:Z

    iput-object p1, p0, Lwwk;->b:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 3

    new-instance p2, Lxwk;

    iget-boolean p0, p0, Lwwk;->a:Z

    invoke-direct {p2, p1, p0}, Lxwk;-><init>(Lmej;Z)V

    return-object p2
.end method
