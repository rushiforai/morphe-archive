.class public final synthetic Ll/p5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/t5;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/t5;Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p5;->a:Ll/t5;

    iput-object p2, p0, Ll/p5;->b:Landroid/view/View;

    iput-boolean p3, p0, Ll/p5;->c:Z

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p5;->a:Ll/t5;

    iget-object v1, p0, Ll/p5;->b:Landroid/view/View;

    iget-boolean p0, p0, Ll/p5;->c:Z

    invoke-static {v0, v1, p0}, Ll/t5;->f(Ll/t5;Landroid/view/View;Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
