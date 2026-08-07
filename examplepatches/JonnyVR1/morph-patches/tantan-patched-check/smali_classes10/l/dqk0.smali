.class public final synthetic Ll/dqk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/hqk0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/hqk0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dqk0;->a:Ll/hqk0;

    iput-object p2, p0, Ll/dqk0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/dqk0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dqk0;->a:Ll/hqk0;

    iget-object v1, p0, Ll/dqk0;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/dqk0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/hqk0;->O3(Ll/hqk0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method
