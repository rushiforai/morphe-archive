.class public final synthetic Ll/r0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/UpdateApiResult;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    iput-object p2, p0, Ll/r0k0;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/r0k0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r0k0;->a:Lcom/p1/mobile/putong/data/UpdateApiResult;

    iget-object v1, p0, Ll/r0k0;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/r0k0;->c:Z

    check-cast p1, Ljava/io/File;

    invoke-static {v0, v1, p0, p1}, Ll/d1k0;->h(Lcom/p1/mobile/putong/data/UpdateApiResult;Lcom/p1/mobile/android/app/Act;ZLjava/io/File;)V

    return-void
.end method
