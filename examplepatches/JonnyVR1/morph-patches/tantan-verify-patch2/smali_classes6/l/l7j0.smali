.class public final synthetic Ll/l7j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p7j0;


# direct methods
.method public synthetic constructor <init>(Ll/p7j0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l7j0;->a:Ll/p7j0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l7j0;->a:Ll/p7j0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/p7j0;->J(Ll/p7j0;Ljava/lang/Throwable;)V

    return-void
.end method
