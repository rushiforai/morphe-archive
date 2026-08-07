.class public final synthetic Ll/z4h0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z4h0;->a:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z4h0;->a:Ljava/lang/Runnable;

    check-cast p1, Ll/tj3;

    invoke-static {p0, p1}, Ll/o5h0;->h(Ljava/lang/Runnable;Ll/tj3;)V

    return-void
.end method
