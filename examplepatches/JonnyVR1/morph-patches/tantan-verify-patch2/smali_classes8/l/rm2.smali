.class public final synthetic Ll/rm2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/an2;

.field public final synthetic b:I

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Ll/an2;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rm2;->a:Ll/an2;

    iput p2, p0, Ll/rm2;->b:I

    iput-object p3, p0, Ll/rm2;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rm2;->a:Ll/an2;

    iget v1, p0, Ll/rm2;->b:I

    iget-object p0, p0, Ll/rm2;->c:Landroid/content/Intent;

    invoke-static {v0, v1, p0}, Ll/an2;->o0(Ll/an2;ILandroid/content/Intent;)V

    return-void
.end method
