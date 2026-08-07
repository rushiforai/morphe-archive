.class public final synthetic Ll/heq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/leq0$a;


# direct methods
.method public synthetic constructor <init>(Ll/leq0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/heq0;->a:Ll/leq0$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/heq0;->a:Ll/leq0$a;

    invoke-static {p0}, Ll/leq0;->b(Ll/leq0$a;)V

    return-void
.end method
