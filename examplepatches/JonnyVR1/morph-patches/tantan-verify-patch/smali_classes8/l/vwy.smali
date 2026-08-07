.class public final synthetic Ll/vwy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wwy;


# direct methods
.method public synthetic constructor <init>(Ll/wwy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vwy;->a:Ll/wwy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vwy;->a:Ll/wwy;

    invoke-static {p0}, Ll/wwy;->H(Ll/wwy;)V

    return-void
.end method
