.class public Lcom/sauzask/nicoid/NicoidVideoListFragment$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Le/e/a/l3/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/sauzask/nicoid/NicoidVideoListFragment;


# virtual methods
.method public a(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a(Ljava/lang/String;Ljava/lang/Boolean;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le/e/a/Followup3;->done(Ljava/lang/Object;Z)V

    return-void
.end method

.method public a(Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-static {v0}, Le/e/a/Followup3;->beforeResults(Ljava/lang/Object;)V

    .line 42
    iget-boolean v1, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->m0:Z

    if-eqz v1, :cond_15

    .line 43
    iget-object v1, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->r0:Le/e/a/b1;

    .line 44
    iget-object v2, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->c0:Le/e/a/e0;

    .line 45
    iget-object v2, v2, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    .line 46
    iput-object v2, v1, Le/e/a/b1;->d:Lorg/apache/http/client/CookieStore;

    .line 47
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    .line 48
    iput-object v1, v0, Le/e/a/b0;->l:Le/e/a/b1;

    .line 49
    :cond_15
    :try_start_15
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/x1;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 50
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->a0:Ljava/util/ArrayList;

    .line 51
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_2d
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 52
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    .line 53
    invoke-virtual {v0}, Le/e/a/b0;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 54
    iget-boolean v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->u0:Z

    if-eqz v0, :cond_49

    .line 55
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-lez p1, :cond_49

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 56
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 57
    check-cast p1, Lcom/sauzask/nicoid/NicoidVideoListActivity;

    invoke-virtual {p1}, Lcom/sauzask/nicoid/NicoidVideoListActivity;->s()V

    :cond_49
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "loadnow : \u8868\u793a\u5b8c\u4e86"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 58
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->p0:Le/e/a/b0;

    .line 59
    invoke-virtual {v0}, Le/e/a/b0;->getCount()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_61
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_61} :catch_62

    goto :goto_66

    :catch_62
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_66
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Le/e/a/Followup3;->done(Ljava/lang/Object;Z)V

    return-void
.end method

.method public a(Ljava/util/HashMap;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "description"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    const-string v2, "name"

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 1
    iput-object p1, v1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    .line 2
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 3
    iget-object v1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->e0:Ljava/lang/String;

    if-eqz v1, :cond_23

    .line 4
    iget-object v2, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->f0:Ljava/lang/String;

    .line 5
    invoke-virtual {p1, v1, v2}, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    :cond_23
    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 7
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->A0:Landroid/view/View;

    const v1, 0x7f08007a

    .line 8
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    if-eqz v0, :cond_3b

    const-string v1, "\"\""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3b

    const/4 v0, 0x0

    :cond_3b
    const/4 v1, 0x0

    if-eqz v0, :cond_93

    const-string v2, "<a href=\"http://([^\"]+)\"[^>]*>"

    const-string v3, "<motoweblink \"$1\">"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(h?ttps?|)(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v3, "<weblink>$2"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(<weblink>://www.nicovideo.jp/|)(mylist|user|watch)/([0-9]+)"

    const-string v3, "<font color=\'#44ddaa\'><a href=\'http://www.nicovideo.jp/$2/$3\'>$2/$3</a></font>"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "(<weblink>://www.nicovideo.jp/watch/|)(sm|so|nm|ss)([0-9]+)"

    const-string v3, "<font color=\'#44ddaa\'><a href=\'http://www.nicovideo.jp/watch/$2$3\'>$2$3</a></font>"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "<weblink>(://[-_.!~*\\\'()a-zA-Z0-9;\\/?:\\@&=+\\$,%#]+)"

    const-string v3, "<font color=\'#44ddaa\'><a href=\'http$1\'>http$1</a></font>"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "<motoweblink \"([^\"]+)\">"

    const-string v3, "<a href=\'http://$1\'>"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "\n"

    const-string v3, "<br>"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setLinksClickable(Z)V

    new-instance v0, Le/e/a/j3;

    iget-object v2, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 9
    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 10
    iget-object v2, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->v0:Le/e/a/l3/g;

    .line 11
    invoke-direct {v0, v3, v2}, Le/e/a/j3;-><init>(Landroid/app/Activity;Le/e/a/l3/g;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_98

    :cond_93
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_98
    new-instance p1, Landroid/widget/ArrayAdapter;

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 12
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x1090008

    .line 13
    invoke-direct {p1, v0, v2}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    const v0, 0x1090009

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->setDropDownViewResource(I)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 14
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01a3

    .line 15
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 16
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01a7

    .line 17
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 18
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01ab

    .line 19
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 20
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01ac

    .line 21
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 22
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01a2

    .line 23
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 24
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f019e

    .line 25
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 26
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01a0

    .line 27
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 28
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f019c

    .line 29
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 30
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01a1

    .line 31
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 32
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f019d

    .line 33
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 34
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f019f

    .line 35
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 36
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    const v2, 0x7f0f01aa

    .line 37
    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 38
    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->A0:Landroid/view/View;

    const v2, 0x7f080183

    .line 39
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Spinner;

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    new-instance p1, Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;

    invoke-direct {p1, p0}, Lcom/sauzask/nicoid/NicoidVideoListFragment$d$a;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment$d;)V

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object p1, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment$d;->a:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 40
    iget-object p1, p1, Lcom/sauzask/nicoid/NicoidVideoListFragment;->x0:Landroid/content/SharedPreferences;

    const-string v2, "sortlast"

    .line 41
    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Spinner;->setSelection(I)V

    return-void
.end method
