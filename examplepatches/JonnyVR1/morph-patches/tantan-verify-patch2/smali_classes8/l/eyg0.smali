.class public final synthetic Ll/eyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyg0;

.field public final synthetic b:Ltech/sud/gip/core/ISudListenerInitSDK;

.field public final synthetic c:Landroid/content/Context;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Z

.field public final synthetic g:Ll/bpg0;

.field public final synthetic h:Ll/bpg0;


# direct methods
.method public synthetic constructor <init>(Ll/uyg0;Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/eyg0;->a:Ll/uyg0;

    iput-object p2, p0, Ll/eyg0;->b:Ltech/sud/gip/core/ISudListenerInitSDK;

    iput-object p3, p0, Ll/eyg0;->c:Landroid/content/Context;

    iput-object p4, p0, Ll/eyg0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/eyg0;->e:Ljava/lang/String;

    iput-boolean p6, p0, Ll/eyg0;->f:Z

    iput-object p7, p0, Ll/eyg0;->g:Ll/bpg0;

    iput-object p8, p0, Ll/eyg0;->h:Ll/bpg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/eyg0;->a:Ll/uyg0;

    iget-object v1, p0, Ll/eyg0;->b:Ltech/sud/gip/core/ISudListenerInitSDK;

    iget-object v2, p0, Ll/eyg0;->c:Landroid/content/Context;

    iget-object v3, p0, Ll/eyg0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/eyg0;->e:Ljava/lang/String;

    iget-boolean v5, p0, Ll/eyg0;->f:Z

    iget-object v6, p0, Ll/eyg0;->g:Ll/bpg0;

    iget-object v7, p0, Ll/eyg0;->h:Ll/bpg0;

    invoke-virtual/range {v0 .. v7}, Ll/uyg0;->B(Ltech/sud/gip/core/ISudListenerInitSDK;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZLl/bpg0;Ll/bpg0;)V

    return-void
.end method
