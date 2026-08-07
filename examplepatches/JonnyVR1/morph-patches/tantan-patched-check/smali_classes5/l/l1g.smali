.class public final synthetic Ll/l1g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m1g;

.field public final synthetic b:I

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/m1g;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l1g;->a:Ll/m1g;

    iput p2, p0, Ll/l1g;->b:I

    iput-object p3, p0, Ll/l1g;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/l1g;->a:Ll/m1g;

    iget v1, p0, Ll/l1g;->b:I

    iget-object p0, p0, Ll/l1g;->c:Landroid/content/Intent;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/m1g;->e0(Ll/m1g;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
