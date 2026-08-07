.class public final synthetic Ll/l2o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/tm50;


# instance fields
.field public final synthetic a:Ll/g1o0;

.field public final synthetic b:Ll/m2o0;


# direct methods
.method public synthetic constructor <init>(Ll/g1o0;Ll/m2o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2o0;->a:Ll/g1o0;

    iput-object p2, p0, Ll/l2o0;->b:Ll/m2o0;

    return-void
.end method


# virtual methods
.method public final a(Ll/mvc0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l2o0;->a:Ll/g1o0;

    iget-object p0, p0, Ll/l2o0;->b:Ll/m2o0;

    invoke-static {v0, p0, p1}, Ll/m2o0;->b(Ll/g1o0;Ll/m2o0;Ll/mvc0;)V

    return-void
.end method
