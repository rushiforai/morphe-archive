.class public final synthetic Ll/qtw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/stw;


# direct methods
.method public synthetic constructor <init>(Ll/stw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qtw;->a:Ll/stw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qtw;->a:Ll/stw;

    invoke-static {p0}, Ll/stw;->J3(Ll/stw;)V

    return-void
.end method
