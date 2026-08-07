.class public final synthetic Ll/wpp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/content/Intent;

.field public final synthetic b:I

.field public final synthetic c:Ll/eqp;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Intent;ILl/eqp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wpp;->a:Landroid/content/Intent;

    iput p2, p0, Ll/wpp;->b:I

    iput-object p3, p0, Ll/wpp;->c:Ll/eqp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wpp;->a:Landroid/content/Intent;

    iget v1, p0, Ll/wpp;->b:I

    iget-object p0, p0, Ll/wpp;->c:Ll/eqp;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/eqp;->p0(Landroid/content/Intent;ILl/eqp;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
