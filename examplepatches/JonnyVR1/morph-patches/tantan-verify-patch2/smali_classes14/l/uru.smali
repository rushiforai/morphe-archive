.class public final synthetic Ll/uru;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/isu;


# direct methods
.method public synthetic constructor <init>(Ll/isu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uru;->a:Ll/isu;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uru;->a:Ll/isu;

    invoke-static {p0}, Ll/isu;->i(Ll/isu;)V

    return-void
.end method
