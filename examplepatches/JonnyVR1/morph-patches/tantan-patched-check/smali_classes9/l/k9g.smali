.class public final synthetic Ll/k9g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l9g;


# direct methods
.method public synthetic constructor <init>(Ll/l9g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k9g;->a:Ll/l9g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k9g;->a:Ll/l9g;

    invoke-static {p0}, Ll/l9g;->j4(Ll/l9g;)V

    return-void
.end method
