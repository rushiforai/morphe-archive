.class public final synthetic Ll/jb7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pcj;

.field public final synthetic b:Ll/qcj;


# direct methods
.method public synthetic constructor <init>(Ll/pcj;Ll/qcj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jb7;->a:Ll/pcj;

    iput-object p2, p0, Ll/jb7;->b:Ll/qcj;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jb7;->a:Ll/pcj;

    iget-object p0, p0, Ll/jb7;->b:Ll/qcj;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/api/a;->z1(Ll/pcj;Ll/qcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
