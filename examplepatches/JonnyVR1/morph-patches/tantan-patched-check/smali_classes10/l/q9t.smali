.class public final synthetic Ll/q9t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/fxl;

.field public final synthetic b:Lcom/google/protobuf/q;

.field public final synthetic c:Ll/pq60;


# direct methods
.method public synthetic constructor <init>(Ll/fxl;Lcom/google/protobuf/q;Ll/pq60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q9t;->a:Ll/fxl;

    iput-object p2, p0, Ll/q9t;->b:Lcom/google/protobuf/q;

    iput-object p3, p0, Ll/q9t;->c:Ll/pq60;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q9t;->a:Ll/fxl;

    iget-object v1, p0, Ll/q9t;->b:Lcom/google/protobuf/q;

    iget-object p0, p0, Ll/q9t;->c:Ll/pq60;

    invoke-static {v0, v1, p0}, Ll/r9t;->f(Ll/fxl;Lcom/google/protobuf/q;Ll/pq60;)V

    return-void
.end method
