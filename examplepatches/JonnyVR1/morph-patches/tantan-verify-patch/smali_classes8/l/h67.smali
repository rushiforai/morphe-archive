.class public final synthetic Ll/h67;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/String;

.field public final synthetic g:Ljava/lang/String;

.field public final synthetic h:Ljava/lang/String;

.field public final synthetic i:Ljava/lang/String;

.field public final synthetic j:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h67;->a:Ll/xc00;

    iput-object p2, p0, Ll/h67;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/h67;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/h67;->d:Ljava/lang/String;

    iput p5, p0, Ll/h67;->e:I

    iput-object p6, p0, Ll/h67;->f:Ljava/lang/String;

    iput-object p7, p0, Ll/h67;->g:Ljava/lang/String;

    iput-object p8, p0, Ll/h67;->h:Ljava/lang/String;

    iput-object p9, p0, Ll/h67;->i:Ljava/lang/String;

    iput-object p10, p0, Ll/h67;->j:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/h67;->a:Ll/xc00;

    iget-object v1, p0, Ll/h67;->b:Ljava/lang/String;

    iget-object v2, p0, Ll/h67;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/h67;->d:Ljava/lang/String;

    iget v4, p0, Ll/h67;->e:I

    iget-object v5, p0, Ll/h67;->f:Ljava/lang/String;

    iget-object v6, p0, Ll/h67;->g:Ljava/lang/String;

    iget-object v7, p0, Ll/h67;->h:Ljava/lang/String;

    iget-object v8, p0, Ll/h67;->i:Ljava/lang/String;

    iget-object v9, p0, Ll/h67;->j:Ljava/lang/String;

    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/jsbridge/CoreBridgeImplementation;->z1(Ll/xc00;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
