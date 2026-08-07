.class public final synthetic Ll/hun;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/oun;

.field public final synthetic b:Z

.field public final synthetic c:Ll/qrr;


# direct methods
.method public synthetic constructor <init>(Ll/oun;ZLl/qrr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hun;->a:Ll/oun;

    iput-boolean p2, p0, Ll/hun;->b:Z

    iput-object p3, p0, Ll/hun;->c:Ll/qrr;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hun;->a:Ll/oun;

    iget-boolean v1, p0, Ll/hun;->b:Z

    iget-object p0, p0, Ll/hun;->c:Ll/qrr;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/oun;->f3(Ll/oun;ZLl/qrr;Ljava/lang/Throwable;)V

    return-void
.end method
