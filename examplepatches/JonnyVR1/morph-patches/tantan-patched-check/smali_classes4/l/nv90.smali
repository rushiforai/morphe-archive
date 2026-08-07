.class public final synthetic Ll/nv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/app/a$a;


# instance fields
.field public final synthetic a:Ll/aw90;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Lcom/p1/mobile/putong/core/data/NewTags;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/aw90;Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nv90;->a:Ll/aw90;

    iput-object p2, p0, Ll/nv90;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/nv90;->c:Lcom/p1/mobile/putong/core/data/NewTags;

    iput-object p4, p0, Ll/nv90;->d:Lcom/p1/mobile/android/app/Act;

    iput-boolean p5, p0, Ll/nv90;->e:Z

    return-void
.end method


# virtual methods
.method public final a(IILandroid/content/Intent;)Z
    .locals 8

    .line 1
    iget-object v0, p0, Ll/nv90;->a:Ll/aw90;

    iget-object v1, p0, Ll/nv90;->b:Ljava/lang/Runnable;

    iget-object v2, p0, Ll/nv90;->c:Lcom/p1/mobile/putong/core/data/NewTags;

    iget-object v3, p0, Ll/nv90;->d:Lcom/p1/mobile/android/app/Act;

    iget-boolean v4, p0, Ll/nv90;->e:Z

    move v5, p1

    move v6, p2

    move-object v7, p3

    invoke-static/range {v0 .. v7}, Ll/aw90;->l(Ll/aw90;Ljava/lang/Runnable;Lcom/p1/mobile/putong/core/data/NewTags;Lcom/p1/mobile/android/app/Act;ZIILandroid/content/Intent;)Z

    move-result p0

    return p0
.end method
