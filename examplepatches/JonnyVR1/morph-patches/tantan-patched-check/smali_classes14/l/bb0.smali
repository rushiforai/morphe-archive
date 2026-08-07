.class public final synthetic Ll/bb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cb0;


# direct methods
.method public synthetic constructor <init>(Ll/cb0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bb0;->a:Ll/cb0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bb0;->a:Ll/cb0;

    invoke-static {p0}, Ll/cb0;->y(Ll/cb0;)V

    return-void
.end method
