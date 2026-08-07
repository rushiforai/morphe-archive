.class public final synthetic Ll/oo70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/d;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;

.field public final synthetic d:Z

.field public final synthetic e:Ll/jic0;

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Z

.field public final synthetic h:Lcom/p1/mobile/putong/data/User;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLl/jic0;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oo70;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iput-boolean p2, p0, Ll/oo70;->b:Z

    iput-object p3, p0, Ll/oo70;->c:Lcom/p1/mobile/android/app/Act;

    iput-boolean p4, p0, Ll/oo70;->d:Z

    iput-object p5, p0, Ll/oo70;->e:Ll/jic0;

    iput-object p6, p0, Ll/oo70;->f:Ljava/lang/String;

    iput-boolean p7, p0, Ll/oo70;->g:Z

    iput-object p8, p0, Ll/oo70;->h:Lcom/p1/mobile/putong/data/User;

    iput-object p9, p0, Ll/oo70;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/oo70;->a:Lcom/p1/mobile/putong/core/newui/home/d;

    iget-boolean v1, p0, Ll/oo70;->b:Z

    iget-object v2, p0, Ll/oo70;->c:Lcom/p1/mobile/android/app/Act;

    iget-boolean v3, p0, Ll/oo70;->d:Z

    iget-object v4, p0, Ll/oo70;->e:Ll/jic0;

    iget-object v5, p0, Ll/oo70;->f:Ljava/lang/String;

    iget-boolean v6, p0, Ll/oo70;->g:Z

    iget-object v7, p0, Ll/oo70;->h:Lcom/p1/mobile/putong/data/User;

    iget-object v8, p0, Ll/oo70;->i:Ljava/lang/String;

    move-object v9, p1

    check-cast v9, Lcom/p1/mobile/putong/data/Relationship;

    invoke-static/range {v0 .. v9}, Ll/qo70$a;->d(Lcom/p1/mobile/putong/core/newui/home/d;ZLcom/p1/mobile/android/app/Act;ZLl/jic0;Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;Ljava/lang/String;Lcom/p1/mobile/putong/data/Relationship;)V

    return-void
.end method
