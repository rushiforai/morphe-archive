.class public final synthetic Ll/m2c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ll/y20;

.field public final synthetic g:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/y20;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m2c;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/m2c;->b:Lcom/p1/mobile/putong/data/User;

    iput-boolean p3, p0, Ll/m2c;->c:Z

    iput-boolean p4, p0, Ll/m2c;->d:Z

    iput-object p5, p0, Ll/m2c;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/m2c;->f:Ll/y20;

    iput-object p7, p0, Ll/m2c;->g:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/m2c;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/m2c;->b:Lcom/p1/mobile/putong/data/User;

    iget-boolean v2, p0, Ll/m2c;->c:Z

    iget-boolean v3, p0, Ll/m2c;->d:Z

    iget-object v4, p0, Ll/m2c;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/m2c;->f:Ll/y20;

    iget-object v6, p0, Ll/m2c;->g:Ll/x20;

    invoke-static/range {v0 .. v6}, Ll/o2c;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/y20;Ll/x20;)V

    return-void
.end method
