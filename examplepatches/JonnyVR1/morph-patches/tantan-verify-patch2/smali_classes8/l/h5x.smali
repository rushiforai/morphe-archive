.class public final synthetic Ll/h5x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/i5x;


# direct methods
.method public synthetic constructor <init>(Ll/i5x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/h5x;->a:Ll/i5x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/h5x;->a:Ll/i5x;

    invoke-static {p0}, Ll/i5x;->x(Ll/i5x;)V

    return-void
.end method
