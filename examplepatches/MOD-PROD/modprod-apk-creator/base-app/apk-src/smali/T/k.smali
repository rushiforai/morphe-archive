.class public final LT/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Landroid/app/Dialog;

.field public final synthetic b:LG/a;


# direct methods
.method public constructor <init>(LG/a;Landroid/app/Dialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LT/k;->b:LG/a;

    iput-object p2, p0, LT/k;->a:Landroid/app/Dialog;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, LT/k;->b:LG/a;

    iget-object p1, p1, LG/a;->b:Ljava/lang/Object;

    check-cast p1, LC/j;

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, LT/e;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, LT/e;->a()V

    :cond_0
    iget-object p1, p0, LT/k;->a:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method
