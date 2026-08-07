.class public final synthetic Ll/idq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jdq0$a;


# direct methods
.method public synthetic constructor <init>(Ll/jdq0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/idq0;->a:Ll/jdq0$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/idq0;->a:Ll/jdq0$a;

    invoke-static {p0}, Ll/jdq0$a;->b(Ll/jdq0$a;)V

    return-void
.end method
