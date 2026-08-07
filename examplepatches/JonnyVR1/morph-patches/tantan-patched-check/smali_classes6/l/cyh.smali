.class public final synthetic Ll/cyh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Z

.field public final synthetic e:Ll/y20;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/cyh;->a:Z

    iput-object p2, p0, Ll/cyh;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/cyh;->c:Lcom/p1/mobile/putong/data/User;

    iput-boolean p4, p0, Ll/cyh;->d:Z

    iput-object p5, p0, Ll/cyh;->e:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/cyh;->a:Z

    iget-object v1, p0, Ll/cyh;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/cyh;->c:Lcom/p1/mobile/putong/data/User;

    iget-boolean v3, p0, Ll/cyh;->d:Z

    iget-object p0, p0, Ll/cyh;->e:Ll/y20;

    invoke-static {v0, v1, v2, v3, p0}, Ll/hyh;->d(ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLl/y20;)V

    return-void
.end method
