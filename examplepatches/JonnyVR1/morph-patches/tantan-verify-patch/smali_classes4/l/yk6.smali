.class public final synthetic Ll/yk6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zk6;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/zk6;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yk6;->a:Ll/zk6;

    iput-boolean p2, p0, Ll/yk6;->b:Z

    iput-object p3, p0, Ll/yk6;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yk6;->a:Ll/zk6;

    iget-boolean v1, p0, Ll/yk6;->b:Z

    iget-object p0, p0, Ll/yk6;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/zk6;->f0(Ll/zk6;ZLjava/lang/String;)V

    return-void
.end method
