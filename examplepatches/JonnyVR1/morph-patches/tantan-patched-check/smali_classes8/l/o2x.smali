.class public final synthetic Ll/o2x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p2x;


# direct methods
.method public synthetic constructor <init>(Ll/p2x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o2x;->a:Ll/p2x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o2x;->a:Ll/p2x;

    invoke-static {p0}, Ll/p2x;->f(Ll/p2x;)V

    return-void
.end method
