.class public final synthetic Lkt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# instance fields
.field public final synthetic a:Lwt7;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ltaf;


# direct methods
.method public synthetic constructor <init>(Lwt7;Landroid/view/View;Ltaf;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkt7;->a:Lwt7;

    iput-object p2, p0, Lkt7;->b:Landroid/view/View;

    iput-object p3, p0, Lkt7;->c:Ltaf;

    return-void
.end method


# virtual methods
.method public final onLongClick(Landroid/view/View;)Z
    .registers 4

    iget-object p1, p0, Lkt7;->a:Lwt7;

    iget-object v0, p1, Lwt7;->b:Ldbf;

    iget-object p1, p1, Lwt7;->i:Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lhbf;

    if-nez p1, :cond_10

    sget-object p1, Lhbf;->a:Lhbf;

    :cond_10
    iget-object p1, p0, Lkt7;->b:Landroid/view/View;

    iget-object p0, p0, Lkt7;->c:Ltaf;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p0, v1}, Ldbf;->w(Landroid/view/View;Ltaf;Z)Z

    move-result p0

    return p0
.end method
