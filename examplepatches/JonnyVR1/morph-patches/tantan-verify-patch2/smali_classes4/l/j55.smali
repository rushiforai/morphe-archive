.class public final synthetic Ll/j55;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/n55;


# direct methods
.method public synthetic constructor <init>(Ll/n55;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j55;->a:Ll/n55;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j55;->a:Ll/n55;

    invoke-static {p0}, Ll/n55;->x(Ll/n55;)V

    return-void
.end method
