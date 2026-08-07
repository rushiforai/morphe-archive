.class public final synthetic Ll/b300;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/c300;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Media;


# direct methods
.method public synthetic constructor <init>(Ll/c300;Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b300;->a:Ll/c300;

    iput-object p2, p0, Ll/b300;->b:Lcom/p1/mobile/putong/data/Media;

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b300;->a:Ll/c300;

    iget-object p0, p0, Ll/b300;->b:Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, p0, p1, p2, p3}, Ll/c300;->G(Ll/c300;Lcom/p1/mobile/putong/data/Media;IILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
