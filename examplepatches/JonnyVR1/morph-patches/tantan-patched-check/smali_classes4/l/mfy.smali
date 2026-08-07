.class public final synthetic Ll/mfy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pfy;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Z

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pfy;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mfy;->a:Ll/pfy;

    iput-object p2, p0, Ll/mfy;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/mfy;->c:Lcom/p1/mobile/android/app/Act;

    iput-boolean p4, p0, Ll/mfy;->d:Z

    iput-object p5, p0, Ll/mfy;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/mfy;->a:Ll/pfy;

    iget-object v1, p0, Ll/mfy;->b:Lcom/p1/mobile/putong/data/User;

    iget-object v2, p0, Ll/mfy;->c:Lcom/p1/mobile/android/app/Act;

    iget-boolean v3, p0, Ll/mfy;->d:Z

    iget-object v4, p0, Ll/mfy;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Ll/pfy;->d(Ll/pfy;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
