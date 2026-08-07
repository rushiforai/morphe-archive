.class public final synthetic Ll/np0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

.field public final synthetic b:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/vap/AnimView;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/np0;->a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

    iput-object p2, p0, Ll/np0;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/np0;->a:Lcom/p1/mobile/putong/live/base/vap/AnimView;

    iget-object p0, p0, Ll/np0;->b:Landroid/content/Context;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/live/base/vap/AnimView;->c(Lcom/p1/mobile/putong/live/base/vap/AnimView;Landroid/content/Context;)V

    return-void
.end method
