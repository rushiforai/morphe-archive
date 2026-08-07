.class public final synthetic Ll/ei2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hi2;

.field public final synthetic b:Ljava/lang/Throwable;


# direct methods
.method public synthetic constructor <init>(Ll/hi2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ei2;->a:Ll/hi2;

    iput-object p2, p0, Ll/ei2;->b:Ljava/lang/Throwable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ei2;->a:Ll/hi2;

    iget-object p0, p0, Ll/ei2;->b:Ljava/lang/Throwable;

    invoke-static {v0, p0}, Ll/hi2;->f(Ll/hi2;Ljava/lang/Throwable;)V

    return-void
.end method
