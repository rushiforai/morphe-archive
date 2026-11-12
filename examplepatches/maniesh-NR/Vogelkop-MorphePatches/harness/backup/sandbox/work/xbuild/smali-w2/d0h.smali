.class public final synthetic Ld0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf0h;


# direct methods
.method public synthetic constructor <init>(Lf0h;B)V
    .registers 3

    iput-byte p2, p0, Ld0h;->a:B

    iput-object p1, p0, Ld0h;->b:Lf0h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ld0h;->a:B

    const/16 v1, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object p0, p0, Ld0h;->b:Lf0h;

    packed-switch v0, :pswitch_data_14a

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lwqm;->D(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_18

    move v1, v3

    :cond_18
    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->i:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lf0h;->g:Lo4g;

    iget-object p0, p0, Lo4g;->l:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_32
    check-cast p1, Lh1b;

    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result p1

    iget-object p0, p0, Lf0h;->g:Lo4g;

    if-eqz p1, :cond_44

    iget-object p0, p0, Lo4g;->k:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4b

    :cond_44
    iget-object p0, p0, Lo4g;->k:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_4b
    return-void

    :pswitch_4c
    check-cast p1, Lo0h;

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->l:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    iget-boolean v1, p1, Lo0h;->b:Z

    if-eqz v1, :cond_5c

    iget-boolean v1, p1, Lo0h;->c:Z

    if-nez v1, :cond_5d

    :cond_5c
    move v2, v3

    :cond_5d
    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsStatisticView;->setActivated(Z)V

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v1

    iget-wide v2, p1, Lo0h;->a:J

    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lf0h;->g:Lo4g;

    iget-object p0, p0, Lo4g;->f:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v0, 0x7f08061a

    const v1, 0x7f080619

    invoke-static {p0, p1, v0, v1}, Lf0h;->h0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lo0h;II)V

    return-void

    :pswitch_83
    check-cast p1, Lo0h;

    iget-object v0, p0, Lf0h;->g:Lo4g;

    iget-object v0, v0, Lo4g;->d:Landroid/view/View;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    iget-boolean v1, p1, Lo0h;->b:Z

    if-eqz v1, :cond_93

    iget-boolean v1, p1, Lo0h;->c:Z

    if-nez v1, :cond_94

    :cond_93
    move v2, v3

    :cond_94
    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsStatisticView;->setActivated(Z)V

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v1

    iget-wide v2, p1, Lo0h;->a:J

    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    iget-object v0, v0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lf0h;->g:Lo4g;

    iget-object p0, p0, Lo4g;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const v0, 0x7f0804de

    const v1, 0x7f0804dd

    invoke-static {p0, p1, v0, v1}, Lf0h;->h0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lo0h;II)V

    return-void

    :pswitch_ba
    check-cast p1, Lqwi;

    iget-object p1, p1, Lqwi;->a:Lnwi;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const-string v0, "%1$s"

    const v1, 0x7f140409

    if-eqz p1, :cond_10c

    if-eq p1, v2, :cond_d2

    const/4 v2, 0x2

    if-eq p1, v2, :cond_10c

    const/4 v2, 0x3

    if-eq p1, v2, :cond_10c

    goto :goto_145

    :cond_d2
    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->h:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    const v2, 0x7f1404b5

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->g:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    new-instance v2, Le0h;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Le0h;-><init>(Lf0h;Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f1404b6

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v4, v0, v1, v2}, Lphj;->c0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lagc;)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0805c0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_145

    :cond_10c
    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->h:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    const v2, 0x7f1404b3

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->g:Landroid/view/View;

    check-cast p1, Landroid/widget/TextView;

    new-instance v2, Le0h;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Le0h;-><init>(Lf0h;Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f1404b4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v4, v0, v1, v2}, Lphj;->c0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lagc;)V

    iget-object p1, p0, Lf0h;->g:Lo4g;

    iget-object p1, p1, Lo4g;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0805be

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :goto_145
    invoke-virtual {p0}, Lf0h;->i0()V

    return-void

    nop

    :pswitch_data_14a
    .packed-switch 0x0
        :pswitch_ba
        :pswitch_83
        :pswitch_4c
        :pswitch_32
    .end packed-switch
.end method
