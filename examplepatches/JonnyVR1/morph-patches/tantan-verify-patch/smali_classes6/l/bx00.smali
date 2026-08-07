.class public final synthetic Ll/bx00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cx00;


# direct methods
.method public synthetic constructor <init>(Ll/cx00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bx00;->a:Ll/cx00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bx00;->a:Ll/cx00;

    invoke-static {p0}, Ll/cx00;->a(Ll/cx00;)V

    return-void
.end method
