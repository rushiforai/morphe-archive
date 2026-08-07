.class public final Ll/kze;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/kze$a;,
        Ll/kze$b;
    }
.end annotation


# instance fields
.field public final a:Ll/kze$b;


# direct methods
.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "textView cannot be null"

    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/kze$a;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Ll/kze$a;-><init>(Landroid/widget/TextView;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/kze;->a:Ll/kze$b;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
    .locals 0
    .param p1    # [Landroid/text/InputFilter;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kze;->a:Ll/kze$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kze$b;->a([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kze;->a:Ll/kze$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/kze$b;->b(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kze;->a:Ll/kze$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kze$b;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
