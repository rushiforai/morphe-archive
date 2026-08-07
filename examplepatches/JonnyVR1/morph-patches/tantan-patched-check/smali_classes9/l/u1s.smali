.class public final synthetic Ll/u1s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/v1s;


# direct methods
.method public synthetic constructor <init>(Ll/v1s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u1s;->a:Ll/v1s;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1s;->a:Ll/v1s;

    invoke-static {p0}, Ll/v1s;->J(Ll/v1s;)V

    return-void
.end method
