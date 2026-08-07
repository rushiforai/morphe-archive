.class public final synthetic Ll/jvn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ovn0;

.field public final synthetic b:Ljava/util/Map;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/ovn0;Ljava/util/Map;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jvn0;->a:Ll/ovn0;

    iput-object p2, p0, Ll/jvn0;->b:Ljava/util/Map;

    iput-boolean p3, p0, Ll/jvn0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jvn0;->a:Ll/ovn0;

    iget-object v1, p0, Ll/jvn0;->b:Ljava/util/Map;

    iget-boolean p0, p0, Ll/jvn0;->c:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/ovn0;->d(Ll/ovn0;Ljava/util/Map;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
