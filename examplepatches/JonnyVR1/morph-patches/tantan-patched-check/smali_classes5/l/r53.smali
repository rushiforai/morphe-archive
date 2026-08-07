.class public final synthetic Ll/r53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/w53;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/String;

.field public final synthetic f:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/w53;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r53;->a:Ll/w53;

    iput-boolean p2, p0, Ll/r53;->b:Z

    iput-object p3, p0, Ll/r53;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/r53;->d:Ljava/lang/String;

    iput-object p5, p0, Ll/r53;->e:Ljava/lang/String;

    iput-object p6, p0, Ll/r53;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/r53;->a:Ll/w53;

    iget-boolean v1, p0, Ll/r53;->b:Z

    iget-object v2, p0, Ll/r53;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/r53;->d:Ljava/lang/String;

    iget-object v4, p0, Ll/r53;->e:Ljava/lang/String;

    iget-object v5, p0, Ll/r53;->f:Ljava/lang/String;

    move-object v6, p1

    check-cast v6, Lcom/p1/mobile/putong/data/Detect;

    invoke-static/range {v0 .. v6}, Ll/w53;->i(Ll/w53;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method
