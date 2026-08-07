.class public final synthetic Ll/lqg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yqg;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/yqg;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lqg;->a:Ll/yqg;

    iput-object p2, p0, Ll/lqg;->b:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lqg;->a:Ll/yqg;

    iget-object p0, p0, Ll/lqg;->b:Lcom/p1/mobile/putong/data/User;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p0, p1}, Ll/yqg;->q(Ll/yqg;Lcom/p1/mobile/putong/data/User;Landroid/graphics/Bitmap;)V

    return-void
.end method
