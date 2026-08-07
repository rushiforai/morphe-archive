.class public final synthetic Ll/ao1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/do1;


# direct methods
.method public synthetic constructor <init>(Ll/do1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ao1;->a:Ll/do1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ao1;->a:Ll/do1;

    invoke-static {p0}, Ll/do1;->p0(Ll/do1;)V

    return-void
.end method
