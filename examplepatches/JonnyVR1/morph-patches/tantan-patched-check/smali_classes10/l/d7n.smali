.class public final synthetic Ll/d7n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/e7n;


# direct methods
.method public synthetic constructor <init>(Ll/e7n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d7n;->a:Ll/e7n;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d7n;->a:Ll/e7n;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Ll/e7n;->y4(Ljava/lang/Throwable;)V

    return-void
.end method
