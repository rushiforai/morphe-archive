.class public final synthetic Ll/qx20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/sx20;


# direct methods
.method public synthetic constructor <init>(Ll/sx20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qx20;->a:Ll/sx20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qx20;->a:Ll/sx20;

    invoke-static {p0}, Ll/sx20;->x(Ll/sx20;)V

    return-void
.end method
