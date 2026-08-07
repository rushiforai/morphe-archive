.class public final synthetic Ll/p27;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/q27;


# direct methods
.method public synthetic constructor <init>(Ll/q27;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p27;->a:Ll/q27;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p27;->a:Ll/q27;

    invoke-static {p0}, Ll/q27;->x(Ll/q27;)V

    return-void
.end method
