.class public final synthetic Ll/b1a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:[Z

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;

.field public final synthetic d:Lcom/p1/mobile/android/app/Act;

.field public final synthetic e:Z

.field public final synthetic f:Ll/y20;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>([ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b1a;->a:[Z

    iput-boolean p2, p0, Ll/b1a;->b:Z

    iput-object p3, p0, Ll/b1a;->c:Lcom/p1/mobile/putong/data/User;

    iput-object p4, p0, Ll/b1a;->d:Lcom/p1/mobile/android/app/Act;

    iput-boolean p5, p0, Ll/b1a;->e:Z

    iput-object p6, p0, Ll/b1a;->f:Ll/y20;

    iput-object p7, p0, Ll/b1a;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/b1a;->h:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/b1a;->a:[Z

    iget-boolean v1, p0, Ll/b1a;->b:Z

    iget-object v2, p0, Ll/b1a;->c:Lcom/p1/mobile/putong/data/User;

    iget-object v3, p0, Ll/b1a;->d:Lcom/p1/mobile/android/app/Act;

    iget-boolean v4, p0, Ll/b1a;->e:Z

    iget-object v5, p0, Ll/b1a;->f:Ll/y20;

    iget-object v6, p0, Ll/b1a;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/b1a;->h:Ljava/lang/String;

    move-object v8, p1

    check-cast v8, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v8}, Ll/j1a;->n([ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLl/y20;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
