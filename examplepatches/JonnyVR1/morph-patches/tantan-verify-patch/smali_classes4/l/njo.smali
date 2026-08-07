.class public final synthetic Ll/njo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ojo;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ojo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/njo;->a:Ll/ojo;

    iput-object p2, p0, Ll/njo;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/njo;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/njo;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/njo;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/njo;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/njo;->a:Ll/ojo;

    iget-object v1, p0, Ll/njo;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/njo;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/njo;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/njo;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/njo;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static/range {v0 .. v6}, Ll/ojo;->e0(Ll/ojo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
