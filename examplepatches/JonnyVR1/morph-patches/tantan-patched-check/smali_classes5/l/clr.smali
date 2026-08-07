.class public final synthetic Ll/clr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mlr;

.field public final synthetic b:I

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/mlr;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/clr;->a:Ll/mlr;

    iput p2, p0, Ll/clr;->b:I

    iput-object p3, p0, Ll/clr;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clr;->a:Ll/mlr;

    iget v1, p0, Ll/clr;->b:I

    iget-object p0, p0, Ll/clr;->c:Landroid/content/Intent;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/mlr;->h0(Ll/mlr;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
