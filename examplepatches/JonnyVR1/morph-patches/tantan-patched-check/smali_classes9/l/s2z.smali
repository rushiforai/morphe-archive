.class public final synthetic Ll/s2z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/d3z;


# direct methods
.method public synthetic constructor <init>(Ll/d3z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s2z;->a:Ll/d3z;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s2z;->a:Ll/d3z;

    invoke-static {p0}, Ll/d3z;->w(Ll/d3z;)V

    return-void
.end method
