.class public Ll/a5j0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a5j0;->r()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/a5j0;


# direct methods
.method public constructor <init>(Ll/a5j0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a5j0$a;->a:Ll/a5j0;

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
    iget-object p0, p0, Ll/a5j0$a;->a:Ll/a5j0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/a5j0;->g:Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;

    .line 4
    .line 5
    const-string p1, "newOneOutOfFourSkipButton"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/MKWebViewFrag;->S4(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-static {p0}, Ll/v4j0;->i(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
