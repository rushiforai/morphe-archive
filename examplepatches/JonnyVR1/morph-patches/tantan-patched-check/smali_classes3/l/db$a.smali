.class public Ll/db$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/db;->X()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;

.field public final synthetic b:Ll/db;


# direct methods
.method public constructor <init>(Ll/db;Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/db$a;->b:Ll/db;

    .line 2
    .line 3
    iput-object p2, p0, Ll/db$a;->a:Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/db$a;->a:Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->p2()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
