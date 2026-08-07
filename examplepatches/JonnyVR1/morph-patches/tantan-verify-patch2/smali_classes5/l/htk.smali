.class public final synthetic Ll/htk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Z

.field public final synthetic e:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/htk;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/htk;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/htk;->c:Lcom/p1/mobile/putong/data/User;

    iput-boolean p4, p0, Ll/htk;->d:Z

    iput-object p5, p0, Ll/htk;->e:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/htk;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/htk;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/htk;->c:Lcom/p1/mobile/putong/data/User;

    iget-boolean v3, p0, Ll/htk;->d:Z

    iget-object p0, p0, Ll/htk;->e:Ll/x20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/qtk;->g0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;ZLl/x20;)V

    return-void
.end method
