.class public final synthetic Ll/w000;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/h100;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w000;->a:Ll/h100;

    iput-object p2, p0, Ll/w000;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iput-boolean p3, p0, Ll/w000;->c:Z

    iput-object p4, p0, Ll/w000;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/w000;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/w000;->a:Ll/h100;

    iget-object v1, p0, Ll/w000;->b:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    iget-boolean v2, p0, Ll/w000;->c:Z

    iget-object v3, p0, Ll/w000;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/w000;->e:Ljava/lang/String;

    move-object v5, p1

    check-cast v5, Ll/uxj0;

    invoke-static/range {v0 .. v5}, Ll/h100;->q(Ll/h100;Lcom/p1/mobile/putong/core/data/CoreMomentInfo;ZLjava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
