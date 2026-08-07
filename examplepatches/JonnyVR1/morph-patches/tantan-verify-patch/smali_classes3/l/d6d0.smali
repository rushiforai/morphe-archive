.class public final synthetic Ll/d6d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Landroid/app/Activity;

.field public final synthetic b:Lcom/p1/mobile/putong/data/AuthData;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d6d0;->a:Landroid/app/Activity;

    iput-object p2, p0, Ll/d6d0;->b:Lcom/p1/mobile/putong/data/AuthData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d6d0;->a:Landroid/app/Activity;

    iget-object p0, p0, Ll/d6d0;->b:Lcom/p1/mobile/putong/data/AuthData;

    check-cast p1, Ljava/util/HashMap;

    invoke-static {v0, p0, p1}, Ll/h6d0;->c(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;Ljava/util/HashMap;)V

    return-void
.end method
