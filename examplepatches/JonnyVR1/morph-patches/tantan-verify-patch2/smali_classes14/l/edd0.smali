.class public final synthetic Ll/edd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/VerifyData;

.field public final synthetic b:Ll/fdd0$a;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/edd0;->a:Lcom/p1/mobile/putong/data/VerifyData;

    iput-object p2, p0, Ll/edd0;->b:Ll/fdd0$a;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/edd0;->a:Lcom/p1/mobile/putong/data/VerifyData;

    iget-object p0, p0, Ll/edd0;->b:Ll/fdd0$a;

    invoke-static {v0, p0, p1, p2, p3}, Ll/fdd0;->a(Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
