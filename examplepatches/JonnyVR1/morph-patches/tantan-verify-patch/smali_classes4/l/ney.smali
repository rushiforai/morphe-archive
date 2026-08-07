.class public final synthetic Ll/ney;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Z


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ney;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ney;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/ney;->c:Z

    iput-object p4, p0, Ll/ney;->d:Lcom/p1/mobile/putong/data/User;

    iput-boolean p5, p0, Ll/ney;->e:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ney;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/ney;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean v2, p0, Ll/ney;->c:Z

    iget-object v3, p0, Ll/ney;->d:Lcom/p1/mobile/putong/data/User;

    iget-boolean v4, p0, Ll/ney;->e:Z

    move-object v5, p1

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v5}, Ll/pey;->e(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;ZLcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
