.class public final synthetic Ll/e1e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/il50;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/e1e;->a:I

    iput p2, p0, Ll/e1e;->b:I

    iput p3, p0, Ll/e1e;->c:I

    iput p4, p0, Ll/e1e;->d:I

    return-void
.end method


# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Ll/dgq0;)Ll/dgq0;
    .locals 6

    .line 1
    iget v0, p0, Ll/e1e;->a:I

    iget v1, p0, Ll/e1e;->b:I

    iget v2, p0, Ll/e1e;->c:I

    iget v3, p0, Ll/e1e;->d:I

    move-object v4, p1

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Ll/g1e;->u(IIIILandroid/view/View;Ll/dgq0;)Ll/dgq0;

    move-result-object p0

    return-object p0
.end method
