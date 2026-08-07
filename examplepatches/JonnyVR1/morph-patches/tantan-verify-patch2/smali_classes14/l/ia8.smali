.class public final synthetic Ll/ia8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/Set;

.field public final synthetic b:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Set;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ia8;->a:Ljava/util/Set;

    iput-object p2, p0, Ll/ia8;->b:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ia8;->a:Ljava/util/Set;

    iget-object p0, p0, Ll/ia8;->b:Ljava/util/Set;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/g;->c9(Ljava/util/Set;Ljava/util/Set;Ljava/lang/Throwable;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
