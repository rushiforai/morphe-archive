.class public final synthetic Ll/fxn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/nsv;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fxn0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/fxn0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/fxn0;->c:Ll/nsv;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fxn0;->a:Ljava/lang/String;

    iget-object v1, p0, Ll/fxn0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/fxn0;->c:Ll/nsv;

    invoke-static {v0, v1, p0}, Ll/jxn0;->g(Ljava/lang/String;Ljava/lang/String;Ll/nsv;)V

    return-void
.end method
