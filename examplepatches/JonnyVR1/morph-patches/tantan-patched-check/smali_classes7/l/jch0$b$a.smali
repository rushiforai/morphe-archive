.class public Ll/jch0$b$a;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jch0$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jch0$b;


# direct methods
.method public constructor <init>(Ll/jch0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jch0$b$a;->a:Ll/jch0$b;

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
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/jch0$b$a;->a:Ll/jch0$b;

    .line 5
    .line 6
    iget-object v0, v0, Ll/jch0$b;->a:Ll/jch0;

    .line 7
    .line 8
    iget-object v0, v0, Ll/jch0;->k:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 9
    .line 10
    new-instance v1, Ll/jch0$b$a$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/jch0$b$a$a;-><init>(Ll/jch0$b$a;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v2, 0xc8

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method
