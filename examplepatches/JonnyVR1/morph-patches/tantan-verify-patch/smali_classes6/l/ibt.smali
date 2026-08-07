.class public final synthetic Ll/ibt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/jbt;


# direct methods
.method public synthetic constructor <init>(Ll/jbt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibt;->a:Ll/jbt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibt;->a:Ll/jbt;

    invoke-static {p0}, Ll/jbt;->t(Ll/jbt;)V

    return-void
.end method
