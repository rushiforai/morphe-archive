.class public Ll/axa0$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/axa0;->j(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/axa0;


# direct methods
.method public constructor <init>(Ll/axa0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/axa0$a;->a:Ll/axa0;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/axa0$a;->a:Ll/axa0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/axa0;->z:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
