.class public final synthetic Ll/zlg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Lcom/p1/mobile/putong/data/User;

.field public final synthetic e:Z

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zlg;->a:Ljava/lang/String;

    iput-boolean p2, p0, Ll/zlg;->b:Z

    iput-object p3, p0, Ll/zlg;->c:Lcom/p1/mobile/android/app/Act;

    iput-object p4, p0, Ll/zlg;->d:Lcom/p1/mobile/putong/data/User;

    iput-boolean p5, p0, Ll/zlg;->e:Z

    iput-object p6, p0, Ll/zlg;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/zlg;->a:Ljava/lang/String;

    iget-boolean v1, p0, Ll/zlg;->b:Z

    iget-object v2, p0, Ll/zlg;->c:Lcom/p1/mobile/android/app/Act;

    iget-object v3, p0, Ll/zlg;->d:Lcom/p1/mobile/putong/data/User;

    iget-boolean v4, p0, Ll/zlg;->e:Z

    iget-object v5, p0, Ll/zlg;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v6}, Ll/bmg;->a(Ljava/lang/String;ZLcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;ZLjava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
