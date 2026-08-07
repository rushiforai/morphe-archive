.class public Ll/pq4$b;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pq4;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pq4$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pq4$b;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/pq4$b;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/bm5;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p4, "verification_center"

    .line 2
    .line 3
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    invoke-static {p0, p1, p4, p2}, Ll/hxf;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ll/bm5;->dismiss()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/bm5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pq4$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-direct {v0, v1, v2}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/pq4$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object v2, p0, Ll/pq4$b;->b:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v3, p0, Ll/pq4$b;->c:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v4, Ll/qq4;

    .line 16
    .line 17
    invoke-direct {v4, v1, v2, v3, v0}, Ll/qq4;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/bm5;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v4}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/bm5;->show()V

    .line 24
    .line 25
    .line 26
    check-cast p1, Landroid/widget/TextView;

    .line 27
    .line 28
    iget-object p0, p0, Ll/pq4$b;->a:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    sget v0, Ll/c9c0;->transparent_background:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getColor(I)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0
    .param p1    # Landroid/text/TextPaint;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/text/style/ClickableSpan;->updateDrawState(Landroid/text/TextPaint;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
