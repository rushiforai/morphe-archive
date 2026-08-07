.class public final synthetic Ll/alo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/content/Intent;

.field public final synthetic b:I

.field public final synthetic c:Ll/ilo;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Intent;ILl/ilo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/alo;->a:Landroid/content/Intent;

    iput p2, p0, Ll/alo;->b:I

    iput-object p3, p0, Ll/alo;->c:Ll/ilo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/alo;->a:Landroid/content/Intent;

    iget v1, p0, Ll/alo;->b:I

    iget-object p0, p0, Ll/alo;->c:Ll/ilo;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/ilo;->o0(Landroid/content/Intent;ILl/ilo;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
