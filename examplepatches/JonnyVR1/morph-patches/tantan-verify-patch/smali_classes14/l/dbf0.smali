.class public final synthetic Ll/dbf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ibf0;

.field public final synthetic b:Ll/y20;

.field public final synthetic c:Lcom/p1/mobile/putong/data/SignInData;

.field public final synthetic d:Ljava/lang/Runnable;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dbf0;->a:Ll/ibf0;

    iput-object p2, p0, Ll/dbf0;->b:Ll/y20;

    iput-object p3, p0, Ll/dbf0;->c:Lcom/p1/mobile/putong/data/SignInData;

    iput-object p4, p0, Ll/dbf0;->d:Ljava/lang/Runnable;

    iput-boolean p5, p0, Ll/dbf0;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/dbf0;->a:Ll/ibf0;

    iget-object v1, p0, Ll/dbf0;->b:Ll/y20;

    iget-object v2, p0, Ll/dbf0;->c:Lcom/p1/mobile/putong/data/SignInData;

    iget-object v3, p0, Ll/dbf0;->d:Ljava/lang/Runnable;

    iget-boolean v4, p0, Ll/dbf0;->e:Z

    move-object v5, p1

    check-cast v5, Ljava/lang/Throwable;

    invoke-static/range {v0 .. v5}, Ll/ibf0;->f0(Ll/ibf0;Ll/y20;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/Runnable;ZLjava/lang/Throwable;)V

    return-void
.end method
