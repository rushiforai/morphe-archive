.class public final synthetic Ll/ta7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Z

.field public final synthetic e:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(ZLcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Ll/ta7;->a:Z

    iput-object p2, p0, Ll/ta7;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/ta7;->c:Z

    iput-boolean p4, p0, Ll/ta7;->d:Z

    iput-object p5, p0, Ll/ta7;->e:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Ll/ta7;->a:Z

    iget-object v1, p0, Ll/ta7;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/ta7;->c:Z

    iget-boolean v3, p0, Ll/ta7;->d:Z

    iget-object v4, p0, Ll/ta7;->e:Lcom/p1/mobile/putong/data/User;

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/module/CoreBusinessServiceIml;->bu(ZLcom/p1/mobile/android/app/Act;ZZLcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
