.class public final synthetic Ll/t8e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/v8e0;

.field public final synthetic b:Ll/abe0;

.field public final synthetic c:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Ll/v8e0;Ll/abe0;Landroid/app/Activity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t8e0;->a:Ll/v8e0;

    iput-object p2, p0, Ll/t8e0;->b:Ll/abe0;

    iput-object p3, p0, Ll/t8e0;->c:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/t8e0;->a:Ll/v8e0;

    iget-object v1, p0, Ll/t8e0;->b:Ll/abe0;

    iget-object p0, p0, Ll/t8e0;->c:Landroid/app/Activity;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ShareId;

    invoke-static {v0, v1, p0, p1}, Ll/v8e0;->g(Ll/v8e0;Ll/abe0;Landroid/app/Activity;Lcom/p1/mobile/putong/core/data/ShareId;)V

    return-void
.end method
