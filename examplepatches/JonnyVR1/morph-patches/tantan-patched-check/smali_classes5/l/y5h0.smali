.class public final synthetic Ll/y5h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y5h0;->a:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y5h0;->a:Ll/x20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/z5h0;->d(Ll/x20;Ljava/lang/Throwable;)V

    return-void
.end method
