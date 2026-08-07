.class public Ll/zi0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zi0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Ll/zi0;


# direct methods
.method public constructor <init>(Ll/zi0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    aget-object v0, v0, p1

    .line 24
    .line 25
    const/4 v1, 0x3

    .line 26
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const/4 v2, 0x1

    .line 31
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 35
    .line 36
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    aget-object p1, v0, p1

    .line 41
    .line 42
    iget-object p0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 43
    .line 44
    invoke-static {p0}, Ll/zi0;->a(Ll/zi0;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget v0, Ll/lbc0;->t:I

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    aget-object v0, v0, p1

    .line 12
    .line 13
    iget-object v1, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 14
    .line 15
    invoke-static {v1}, Ll/zi0;->a(Ll/zi0;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sget v2, Ll/k9c0;->k:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 33
    .line 34
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    aget-object v0, v0, p1

    .line 39
    .line 40
    const/4 v1, 0x3

    .line 41
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const/4 v2, 0x0

    .line 46
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 50
    .line 51
    invoke-static {v0}, Ll/zi0;->d(Ll/zi0;)[Lv/VText;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    aget-object p1, v0, p1

    .line 56
    .line 57
    iget-object p0, p0, Ll/zi0$b;->a:Ll/zi0;

    .line 58
    .line 59
    invoke-static {p0}, Ll/zi0;->a(Ll/zi0;)Lcom/p1/mobile/putong/app/PutongAct;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    sget v0, Ll/lbc0;->u:I

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
