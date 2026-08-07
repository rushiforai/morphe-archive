.class public final synthetic Ll/wue0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Lcom/quickjs/JSFunction;

.field public final synthetic c:Lcom/quickjs/JSContext;


# direct methods
.method public synthetic constructor <init>(JLcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/wue0;->a:J

    iput-object p3, p0, Ll/wue0;->b:Lcom/quickjs/JSFunction;

    iput-object p4, p0, Ll/wue0;->c:Lcom/quickjs/JSContext;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-wide v0, p0, Ll/wue0;->a:J

    iget-object v2, p0, Ll/wue0;->b:Lcom/quickjs/JSFunction;

    iget-object p0, p0, Ll/wue0;->c:Lcom/quickjs/JSContext;

    invoke-static {v0, v1, v2, p0}, Lcom/quickjs/plugin/SetTimeoutPlugin;->b(JLcom/quickjs/JSFunction;Lcom/quickjs/JSContext;)V

    return-void
.end method
