.class public final synthetic Ll/wk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zk6;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/zk6;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wk6;->a:Ll/zk6;

    iput-object p2, p0, Ll/wk6;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wk6;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wk6;->a:Ll/zk6;

    iget-object v1, p0, Ll/wk6;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wk6;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/zk6;->e0(Ll/zk6;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
