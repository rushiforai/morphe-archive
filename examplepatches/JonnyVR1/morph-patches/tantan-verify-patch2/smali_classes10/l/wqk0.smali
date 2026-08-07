.class public final synthetic Ll/wqk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ark0;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/ark0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wqk0;->a:Ll/ark0;

    iput-object p2, p0, Ll/wqk0;->b:Ljava/lang/Runnable;

    iput-object p3, p0, Ll/wqk0;->c:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wqk0;->a:Ll/ark0;

    iget-object v1, p0, Ll/wqk0;->b:Ljava/lang/Runnable;

    iget-object p0, p0, Ll/wqk0;->c:Ljava/lang/Runnable;

    invoke-static {v0, v1, p0}, Ll/ark0;->b4(Ll/ark0;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method
