.class public Ll/isx$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/isx;->j(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/isx;


# direct methods
.method public constructor <init>(Ll/isx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/isx$b;->a:Ll/isx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    iget-object p1, p0, Ll/isx$b;->a:Ll/isx;

    .line 2
    .line 3
    invoke-static {p1}, Ll/isx;->b(Ll/isx;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/na5;->c(Landroid/content/Context;)Ll/na5;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p0, p0, Ll/isx$b;->a:Ll/isx;

    .line 12
    .line 13
    invoke-static {p0}, Ll/isx;->a(Ll/isx;)Landroid/widget/TextView;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "anchorMediaData"

    .line 26
    .line 27
    invoke-virtual {p1, v0, p0}, Ll/na5;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const-string p0, "\u5df2\u590d\u5236\u5230\u526a\u5207\u677f"

    .line 31
    .line 32
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x0

    .line 36
    return p0
.end method
