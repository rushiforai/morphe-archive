.class public final LT/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field public final synthetic a:LG/a;


# direct methods
.method public constructor <init>(LG/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LT/j;->a:LG/a;

    return-void
.end method


# virtual methods
.method public final onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    iget-object p1, p0, LT/j;->a:LG/a;

    iget-object p1, p1, LG/a;->b:Ljava/lang/Object;

    check-cast p1, LC/j;

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, LT/e;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, LT/e;->a()V

    :cond_0
    return-void
.end method
