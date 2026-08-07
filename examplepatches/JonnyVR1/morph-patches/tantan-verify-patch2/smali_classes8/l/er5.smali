.class public final synthetic Ll/er5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/kr5;

.field public final synthetic b:Lcom/p1/mobile/putong/data/User;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/kr5;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/er5;->a:Ll/kr5;

    iput-object p2, p0, Ll/er5;->b:Lcom/p1/mobile/putong/data/User;

    iput-object p3, p0, Ll/er5;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/er5;->a:Ll/kr5;

    iget-object v1, p0, Ll/er5;->b:Lcom/p1/mobile/putong/data/User;

    iget-object p0, p0, Ll/er5;->c:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/kr5;->d(Ll/kr5;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method
