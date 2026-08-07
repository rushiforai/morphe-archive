.class public final synthetic Ll/nmr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

.field public final synthetic b:I

.field public final synthetic c:Landroid/content/Intent;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nmr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    iput p2, p0, Ll/nmr;->b:I

    iput-object p3, p0, Ll/nmr;->c:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nmr;->a:Lcom/p1/mobile/putong/core/ui/vip/likers/c;

    iget v1, p0, Ll/nmr;->b:I

    iget-object p0, p0, Ll/nmr;->c:Landroid/content/Intent;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/likers/c;->q0(Lcom/p1/mobile/putong/core/ui/vip/likers/c;ILandroid/content/Intent;Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
