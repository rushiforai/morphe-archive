.class public final synthetic Ll/khe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bie;

.field public final synthetic b:Ll/fzq;

.field public final synthetic c:I

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Ll/bie;Ll/fzq;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/khe;->a:Ll/bie;

    iput-object p2, p0, Ll/khe;->b:Ll/fzq;

    iput p3, p0, Ll/khe;->c:I

    iput p4, p0, Ll/khe;->d:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/khe;->a:Ll/bie;

    iget-object v1, p0, Ll/khe;->b:Ll/fzq;

    iget v2, p0, Ll/khe;->c:I

    iget p0, p0, Ll/khe;->d:I

    invoke-static {v0, v1, v2, p0, p1}, Ll/bie;->J(Ll/bie;Ll/fzq;IILandroid/view/View;)V

    return-void
.end method
