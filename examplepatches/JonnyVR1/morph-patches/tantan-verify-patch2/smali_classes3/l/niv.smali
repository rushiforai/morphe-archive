.class public final synthetic Ll/niv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qiv;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/qiv;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/niv;->a:Ll/qiv;

    iput-boolean p2, p0, Ll/niv;->b:Z

    iput-object p3, p0, Ll/niv;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/niv;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/niv;->a:Ll/qiv;

    iget-boolean v1, p0, Ll/niv;->b:Z

    iget-object v2, p0, Ll/niv;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/niv;->d:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, v2, p0, p1}, Ll/qiv;->J3(Ll/qiv;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
