.class public final synthetic Ll/syj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/p0k0$a;

.field public final synthetic d:Lrx/subjects/a;

.field public final synthetic e:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/syj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/syj0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/syj0;->c:Ll/p0k0$a;

    iput-object p4, p0, Ll/syj0;->d:Lrx/subjects/a;

    iput-object p5, p0, Ll/syj0;->e:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/syj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/syj0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/syj0;->c:Ll/p0k0$a;

    iget-object v3, p0, Ll/syj0;->d:Lrx/subjects/a;

    iget-object v4, p0, Ll/syj0;->e:Ll/p0k0$b;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/ui/download/DownloadTask;

    move-object v6, p2

    check-cast v6, Ljava/io/File;

    invoke-static/range {v0 .. v6}, Ll/p0k0;->L(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$a;Lrx/subjects/a;Ll/p0k0$b;Lcom/p1/mobile/putong/ui/download/DownloadTask;Ljava/io/File;)V

    return-void
.end method
