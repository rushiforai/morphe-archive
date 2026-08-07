.class public final synthetic Ll/r5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/s5l;


# direct methods
.method public synthetic constructor <init>(Ll/s5l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r5l;->a:Ll/s5l;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5l;->a:Ll/s5l;

    invoke-static {p0}, Ll/s5l;->u(Ll/s5l;)V

    return-void
.end method
