.class public final synthetic Ll/ipx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jpx;


# direct methods
.method public synthetic constructor <init>(Ll/jpx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ipx;->a:Ll/jpx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ipx;->a:Ll/jpx;

    invoke-static {p0}, Ll/jpx;->V3(Ll/jpx;)V

    return-void
.end method
