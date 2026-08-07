.class public final synthetic Ll/q3x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u3x;


# direct methods
.method public synthetic constructor <init>(Ll/u3x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q3x;->a:Ll/u3x;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q3x;->a:Ll/u3x;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/u3x;->y(Ll/u3x;Ljava/lang/Throwable;)V

    return-void
.end method
