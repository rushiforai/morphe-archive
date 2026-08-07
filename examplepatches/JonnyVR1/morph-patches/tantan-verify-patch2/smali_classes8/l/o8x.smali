.class public final synthetic Ll/o8x;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v8x;


# direct methods
.method public synthetic constructor <init>(Ll/v8x;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o8x;->a:Ll/v8x;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o8x;->a:Ll/v8x;

    invoke-static {p0}, Ll/v8x;->G0(Ll/v8x;)V

    return-void
.end method
