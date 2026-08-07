.class public final synthetic Ll/cxb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/exb0;


# direct methods
.method public synthetic constructor <init>(Ll/exb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cxb0;->a:Ll/exb0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cxb0;->a:Ll/exb0;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/exb0;->I(Ll/exb0;Ljava/lang/Throwable;)V

    return-void
.end method
