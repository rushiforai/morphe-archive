.class public Ll/azy$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/azy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/azy;


# direct methods
.method public constructor <init>(Ll/azy;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/azy$a;->a:Ll/azy;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/azy$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/azy$a;->b()V

    return-void
.end method


# virtual methods
.method public final synthetic b()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/azy$a;->a:Ll/azy;

    .line 2
    .line 3
    invoke-static {p0}, Ll/azy;->u(Ll/azy;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-static {p0, v0, v1}, Ll/azy;->y(Ll/azy;ZZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/azy$a;->a:Ll/azy;

    .line 2
    .line 3
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getInputRoot()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/azy$a;->a:Ll/azy;

    .line 14
    .line 15
    iget-object v1, v1, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContainer()Landroid/widget/LinearLayout;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Ll/bnl0;->i0(Landroid/view/View;)Ll/bnl0$g;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    new-instance v2, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    iget v3, v0, Ll/bnl0$g;->a:I

    .line 31
    .line 32
    iget v4, v1, Ll/bnl0$g;->a:I

    .line 33
    .line 34
    sub-int/2addr v3, v4

    .line 35
    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 36
    .line 37
    iget v4, v0, Ll/bnl0$g;->b:I

    .line 38
    .line 39
    iget v1, v1, Ll/bnl0$g;->b:I

    .line 40
    .line 41
    sub-int/2addr v4, v1

    .line 42
    iput v4, v2, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    iget v1, v0, Ll/bnl0$g;->c:I

    .line 45
    .line 46
    add-int/2addr v3, v1

    .line 47
    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 48
    .line 49
    iget v0, v0, Ll/bnl0$g;->d:I

    .line 50
    .line 51
    add-int/2addr v4, v0

    .line 52
    iput v4, v2, Landroid/graphics/Rect;->bottom:I

    .line 53
    .line 54
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-gtz v0, :cond_0

    .line 59
    .line 60
    sget v0, Ll/qa00;->t:I

    .line 61
    .line 62
    iput v0, v2, Landroid/graphics/Rect;->top:I

    .line 63
    .line 64
    sget v1, Ll/qa00;->z:I

    .line 65
    .line 66
    add-int/2addr v0, v1

    .line 67
    iput v0, v2, Landroid/graphics/Rect;->bottom:I

    .line 68
    .line 69
    :cond_0
    iget-object v0, p0, Ll/azy$a;->a:Ll/azy;

    .line 70
    .line 71
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->w0()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/azy$a;->a:Ll/azy;

    .line 77
    .line 78
    const/4 v1, 0x0

    .line 79
    invoke-static {v0, v1}, Ll/azy;->x(Ll/azy;Z)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Ll/azy$a;->a:Ll/azy;

    .line 83
    .line 84
    iget-object v0, v0, Ll/azy;->c:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarOpt;->getSurfaceContent()Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/zyy;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/zyy;-><init>(Ll/azy$a;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageSurfaceAnimContainer;->a(Landroid/graphics/Rect;Ll/x20;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
