.class public final synthetic Ll/z1f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/util/ArrayList;

.field public final synthetic g:Z

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iput-object p2, p0, Ll/z1f0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/z1f0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/z1f0;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/z1f0;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/z1f0;->f:Ljava/util/ArrayList;

    iput-boolean p7, p0, Ll/z1f0;->g:Z

    iput-object p8, p0, Ll/z1f0;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/z1f0;->a:Lcom/p1/mobile/putong/ui/share/ShareHelper;

    iget-object v1, p0, Ll/z1f0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/z1f0;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/z1f0;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/z1f0;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/z1f0;->f:Ljava/util/ArrayList;

    iget-boolean v6, p0, Ll/z1f0;->g:Z

    iget-object v7, p0, Ll/z1f0;->h:Ljava/lang/String;

    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/share/ShareHelper;->p(Lcom/p1/mobile/putong/ui/share/ShareHelper;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;ZLjava/lang/String;)V

    return-void
.end method
