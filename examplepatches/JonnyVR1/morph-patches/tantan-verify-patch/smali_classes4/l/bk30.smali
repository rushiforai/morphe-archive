.class public final synthetic Ll/bk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dk30;


# direct methods
.method public synthetic constructor <init>(Ll/dk30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bk30;->a:Ll/dk30;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bk30;->a:Ll/dk30;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/dk30;->h0(Ll/dk30;Ljava/lang/Throwable;)V

    return-void
.end method
