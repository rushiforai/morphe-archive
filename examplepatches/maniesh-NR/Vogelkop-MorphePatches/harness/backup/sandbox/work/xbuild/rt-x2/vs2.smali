.class public final synthetic Lvs2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lbt2;

.field public final synthetic b:I

.field public final synthetic c:Liz9;


# direct methods
.method public synthetic constructor <init>(Lbt2;ILiz9;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvs2;->a:Lbt2;

    iput p2, p0, Lvs2;->b:I

    iput-object p3, p0, Lvs2;->c:Liz9;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Lvs2;->a:Lbt2;

    iget-object v0, p1, Lbt2;->e:Lhp2;

    invoke-virtual {v0}, Lhp2;->a()Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iget-object p1, p1, Lbt2;->a:Ldx3;

    iget v0, p0, Lvs2;->b:I

    iget-object p0, p0, Lvs2;->c:Liz9;

    invoke-static {v0, p1, p0}, Lj14;->a0(ILandroid/app/Activity;Liz9;)V

    return-void
.end method
