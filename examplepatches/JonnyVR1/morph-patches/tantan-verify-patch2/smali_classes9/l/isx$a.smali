.class public Ll/isx$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/isx;->r()V
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
    iput-object p1, p0, Ll/isx$a;->a:Ll/isx;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/isx$a;->a:Ll/isx;

    .line 2
    .line 3
    invoke-static {p1}, Ll/isx;->a(Ll/isx;)Landroid/widget/TextView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/isx$a;->a:Ll/isx;

    .line 10
    .line 11
    invoke-static {p1}, Ll/isx;->a(Ll/isx;)Landroid/widget/TextView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/isx$a;->a:Ll/isx;

    .line 22
    .line 23
    invoke-static {p0}, Ll/isx;->a(Ll/isx;)Landroid/widget/TextView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/16 p1, 0x8

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Ll/isx$a;->a:Ll/isx;

    .line 34
    .line 35
    invoke-static {p0}, Ll/isx;->d(Ll/isx;)Ll/hsx;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ll/hsx;->R3()V

    .line 40
    .line 41
    .line 42
    return-void
.end method
