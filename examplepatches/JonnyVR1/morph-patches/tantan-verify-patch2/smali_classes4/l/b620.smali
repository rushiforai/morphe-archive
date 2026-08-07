.class public final synthetic Ll/b620;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/m620;

.field public final synthetic b:Landroid/content/Intent;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/m620;Landroid/content/Intent;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b620;->a:Ll/m620;

    iput-object p2, p0, Ll/b620;->b:Landroid/content/Intent;

    iput p3, p0, Ll/b620;->c:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b620;->a:Ll/m620;

    iget-object v1, p0, Ll/b620;->b:Landroid/content/Intent;

    iget p0, p0, Ll/b620;->c:I

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Ll/m620;->z0(Ll/m620;Landroid/content/Intent;ILcom/p1/mobile/android/app/c;)V

    return-void
.end method
