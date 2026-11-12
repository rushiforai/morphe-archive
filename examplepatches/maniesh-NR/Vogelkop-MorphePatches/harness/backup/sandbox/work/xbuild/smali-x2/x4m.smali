.class public final synthetic Lx4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ly4m;

.field public final synthetic b:Z

.field public final synthetic c:Lszb;

.field public final synthetic d:Z

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ly4m;ZLszb;II)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lx4m;->a:Ly4m;

    iput-boolean p2, p0, Lx4m;->b:Z

    iput-object p3, p0, Lx4m;->c:Lszb;

    iput-boolean p4, p0, Lx4m;->d:Z

    iput-boolean p5, p0, Lx4m;->e:Z

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    const/4 p1, 0x1

    iget-object v0, p0, Lx4m;->a:Ly4m;

    iget-boolean v1, p0, Lx4m;->b:Z

    iget-object v2, p0, Lx4m;->c:Lszb;

    if-eqz v1, :cond_11

    iget-object v1, v0, Ly4m;->d:Lv3m;

    iget-boolean v3, p0, Lx4m;->d:Z

    invoke-virtual {v1, v2, v3, p1}, Lv3m;->j(Lszb;IZ)V

    goto :goto_22

    :cond_11
    iget-object v1, v0, Ly4m;->d:Lv3m;

    iget-object v1, v1, Lv3m;->d:Lplk;

    iget-object v3, v1, Lplk;->b:Ljava/lang/Object;

    check-cast v3, Lxl;

    new-instance v4, Liyk;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v2, v5}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lxl;->j(Lcom/opera/api/Callback;)V

    :goto_22
    iget-boolean p0, p0, Lx4m;->e:Z

    if-ne p0, p1, :cond_2f

    iget-object p0, v0, Ly4m;->f:Lr4m;

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, p1}, Lr4m;->Y(Lb2l;I)V

    :cond_2f
    return-void
.end method
