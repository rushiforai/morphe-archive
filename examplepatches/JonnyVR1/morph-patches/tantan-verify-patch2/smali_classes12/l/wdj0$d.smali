.class Ll/wdj0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/wdj0;->U(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

.field final synthetic b:Lcom/idv/identity/face/ui/ToygerActivity;

.field final synthetic c:Ll/wdj0;


# direct methods
.method public constructor <init>(Ll/wdj0;Lcom/idv/identity/face/ui/widget/EllipseHoleView;Lcom/idv/identity/face/ui/ToygerActivity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wdj0$d;->c:Ll/wdj0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/wdj0$d;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/wdj0$d;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    :cond_0
    iget-object v0, p0, Ll/wdj0$d;->a:Lcom/idv/identity/face/ui/widget/EllipseHoleView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/idv/identity/face/ui/widget/EllipseHoleView;->r()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/wdj0$d;->b:Lcom/idv/identity/face/ui/ToygerActivity;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/idv/identity/face/ui/ToygerActivity;->B2()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
