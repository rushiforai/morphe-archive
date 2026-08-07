.class Lcom/clevertap/android/sdk/inbox/a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/clevertap/android/sdk/inbox/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:[Landroid/widget/ImageView;

.field private final c:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

.field private final d:Lcom/clevertap/android/sdk/inbox/a;

.field final synthetic e:Lcom/clevertap/android/sdk/inbox/a;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inbox/a;Landroid/content/Context;Lcom/clevertap/android/sdk/inbox/a;[Landroid/widget/ImageView;Lcom/clevertap/android/sdk/inbox/CTInboxMessage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/a$a;->e:Lcom/clevertap/android/sdk/inbox/a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/a$a;->a:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/a$a;->d:Lcom/clevertap/android/sdk/inbox/a;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/a$a;->b:[Landroid/widget/ImageView;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/clevertap/android/sdk/inbox/a$a;->c:Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    aget-object p0, p4, p0

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    sget p2, Ll/wbc0;->m:I

    .line 22
    .line 23
    const/4 p3, 0x0

    .line 24
    invoke-static {p1, p2, p3}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/a$a;->b:[Landroid/widget/ImageView;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    const/4 v3, 0x0

    .line 6
    if-ge v2, v1, :cond_0

    .line 7
    .line 8
    aget-object v4, v0, v2

    .line 9
    .line 10
    iget-object v5, p0, Lcom/clevertap/android/sdk/inbox/a$a;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    sget v6, Ll/wbc0;->n:I

    .line 17
    .line 18
    invoke-static {v5, v6, v3}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/a$a;->b:[Landroid/widget/ImageView;

    .line 29
    .line 30
    aget-object p1, v0, p1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/a$a;->a:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    sget v0, Ll/wbc0;->m:I

    .line 39
    .line 40
    invoke-static {p0, v0, v3}, Ll/c5d0;->e(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
