.class public final synthetic Ll/d1o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/e1o;


# direct methods
.method public synthetic constructor <init>(Ll/e1o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d1o;->a:Ll/e1o;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d1o;->a:Ll/e1o;

    invoke-static {p0}, Ll/e1o;->f(Ll/e1o;)V

    return-void
.end method
