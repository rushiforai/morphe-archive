.class public final synthetic Ll/u67;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aqq;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u67;->a:Ll/aqq;

    iput-object p2, p0, Ll/u67;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/u67;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/u67;->d:Ljava/lang/String;

    iput p5, p0, Ll/u67;->e:I

    iput-object p6, p0, Ll/u67;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/u67;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/u67;->h:Ljava/lang/String;

    iput-object p9, p0, Ll/u67;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/u67;->a:Ll/aqq;

    iget-object v1, p0, Ll/u67;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/u67;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/u67;->d:Ljava/lang/String;

    iget v4, p0, Ll/u67;->e:I

    iget-object v5, p0, Ll/u67;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/u67;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/u67;->h:Ljava/lang/String;

    iget-object v8, p0, Ll/u67;->i:Ljava/lang/String;

    invoke-static/range {v0 .. v8}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->v1(Ll/aqq;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
