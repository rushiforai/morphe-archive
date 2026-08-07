.class public final synthetic Ll/bqb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uqb0;


# direct methods
.method public synthetic constructor <init>(Ll/uqb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bqb0;->a:Ll/uqb0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bqb0;->a:Ll/uqb0;

    invoke-static {p0}, Ll/uqb0;->V(Ll/uqb0;)V

    return-void
.end method
