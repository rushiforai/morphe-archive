.class public final synthetic Ll/cko0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fko0;


# direct methods
.method public synthetic constructor <init>(Ll/fko0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cko0;->a:Ll/fko0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cko0;->a:Ll/fko0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/fko0;->f(Ll/fko0;Ljava/lang/Throwable;)V

    return-void
.end method
