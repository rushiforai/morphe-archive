.class public final synthetic Lc2b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le2b;


# direct methods
.method public synthetic constructor <init>(Le2b;B)V
    .registers 3

    iput-byte p2, p0, Lc2b;->a:B

    iput-object p1, p0, Lc2b;->b:Le2b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lc2b;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lc2b;->b:Le2b;

    packed-switch p1, :pswitch_data_6e

    iget-object p1, p0, Le2b;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh2b;

    new-instance v1, Ld2b;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ld2b;-><init>(Le2b;B)V

    iget-object p0, p1, Lh2b;->b:Lpm3;

    new-instance v2, Lg2b;

    invoke-direct {v2, v1, p1, v0}, Lg2b;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "text/html"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    iget-object p0, p0, Lpm3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v0, v2}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    iget-object p0, p1, Lh2b;->c:Lorm;

    sget-object p1, Lz80;->e:Lz80;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->X(Lz80;)V

    return-void

    :pswitch_42
    iget-object p1, p0, Le2b;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lh2b;

    new-instance v1, Ld2b;

    invoke-direct {v1, p0, v0}, Ld2b;-><init>(Le2b;B)V

    iget-object p0, p1, Lh2b;->b:Lpm3;

    new-instance v0, Lqj2;

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    iget-object p0, p0, Lpm3;->a:Lcom/opera/android/BrowserActivity;

    sget-object v1, Lw2b;->c:Lw2b;

    invoke-static {p0, v0, v1}, Lo0g;->E0(Lcom/opera/android/BrowserActivity;Lni;Lw2b;)V

    iget-object p0, p1, Lh2b;->c:Lorm;

    sget-object p1, Lz80;->d:Lz80;

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1}, Lx5f;->X(Lz80;)V

    return-void

    nop

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_42
    .end packed-switch
.end method
