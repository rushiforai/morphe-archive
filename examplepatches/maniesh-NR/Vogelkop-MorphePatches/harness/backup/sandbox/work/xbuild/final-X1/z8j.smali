.class public final Lz8j;
.super Lb9j;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public c:Ll6j;

.field public d:Landroid/content/res/ColorStateList;


# virtual methods
.method public final U(Ll6j;)V
    .registers 5

    iput-object p1, p0, Lz8j;->c:Ll6j;

    iget-object v0, p0, Lb9j;->b:La5n;

    check-cast v0, Le9j;

    iget-object v0, v0, Le9j;->a:Lcom/opera/android/widget/MenuSettingsListItem;

    iget-object v1, p1, Ll6j;->c:Ljava/lang/String;

    iget-object v2, v0, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v2, v2, Lor2;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p1, Ll6j;->d:Ljava/lang/String;

    iget-object v2, v0, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v2, v2, Lor2;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v1, p1, Ll6j;->e:I

    iget-object v2, v0, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v2, v2, Lor2;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-boolean p1, p1, Ll6j;->f:Z

    if-eqz p1, :cond_30

    iget-object p0, p0, Lz8j;->d:Landroid/content/res/ColorStateList;

    goto :goto_31

    :cond_30
    const/4 p0, 0x0

    :goto_31
    iget-object p1, v0, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object p1, p1, Lor2;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method
