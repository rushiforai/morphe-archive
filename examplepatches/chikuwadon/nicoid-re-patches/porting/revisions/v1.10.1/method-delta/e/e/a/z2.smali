.class public Le/e/a/z2;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Le/e/a/a3;


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    iget-object p1, p0, Le/e/a/z2;->a:Le/e/a/a3;

    iget-object v0, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    if-eqz v0, :cond_34

    .line 1
    iget-boolean v0, v0, Le/e/a/f0;->e:Z

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p1, Le/e/a/a3;->H0:Z

    .line 3
    iget-object p1, p1, Le/e/a/a3;->p1:Landroid/widget/Button;

    const v0, 0x7f07019c

    goto :goto_1b

    :cond_13
    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p1, Le/e/a/a3;->H0:Z

    .line 5
    iget-object p1, p1, Le/e/a/a3;->p1:Landroid/widget/Button;

    const v0, 0x7f07019d

    .line 6
    :goto_1b
    invoke-static {p1, v0}, Le/e/a/PlayerIcons;->background(Landroid/view/View;I)V

    iget-object p1, p0, Le/e/a/z2;->a:Le/e/a/a3;

    iget-object v0, p1, Le/e/a/a3;->c0:Le/e/a/f0;

    .line 7
    iget-boolean v1, p1, Le/e/a/a3;->H0:Z

    .line 8
    iput-boolean v1, v0, Le/e/a/f0;->e:Z

    .line 9
    iget-object p1, p1, Le/e/a/a3;->I1:Landroid/content/SharedPreferences$Editor;

    const-string v0, "player_isloop"

    .line 10
    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    iget-object p1, p0, Le/e/a/z2;->a:Le/e/a/a3;

    .line 11
    iget-object p1, p1, Le/e/a/a3;->I1:Landroid/content/SharedPreferences$Editor;

    .line 12
    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :cond_34
    return-void
.end method
