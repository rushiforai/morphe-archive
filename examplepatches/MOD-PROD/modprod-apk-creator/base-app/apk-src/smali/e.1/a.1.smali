.class public final Le/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:Le/e;

.field public final synthetic b:Le/b;


# direct methods
.method public constructor <init>(Le/b;Le/e;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/a;->b:Le/b;

    iput-object p2, p0, Le/a;->a:Le/e;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    iget-object p1, p0, Le/a;->b:Le/b;

    iget-object p2, p1, Le/b;->h:Landroid/content/DialogInterface$OnClickListener;

    iget-object p4, p0, Le/a;->a:Le/e;

    iget-object p5, p4, Le/e;->b:Le/g;

    invoke-interface {p2, p5, p3}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    iget-boolean p1, p1, Le/b;->i:Z

    if-nez p1, :cond_0

    iget-object p1, p4, Le/e;->b:Le/g;

    invoke-virtual {p1}, Le/g;->dismiss()V

    :cond_0
    return-void
.end method
