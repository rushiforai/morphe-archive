.class public final synthetic Ll/o7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ljava/util/HashMap;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ljava/util/HashMap;Ljava/util/HashMap;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o7o0;->a:Ljava/util/HashMap;

    iput-object p2, p0, Ll/o7o0;->b:Ljava/util/HashMap;

    iput-boolean p3, p0, Ll/o7o0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/o7o0;->a:Ljava/util/HashMap;

    iget-object v1, p0, Ll/o7o0;->b:Ljava/util/HashMap;

    iget-boolean p0, p0, Ll/o7o0;->c:Z

    check-cast p1, Ll/nsv;

    invoke-static {v0, v1, p0, p1}, Ll/p7o0;->b(Ljava/util/HashMap;Ljava/util/HashMap;ZLl/nsv;)Ll/nsv;

    move-result-object p0

    return-object p0
.end method
