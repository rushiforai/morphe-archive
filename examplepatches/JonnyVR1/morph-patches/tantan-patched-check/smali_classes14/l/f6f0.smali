.class public final synthetic Ll/f6f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/q6f0;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ll/q6f0;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f6f0;->a:Ll/q6f0;

    iput-object p2, p0, Ll/f6f0;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f6f0;->a:Ll/q6f0;

    iget-object p0, p0, Ll/f6f0;->b:Ljava/lang/Runnable;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, p0, p1}, Ll/q6f0;->X0(Ll/q6f0;Ljava/lang/Runnable;Ljava/lang/Throwable;)V

    return-void
.end method
