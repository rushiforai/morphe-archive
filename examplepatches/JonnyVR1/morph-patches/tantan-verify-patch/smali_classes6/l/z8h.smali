.class public final synthetic Ll/z8h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/a9h;


# direct methods
.method public synthetic constructor <init>(Ll/a9h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z8h;->a:Ll/a9h;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z8h;->a:Ll/a9h;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/a9h;->I(Ll/a9h;Ljava/lang/Throwable;)V

    return-void
.end method
