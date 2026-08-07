.class public Ll/nxf$a;
.super Ll/yhj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nxf;->j(Landroid/view/View;FF)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/nxf;


# direct methods
.method public constructor <init>(Ll/nxf;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxf$a;->b:Ll/nxf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nxf$a;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/yhj0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Ll/ygj0;)V
    .locals 2
    .param p1    # Ll/ygj0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/nxf$a;->a:Landroid/view/View;

    .line 2
    .line 3
    const/high16 v1, 0x3f800000    # 1.0f

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/hnl0;->g(Landroid/view/View;F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/nxf$a;->a:Landroid/view/View;

    .line 9
    .line 10
    invoke-static {v0}, Ll/hnl0;->a(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Ll/ygj0;->removeListener(Ll/ygj0$g;)Ll/ygj0;

    .line 14
    .line 15
    .line 16
    return-void
.end method
