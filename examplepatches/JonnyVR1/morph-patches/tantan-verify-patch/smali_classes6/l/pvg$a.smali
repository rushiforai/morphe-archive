.class public Ll/pvg$a;
.super Landroid/text/style/ClickableSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/pvg;->k(Ljava/lang/String;)Ljava/lang/CharSequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/pvg;


# direct methods
.method public constructor <init>(Ll/pvg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pvg$a;->a:Ll/pvg;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/text/style/ClickableSpan;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p0, Ll/pvg$a;->a:Ll/pvg;

    .line 2
    .line 3
    iget-object p1, p1, Ll/pvg;->e:Ll/jl80;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pvg$a;->a:Ll/pvg;

    .line 9
    .line 10
    iget-object p0, p0, Ll/pvg;->b:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    const-string p1, "popup"

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/personfeedinminetab/FeedWriterLevelView;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p0, p1}, Ll/ksg;->K0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public updateDrawState(Landroid/text/TextPaint;)V
    .locals 0

    .line 1
    const-string p0, "#fe7e1d"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
