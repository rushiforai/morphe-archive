.class public final synthetic Ll/dyp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/gyp;


# direct methods
.method public synthetic constructor <init>(Ll/gyp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dyp;->a:Ll/gyp;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dyp;->a:Ll/gyp;

    invoke-static {p0}, Ll/gyp;->C(Ll/gyp;)V

    return-void
.end method
