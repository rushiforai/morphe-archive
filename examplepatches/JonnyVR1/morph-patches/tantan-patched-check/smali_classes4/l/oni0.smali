.class public final synthetic Ll/oni0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qni0;


# direct methods
.method public synthetic constructor <init>(Ll/qni0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/oni0;->a:Ll/qni0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oni0;->a:Ll/qni0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/qni0;->e0(Ll/qni0;Ljava/lang/Throwable;)V

    return-void
.end method
