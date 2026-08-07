.class public final synthetic Ll/rcy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/content/Intent;

.field public final synthetic b:I

.field public final synthetic c:Ll/idy;

.field public final synthetic d:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Intent;ILl/idy;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rcy;->a:Landroid/content/Intent;

    iput p2, p0, Ll/rcy;->b:I

    iput-object p3, p0, Ll/rcy;->c:Ll/idy;

    iput p4, p0, Ll/rcy;->d:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rcy;->a:Landroid/content/Intent;

    iget v1, p0, Ll/rcy;->b:I

    iget-object v2, p0, Ll/rcy;->c:Ll/idy;

    iget p0, p0, Ll/rcy;->d:I

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, v2, p0, p1}, Ll/idy;->u0(Landroid/content/Intent;ILl/idy;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method
